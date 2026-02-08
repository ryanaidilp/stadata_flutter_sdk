import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/tables/data/data.dart';
import 'package:stadata_flutter_sdk/src/features/tables/domain/domain.dart';

/// Table metadata dependency injector.
///
/// Registers all dependencies required for the unified table metadata
/// feature, including data sources, repositories, and use cases.
class TableInjector implements ModuleInjector {
  @override
  void injectDataSources(Injector injector) {
    injector.registerLazySingleton<TableRemoteDataSource>(
      TableRemoteDataSourceImpl.new,
    );
  }

  @override
  void injectRepositories(Injector injector) {
    injector.registerLazySingleton<TableRepository>(
      TableRepositoryImpl.new,
    );
  }

  @override
  void injectUseCases(Injector injector) {
    injector.registerLazySingleton<GetTableMetadata>(
      GetTableMetadata.new,
    );
  }
}
