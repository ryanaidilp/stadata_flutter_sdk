// ignore_for_file: use_if_null_to_convert_nulls_to_bools

import 'package:logger/logger.dart';
import 'package:stadata_flutter_sdk/src/config/api_config.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/list/list.dart';
import 'package:stadata_flutter_sdk/src/view/view.dart';

class Injector {
  factory Injector() => _instance;

  Injector._internal();
  static final Injector _instance = Injector._internal();

  static Injector get instance => _instance;

  static void init({required List<ModuleInjector> modules}) {
    final registerModule = _RegisterModule();

    _instance
      ..registerLazySingleton<ApiConfig>(ApiConfig.new)
      ..registerLazySingleton<Log>(Log.new)
      ..factory<Logger>(registerModule.logger)
      ..registerLazySingleton<StadataList>(StadataListImpl.new)
      ..factory<NetworkClient>(registerModule.httpClient)
      ..factory<NetworkClient>(
        registerModule.listHttpClient,
        instanceName: InjectorConstant.listClient,
      )
      ..factory<NetworkClient>(
        registerModule.viewHttpClient,
        instanceName: InjectorConstant.viewClient,
      )
      ..factory<NetworkClient>(
        registerModule.interoperabilityHttpClient,
        instanceName: InjectorConstant.interoparibilityClient,
      )
      ..registerLazySingleton<StadataView>(StadataViewImpl.new);

    for (final module in modules) {
      module
        ..injectDataSources(_instance)
        ..injectRepositories(_instance)
        ..injectUseCases(_instance);
    }
  }

  final _services = <Type, Map<String?, dynamic>>{};
  final _lazySingletons = <Type, Map<String?, dynamic>>{};

  void factory<T>(T service, {String? instanceName}) {
    _registerService<T>(service, _services, instanceName ?? T.toString());
  }

  void registerSingleton<T>(T service, {String? instanceName}) {
    _registerService<T>(service, _services, instanceName ?? T.toString());
    _lazySingletons.remove(T);
  }

  void registerLazySingleton<T>(
    InstanceCreator<T> createInstance, {
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

      if (lazySingletonCreator != null) {
        final instance = lazySingletonCreator();
        _registerService<T>(instance, _services, instanceName ?? T.toString());
        _lazySingletons.remove(T);
        return instance;
      }

      throw Exception(
        'Service not found for type $T and instanceName $instanceName',
      );
    } catch (e) {
      throw Exception(e.toString());
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
    InstanceCreator<T> createInstance,
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

  InstanceCreator<T>? _getLazySingletonCreator<T>(
    Map<Type, Map<String?, dynamic>> registry,
    String? instanceName,
  ) {
    final creatorMap = registry[T];
    return creatorMap != null
        ? creatorMap[instanceName] as InstanceCreator<T>
        : null;
  }
}

class _RegisterModule extends RegisterModule {}

/// Global injector instance.
final injector = Injector();
