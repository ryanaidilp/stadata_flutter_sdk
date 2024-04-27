import 'package:stadata_flutter_sdk/src/core/di/injector.dart';
import 'package:stadata_flutter_sdk/src/core/di/module_injector.dart';
import 'package:stadata_flutter_sdk/src/features/strategic_indicators/data/datasources/strategic_indicator_remote_data_source.dart';
import 'package:stadata_flutter_sdk/src/features/strategic_indicators/data/repositories/strategic_indicator_repository_impl.dart';
import 'package:stadata_flutter_sdk/src/features/strategic_indicators/domain/usecases/get_all_strategic_indicators.dart';
import 'package:stadata_flutter_sdk/src/features/strategic_indicators/strategic_indicators.dart';

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
