import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

class CensusDataInjector implements ModuleInjector {
  @override
  void injectDataSources(Injector injector) =>
      injector.registerLazySingleton<CensusRemoteDataSource>(
        () => CensusRemoteDataSourceImpl(
          client: injector.get<NetworkClient>(
            instanceName: InjectorConstant.listClient,
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
  void injectUseCases(Injector injector) {
    injector.registerLazySingleton<GetListOfCensus>(
      () => GetListOfCensus(repo: injector.get<CensusRepository>()),
    );
  }
}
