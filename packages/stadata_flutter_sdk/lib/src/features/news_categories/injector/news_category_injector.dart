import 'package:stadata_flutter_sdk/src/core/di/injector.dart';
import 'package:stadata_flutter_sdk/src/core/di/module_injector.dart';
import 'package:stadata_flutter_sdk/src/features/news_categories/data/datasources/news_category_remote_data_source.dart';
import 'package:stadata_flutter_sdk/src/features/news_categories/data/repositories/news_category_repository_impl.dart';
import 'package:stadata_flutter_sdk/src/features/news_categories/domain/repositories/news_category_repository.dart';
import 'package:stadata_flutter_sdk/src/features/news_categories/domain/usecases/get_all_news_categories.dart';

/// News category dependency injector
class NewsCategoryInjector implements ModuleInjector {
  @override
  void injectDataSources(Injector injector) => injector
    ..registerLazySingleton<NewsCategoryRemoteDataSource>(
      NewsCategoryRemoteDataSourceImpl.new,
    );

  @override
  void injectRepositories(Injector injector) => injector
    ..registerLazySingleton<NewsCategoryRepository>(
      NewsCategoryRepositoryImpl.new,
    );

  @override
  void injectUseCases(Injector injector) => injector
    ..registerLazySingleton<GetAllNewsCategories>(
      GetAllNewsCategories.new,
    );
}
