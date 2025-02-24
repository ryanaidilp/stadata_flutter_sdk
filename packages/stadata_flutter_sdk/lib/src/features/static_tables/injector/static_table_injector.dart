import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

/// Static Table dependency injector
class StaticTableInjector implements ModuleInjector {
  @override
  void injectDataSources(Injector injector) =>
      injector..registerLazySingleton<StaticTableRemoteDataSource>(
        StaticTableRemoteDataSourceImpl.new,
      );

  @override
  void injectRepositories(Injector injector) =>
      injector..registerLazySingleton<StaticTableRepository>(
        StaticTableRepositoryImpl.new,
      );

  @override
  void injectUseCases(Injector injector) =>
      injector
        ..registerLazySingleton<GetAllStaticTables>(GetAllStaticTables.new)
        ..registerLazySingleton<GetDetailStaticTable>(GetDetailStaticTable.new);
}
