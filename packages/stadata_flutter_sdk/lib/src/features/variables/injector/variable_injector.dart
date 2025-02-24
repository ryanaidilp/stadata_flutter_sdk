import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

/// Variable dependency injector
class VariableInjector implements ModuleInjector {
  @override
  void injectDataSources(Injector injector) =>
      injector..registerLazySingleton<VariableRemoteDataSource>(
        VariableRemoteDataSourceImpl.new,
      );

  @override
  void injectRepositories(Injector injector) =>
      injector
        ..registerLazySingleton<VariableRepository>(VariableRepositoryImpl.new);

  @override
  void injectUseCases(Injector injector) =>
      injector..registerLazySingleton<GetAllVariables>(GetAllVariables.new);
}
