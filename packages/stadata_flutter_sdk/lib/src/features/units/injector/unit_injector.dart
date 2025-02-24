import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

/// Unit dependency injector
class UnitInjector implements ModuleInjector {
  @override
  void injectDataSources(Injector injector) =>
      injector..registerLazySingleton<UnitDataRemoteDataSource>(
        UnitDataRemoteDataSourceImpl.new,
      );

  @override
  void injectRepositories(Injector injector) =>
      injector
        ..registerLazySingleton<UnitDataRepository>(UnitDataRepositoryImpl.new);

  @override
  void injectUseCases(Injector injector) =>
      injector..registerLazySingleton<GetAllUnits>(GetAllUnits.new);
}
