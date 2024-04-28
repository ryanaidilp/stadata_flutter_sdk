import 'package:stadata_flutter_sdk/src/core/di/injector.dart';
import 'package:stadata_flutter_sdk/src/core/di/module_injector.dart';
import 'package:stadata_flutter_sdk/src/features/news/data/datasources/news_remote_data_source.dart';
import 'package:stadata_flutter_sdk/src/features/news/data/repositories/news_repository_impl.dart';
import 'package:stadata_flutter_sdk/src/features/news/domain/repositories/news_repository.dart';
import 'package:stadata_flutter_sdk/src/features/news/domain/usecases/get_all_news.dart';
import 'package:stadata_flutter_sdk/src/features/news/domain/usecases/get_detail_news.dart';

/// News feature dependency injector
class NewsInjector implements ModuleInjector {
  @override
  void injectDataSources(Injector injector) => injector
    ..registerLazySingleton<NewsRemoteDataSource>(
      NewsRemoteDataSourceImpl.new,
    );

  @override
  void injectRepositories(Injector injector) => injector
    ..registerLazySingleton<NewsRepository>(
      NewsRepositoryImpl.new,
    );

  @override
  void injectUseCases(Injector injector) => injector
    ..registerLazySingleton<GetAllNews>(
      GetAllNews.new,
    )
    ..registerLazySingleton<GetDetailNews>(
      GetDetailNews.new,
    );
}
