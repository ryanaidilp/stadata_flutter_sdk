import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

/// DerivedVariable dependency injector
class DerivedVariableInjector implements ModuleInjector {
  @override
  void injectDataSources(Injector injector) =>
      injector..registerLazySingleton<DerivedVariableRemoteDataSource>(
        DerivedVariableRemoteDataSourceImpl.new,
      );

  @override
  void injectRepositories(Injector injector) =>
      injector..registerLazySingleton<DerivedVariableRepository>(
        DerivedVariableRepositoryImpl.new,
      );

  @override
  void injectUseCases(Injector injector) =>
      injector..registerLazySingleton<GetAllDerivedVariables>(
        GetAllDerivedVariables.new,
      );
}
