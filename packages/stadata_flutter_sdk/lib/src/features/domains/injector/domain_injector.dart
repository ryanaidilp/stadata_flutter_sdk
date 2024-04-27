import 'package:stadata_flutter_sdk/src/core/di/injector.dart';
import 'package:stadata_flutter_sdk/src/core/di/module_injector.dart';
import 'package:stadata_flutter_sdk/src/features/domains/data/datasources/domain_remote_data_source.dart';
import 'package:stadata_flutter_sdk/src/features/domains/data/repositories/domain_repository_impl.dart';
import 'package:stadata_flutter_sdk/src/features/domains/domain/repositories/domain_repository.dart';
import 'package:stadata_flutter_sdk/src/features/domains/domain/usecases/get_domains.dart';

/// Domain Dependency Injector
class DomainInjector implements ModuleInjector {
  @override
  void injectDataSources(Injector injector) => injector
    ..registerLazySingleton<DomainRemoteDataSource>(
      DomainRemoteDataSourceImpl.new,
    );

  @override
  void injectRepositories(Injector injector) => injector
    ..registerLazySingleton<DomainRepository>(DomainRepositoryImpl.new);

  @override
  void injectUseCases(Injector injector) =>
      injector..registerLazySingleton<GetDomains>(GetDomains.new);
}
