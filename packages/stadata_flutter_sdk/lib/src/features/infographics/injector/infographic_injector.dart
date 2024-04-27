import 'package:stadata_flutter_sdk/src/core/di/injector.dart';
import 'package:stadata_flutter_sdk/src/core/di/module_injector.dart';
import 'package:stadata_flutter_sdk/src/features/infographics/data/datasources/infographic_remote_data_source.dart';
import 'package:stadata_flutter_sdk/src/features/infographics/data/repositories/infographic_repository_impl.dart';
import 'package:stadata_flutter_sdk/src/features/infographics/domain/repositories/infographic_repository.dart';
import 'package:stadata_flutter_sdk/src/features/infographics/domain/usecases/get_all_infographics.dart';

/// Dependency injector for Infographic
class InfographicInjector implements ModuleInjector {
  @override
  void injectDataSources(Injector injector) => injector
    ..registerLazySingleton<InfographicRemoteDataSource>(
      InfographicRemoteDataSourceImpl.new,
    );

  @override
  void injectRepositories(Injector injector) => injector
    ..registerLazySingleton<InfographicRepository>(
      InfographicRepositoryImpl.new,
    );

  @override
  void injectUseCases(Injector injector) => injector
    ..registerLazySingleton<GetAllInfographics>(
      GetAllInfographics.new,
    );
}
