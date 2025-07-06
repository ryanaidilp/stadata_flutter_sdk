import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

/// News category dependency injector
class NewsCategoryInjector implements ModuleInjector {
  @override
  void injectDataSources(Injector injector) =>
      injector..registerLazySingleton<NewsCategoryRemoteDataSource>(
        NewsCategoryRemoteDataSourceImpl.new,
      );

  @override
  void injectRepositories(Injector injector) =>
      injector..registerLazySingleton<NewsCategoryRepository>(
        NewsCategoryRepositoryImpl.new,
      );

  @override
  void injectUseCases(Injector injector) =>
      injector
        ..registerLazySingleton<GetAllNewsCategories>(GetAllNewsCategories.new);
}
