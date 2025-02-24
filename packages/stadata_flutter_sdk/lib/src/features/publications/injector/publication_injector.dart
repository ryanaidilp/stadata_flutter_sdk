import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

/// Publication Dependency Injector
class PublicationInjector implements ModuleInjector {
  @override
  void injectDataSources(Injector injector) =>
      injector..registerLazySingleton<PublicationRemoteDataSource>(
        PublicationRemoteDataSourceImpl.new,
      );

  @override
  void injectRepositories(Injector injector) =>
      injector..registerLazySingleton<PublicationRepository>(
        PublicationRepositoryImpl.new,
      );

  @override
  void injectUseCases(Injector injector) =>
      injector
        ..registerLazySingleton<GetAllPublication>(GetAllPublication.new)
        ..registerLazySingleton<GetDetailPublication>(GetDetailPublication.new);
}
