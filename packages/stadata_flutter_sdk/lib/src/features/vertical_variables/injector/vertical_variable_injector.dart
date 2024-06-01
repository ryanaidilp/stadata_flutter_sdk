import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

/// Vertical variable dependency injector
class VerticalVariableInjector implements ModuleInjector {
  @override
  void injectDataSources(Injector injector) => injector
    ..registerLazySingleton<VerticalVariableRemoteDataSource>(
      VerticalVariableRemoteDataSourceImpl.new,
    );

  @override
  void injectRepositories(Injector injector) => injector
    ..registerLazySingleton<VerticalVariableRepository>(
      VerticalVariableRepositoryImpl.new,
    );

  @override
  void injectUseCases(Injector injector) => injector
    ..registerLazySingleton<GetAllVerticalVariables>(
      GetAllVerticalVariables.new,
    );
}
