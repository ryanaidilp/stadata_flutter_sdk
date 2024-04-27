// ignore_for_file: use_if_null_to_convert_nulls_to_bools, avoid_dynamic_calls, public_member_api_docs, lines_longer_than_80_chars

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';
import 'package:stadata_flutter_sdk/src/core/di/module_injector.dart';
import 'package:stadata_flutter_sdk/src/core/di/register_module.dart';
import 'package:stadata_flutter_sdk/src/core/log/log.dart';
import 'package:stadata_flutter_sdk/src/core/network/http/http_client.dart';
import 'package:stadata_flutter_sdk/src/core/storage/local_storage.dart';
import 'package:stadata_flutter_sdk/src/core/storage/secure_storage_impl.dart';

/// Global injector instance.
final injector = Injector.instance;

class Injector {
  factory Injector() => _instance;

  Injector._internal();
  static final Injector _instance = Injector._internal();

  static Injector get instance => _instance;

  static void init({
    required List<ModuleInjector> modules,
  }) {
    final registerModule = _RegisterModule();
    injector
      ..register<FlutterSecureStorage>(
        registerModule.secureStorage,
      )
      ..register<HttpClient>(
        registerModule.listHttpClient,
        instanceName: 'listClient',
      )
      ..register<HttpClient>(
        registerModule.viewHttpClient,
        instanceName: 'viewClient',
      )
      ..registerLazySingleton<LocalStorage>(
        SecureStorageImpl.new,
        instanceName: 'secure',
      )
      ..registerLazySingleton<Log>(Log.new)
      ..register<HttpClient>(registerModule.httpClient)
      ..register<Logger>(registerModule.logger);

    for (final module in modules) {
      module
        ..injectDataSources(injector)
        ..injectRepositories(injector)
        ..injectUseCases(injector);
    }
  }

  final _services = <Type, Map<String?, dynamic>>{};
  final _lazySingletons = <Type, Map<String?, dynamic>>{};

  void register<T>(T service, {String? instanceName}) {
    _registerService<T>(service, _services, instanceName ?? T.toString());
  }

  void registerSingleton<T>(T service, {String? instanceName}) {
    _registerService<T>(service, _services, instanceName ?? T.toString());
    _lazySingletons.remove(T);
  }

  void registerLazySingleton<T>(
    void Function() createInstance, {
    String? instanceName,
  }) {
    _registerLazySingleton<T>(createInstance, instanceName ?? T.toString());
  }

  T get<T>({String? instanceName}) {
    try {
      final service = _getService<T>(_services, instanceName ?? T.toString());
      if (service != null) {
        return service as T;
      }

      final lazySingletonCreator = _getLazySingletonCreator<T>(
        _lazySingletons,
        instanceName ?? T.toString(),
      );
      if (lazySingletonCreator != null && lazySingletonCreator is Function) {
        final instance = lazySingletonCreator();
        _registerService<T>(
          instance as T,
          _services,
          instanceName ?? T.toString(),
        );
        _lazySingletons.remove(T);
        return instance;
      }

      throw Exception(
        'Service not found for type $T and instanceName $instanceName',
      );
    } catch (e) {
      throw Exception(
        'Service not found for type $T and instanceName $instanceName',
      );
    }
  }

  void unregister<T>({String? instanceName}) {
    _services[T]?.remove(instanceName ?? T.toString());
    _lazySingletons[T]?.remove(instanceName ?? T.toString());
  }

  bool isRegistered<T>({String? instanceName}) {
    final serviceMap = _services[T];
    final singletonMap = _lazySingletons[T];

    return serviceMap?.containsKey(instanceName ?? T.toString()) == true ||
        singletonMap?.containsKey(instanceName ?? T.toString()) == true;
  }

  void reset() {
    _services.clear();
    _lazySingletons.clear();
  }

  void _registerService<T>(
    T service,
    Map<Type, Map<String?, dynamic>> registry,
    String? instanceName,
  ) {
    if (!registry.containsKey(T)) {
      registry[T] = {};
    }

    registry[T]?[instanceName] = service;
  }

  void _registerLazySingleton<T>(
    void Function() createInstance,
    String? instanceName,
  ) {
    if (!_lazySingletons.containsKey(T)) {
      _lazySingletons[T] = {};
    }
    _lazySingletons[T]?[instanceName] = createInstance;
  }

  dynamic _getService<T>(
    Map<Type, Map<String?, dynamic>> registry,
    String? instanceName,
  ) {
    final serviceMap = registry[T];
    return serviceMap != null ? serviceMap[instanceName] : null;
  }

  dynamic _getLazySingletonCreator<T>(
    Map<Type, Map<String?, dynamic>> registry,
    String? instanceName,
  ) {
    final creatorMap = registry[T];
    return creatorMap != null ? creatorMap[instanceName] : null;
  }
}

class _RegisterModule extends RegisterModule {}
