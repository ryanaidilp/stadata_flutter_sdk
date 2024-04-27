import 'package:stadata_flutter_sdk/src/core/di/injector.dart';
import 'package:stadata_flutter_sdk/src/core/di/module_injector.dart';
import 'package:stadata_flutter_sdk/src/features/press_releases/data/datasources/press_release_remote_data_source.dart';
import 'package:stadata_flutter_sdk/src/features/press_releases/data/repositories/press_release_repository_impl.dart';
import 'package:stadata_flutter_sdk/src/features/press_releases/domain/repositories/press_release_repository.dart';
import 'package:stadata_flutter_sdk/src/features/press_releases/domain/usecases/get_all_press_releases.dart';
import 'package:stadata_flutter_sdk/src/features/press_releases/domain/usecases/get_detail_press_release.dart';

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
