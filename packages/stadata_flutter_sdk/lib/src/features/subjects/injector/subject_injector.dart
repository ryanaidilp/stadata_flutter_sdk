import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

/// Subject dependency injector
class SubjectInjector implements ModuleInjector {
  @override
  void injectDataSources(Injector injector) => injector
    ..registerLazySingleton<SubjectRemoteDataSource>(
      SubjectRemoteDataSourceImpl.new,
    );

  @override
  void injectRepositories(Injector injector) => injector
    ..registerLazySingleton<SubjectRepository>(
      SubjectRepositoryImpl.new,
    );

  @override
  void injectUseCases(Injector injector) => injector
    ..registerLazySingleton<GetAllSubjects>(
      GetAllSubjects.new,
    );
}
