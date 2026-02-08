import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

/// DerivedPeriod dependency injector
class DerivedPeriodInjector implements ModuleInjector {
  @override
  void injectDataSources(Injector injector) =>
      injector..registerLazySingleton<DerivedPeriodRemoteDataSource>(
        DerivedPeriodRemoteDataSourceImpl.new,
      );

  @override
  void injectRepositories(Injector injector) =>
      injector..registerLazySingleton<DerivedPeriodRepository>(
        DerivedPeriodRepositoryImpl.new,
      );

  @override
  void injectUseCases(Injector injector) =>
      injector..registerLazySingleton<GetAllDerivedPeriods>(
        GetAllDerivedPeriods.new,
      );
}
