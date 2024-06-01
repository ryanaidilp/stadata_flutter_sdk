import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

/// Press Release dependency injector
class PressReleaseInjector implements ModuleInjector {
  @override
  void injectDataSources(Injector injector) => injector
    ..registerLazySingleton<PressReleaseRemoteDataSource>(
      PressReleaseRemoteDataSourceImpl.new,
    );

  @override
  void injectRepositories(Injector injector) => injector
    ..registerLazySingleton<PressReleaseRepository>(
      PressReleaseRepositoryImpl.new,
    );

  @override
  void injectUseCases(Injector injector) => injector
    ..registerLazySingleton<GetAllPressReleases>(
      GetAllPressReleases.new,
    )
    ..registerLazySingleton<GetDetailPressRelease>(
      GetDetailPressRelease.new,
    );
}
