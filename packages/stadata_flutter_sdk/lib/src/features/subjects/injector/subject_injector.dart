import 'package:stadata_flutter_sdk/src/core/di/injector.dart';
import 'package:stadata_flutter_sdk/src/core/di/module_injector.dart';
import 'package:stadata_flutter_sdk/src/features/subjects/data/datasources/subject_remote_data_source.dart';
import 'package:stadata_flutter_sdk/src/features/subjects/data/repositories/subject_repository_impl.dart';
import 'package:stadata_flutter_sdk/src/features/subjects/domain/repositories/subject_repository.dart';
import 'package:stadata_flutter_sdk/src/features/subjects/domain/usecases/get_all_subjects.dart';

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
