import 'package:stadata_flutter_sdk/src/core/di/injector.dart';

Injector injector = Injector.instance;

void _removeIfRegistered<T extends Object>({
  String? instanceName,
}) {
  if (injector.isRegistered<T>(instanceName: instanceName)) {
    injector.unregister<T>(instanceName: instanceName);
  }
}

void registerTestFactory<T extends Object>(
  T mockObject, {
  String? instanceName,
}) {
  _removeIfRegistered<T>(instanceName: instanceName);
  injector.register<T>(
    mockObject,
    instanceName: instanceName,
  );
}

void registerTestSingleton<T extends Object>(
  T mockObject, {
  String? instanceName,
}) {
  _removeIfRegistered<T>(instanceName: instanceName);
  injector.registerSingleton<T>(
    mockObject,
    instanceName: instanceName,
  );
}

void registerTestLazySingleton<T extends Object>(
  T mockObject, {
  String? instanceName,
}) {
  _removeIfRegistered<T>(instanceName: instanceName);
  injector.registerLazySingleton<T>(
    () => mockObject,
    instanceName: instanceName,
  );
}

void unregisterTestInjection() {
  injector.reset();
}
