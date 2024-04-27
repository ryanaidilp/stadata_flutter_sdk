import 'package:stadata_flutter_sdk/src/core/di/injector.dart';
import 'package:stadata_flutter_sdk/src/core/di/module_injector.dart';
import 'package:stadata_flutter_sdk/src/features/units/data/datasources/unit_data_remote_data_source.dart';
import 'package:stadata_flutter_sdk/src/features/units/data/repositories/unit_data_repository_impl.dart';
import 'package:stadata_flutter_sdk/src/features/units/domain/repositories/unit_data_repository.dart';
import 'package:stadata_flutter_sdk/src/features/units/domain/usecases/get_all_units.dart';

/// Unit dependency injector
class UnitInjector implements ModuleInjector {
  @override
  void injectDataSources(Injector injector) => injector
    ..registerLazySingleton<UnitDataRemoteDataSource>(
      UnitDataRemoteDataSourceImpl.new,
    );

  @override
  void injectRepositories(Injector injector) => injector
    ..registerLazySingleton<UnitDataRepository>(
      UnitDataRepositoryImpl.new,
    );

  @override
  void injectUseCases(Injector injector) => injector
    ..registerLazySingleton<GetAllUnits>(
      GetAllUnits.new,
    );
}
