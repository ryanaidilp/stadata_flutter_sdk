import 'package:stadata_flutter_sdk/src/core/di/injector.dart';
import 'package:stadata_flutter_sdk/src/core/di/module_injector.dart';
import 'package:stadata_flutter_sdk/src/features/vertical_variables/data/datasources/vertical_variable_remote_data_source.dart';
import 'package:stadata_flutter_sdk/src/features/vertical_variables/data/repositories/vertical_variable_repository_impl.dart';
import 'package:stadata_flutter_sdk/src/features/vertical_variables/domain/repositories/vertical_variable_repository.dart';
import 'package:stadata_flutter_sdk/src/features/vertical_variables/domain/usecases/get_all_vertical_variables.dart';

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
