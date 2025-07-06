import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

class CensusInjector implements ModuleInjector {
  @override
  void injectDataSources(Injector injector) =>
      injector.registerLazySingleton<CensusRemoteDataSource>(
        () => CensusRemoteDataSourceImpl(
          client: injector.get<NetworkClient>(
            instanceName: InjectorConstant.interoparibilityClient,
          ),
        ),
      );
  @override
  void injectRepositories(Injector injector) =>
      injector.registerLazySingleton<CensusRepository>(
        () => CensusRepositoryImpl(
          logger: injector.get<Log>(),
          remoteDataSource: injector.get<CensusRemoteDataSource>(),
        ),
      );

  @override
  void injectUseCases(Injector injector) =>
      injector
        ..registerLazySingleton<GetListOfCensusEvents>(
          () => GetListOfCensusEvents(repo: injector.get<CensusRepository>()),
        )
        ..registerLazySingleton<GetListOfCensusTopic>(
          () => GetListOfCensusTopic(repo: injector.get<CensusRepository>()),
        )
        ..registerLazySingleton<GetListOfCensusArea>(
          () => GetListOfCensusArea(repo: injector.get<CensusRepository>()),
        )
        ..registerLazySingleton<GetListOfCensusDatasets>(
          () => GetListOfCensusDatasets(repo: injector.get<CensusRepository>()),
        )
        ..registerLazySingleton<GetCensusData>(
          () => GetCensusData(repo: injector.get<CensusRepository>()),
        );
}
