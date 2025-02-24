import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

/// Domain Dependency Injector
class DomainInjector implements ModuleInjector {
  @override
  void injectDataSources(Injector injector) =>
      injector..registerLazySingleton<DomainRemoteDataSource>(
        DomainRemoteDataSourceImpl.new,
      );

  @override
  void injectRepositories(Injector injector) =>
      injector
        ..registerLazySingleton<DomainRepository>(DomainRepositoryImpl.new);

  @override
  void injectUseCases(Injector injector) =>
      injector..registerLazySingleton<GetDomains>(GetDomains.new);
}
