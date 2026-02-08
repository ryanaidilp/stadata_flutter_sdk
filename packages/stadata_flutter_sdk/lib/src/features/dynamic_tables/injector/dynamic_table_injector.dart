import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/dynamic_tables/data/data.dart';
import 'package:stadata_flutter_sdk/src/features/dynamic_tables/domain/repositories/dynamic_table_repository.dart';
import 'package:stadata_flutter_sdk/src/features/dynamic_tables/domain/usecases/get_all_dynamic_tables.dart';
import 'package:stadata_flutter_sdk/src/features/dynamic_tables/domain/usecases/get_detail_dynamic_table.dart';

/// Dynamic Table dependency injector
class DynamicTableInjector implements ModuleInjector {
  @override
  void injectDataSources(Injector injector) =>
      injector..registerLazySingleton<DynamicTableRemoteDataSource>(
        DynamicTableRemoteDataSourceImpl.new,
      );

  @override
  void injectRepositories(Injector injector) =>
      injector..registerLazySingleton<DynamicTableRepository>(
        DynamicTableRepositoryImpl.new,
      );

  @override
  void injectUseCases(Injector injector) =>
      injector
        ..registerLazySingleton<GetAllDynamicTables>(GetAllDynamicTables.new)
        ..registerLazySingleton<GetDetailDynamicTable>(
          GetDetailDynamicTable.new,
        );
}
