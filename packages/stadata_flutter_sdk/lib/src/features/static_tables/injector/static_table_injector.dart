import 'package:stadata_flutter_sdk/src/core/di/injector.dart';
import 'package:stadata_flutter_sdk/src/core/di/module_injector.dart';
import 'package:stadata_flutter_sdk/src/features/static_tables/data/datasources/static_table_remote_data_source.dart';
import 'package:stadata_flutter_sdk/src/features/static_tables/data/repositories/static_table_repository_impl.dart';
import 'package:stadata_flutter_sdk/src/features/static_tables/domain/repositories/static_table_repository.dart';
import 'package:stadata_flutter_sdk/src/features/static_tables/domain/usecases/get_all_static_tables.dart';
import 'package:stadata_flutter_sdk/src/features/static_tables/domain/usecases/get_detail_static_table.dart';

/// Static Table dependency injector
class StaticTableInjector implements ModuleInjector {
  @override
  void injectDataSources(Injector injector) => injector
    ..registerLazySingleton<StaticTableRemoteDataSource>(
      StaticTableRemoteDataSourceImpl.new,
    );

  @override
  void injectRepositories(Injector injector) => injector
    ..registerLazySingleton<StaticTableRepository>(
      StaticTableRepositoryImpl.new,
    );

  @override
  void injectUseCases(Injector injector) => injector
    ..registerLazySingleton<GetAllStaticTables>(
      GetAllStaticTables.new,
    )
    ..registerLazySingleton<GetDetailStaticTable>(
      GetDetailStaticTable.new,
    );
}
