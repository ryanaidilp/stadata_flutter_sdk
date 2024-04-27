import 'package:stadata_flutter_sdk/src/core/di/injector.dart';
import 'package:stadata_flutter_sdk/src/core/di/module_injector.dart';
import 'package:stadata_flutter_sdk/src/features/variables/data/datasources/variable_remote_data_source.dart';
import 'package:stadata_flutter_sdk/src/features/variables/data/repositories/variable_repository_impl.dart';
import 'package:stadata_flutter_sdk/src/features/variables/domain/repositories/variable_repository.dart';
import 'package:stadata_flutter_sdk/src/features/variables/domain/usecases/get_all_variables.dart';

/// Variable dependency injector
class VariableInjector implements ModuleInjector {
  @override
  void injectDataSources(Injector injector) => injector
    ..registerLazySingleton<VariableRemoteDataSource>(
      VariableRemoteDataSourceImpl.new,
    );

  @override
  void injectRepositories(Injector injector) => injector
    ..registerLazySingleton<VariableRepository>(
      VariableRepositoryImpl.new,
    );

  @override
  void injectUseCases(Injector injector) => injector
    ..registerLazySingleton<GetAllVariables>(
      GetAllVariables.new,
    );
}
