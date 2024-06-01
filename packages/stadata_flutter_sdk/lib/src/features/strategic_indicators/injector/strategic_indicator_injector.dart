import 'package:stadata_flutter_sdk/src/core/di/injector.dart';
import 'package:stadata_flutter_sdk/src/core/di/module_injector.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

/// Strategic Indicator dependency injector
class StrategicIndicatorInjector implements ModuleInjector {
  @override
  void injectDataSources(Injector injector) => injector
    ..registerLazySingleton<StrategicIndicatorRemoteDataSource>(
      StrategicIndicatorRemoteDataSourceImpl.new,
    );

  @override
  void injectRepositories(Injector injector) => injector
    ..registerLazySingleton<StrategicIndicatorRepository>(
      StrategicIndicatorRepositoryImpl.new,
    );

  @override
  void injectUseCases(Injector injector) => injector
    ..registerLazySingleton<GetAllStrategicIndicators>(
      GetAllStrategicIndicators.new,
    );
}
