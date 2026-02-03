import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

/// Period dependency injector
///
/// Registers all Period-related dependencies (data sources, repositories, use cases)
/// into the dependency injection container.
class PeriodInjector implements ModuleInjector {
  @override
  void injectDataSources(Injector injector) =>
      injector..registerLazySingleton<PeriodRemoteDataSource>(
        PeriodRemoteDataSourceImpl.new,
      );

  @override
  void injectRepositories(Injector injector) =>
      injector
        ..registerLazySingleton<PeriodRepository>(PeriodRepositoryImpl.new);

  @override
  void injectUseCases(Injector injector) =>
      injector..registerLazySingleton<GetAllPeriods>(GetAllPeriods.new);
}
