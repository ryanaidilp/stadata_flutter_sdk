import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

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
