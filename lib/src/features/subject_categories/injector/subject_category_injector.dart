import 'package:stadata_flutter_sdk/src/core/di/injector.dart';
import 'package:stadata_flutter_sdk/src/core/di/module_injector.dart';
import 'package:stadata_flutter_sdk/src/features/subject_categories/data/datasources/subject_category_remote_data_source.dart';
import 'package:stadata_flutter_sdk/src/features/subject_categories/data/repositories/subject_category_repository_impl.dart';
import 'package:stadata_flutter_sdk/src/features/subject_categories/domain/repositories/subject_category_repository.dart';
import 'package:stadata_flutter_sdk/src/features/subject_categories/domain/usecases/get_all_subject_categories.dart';

/// Subject Category dependency injector
class SubjectCategoryInjector implements ModuleInjector {
  @override
  void injectDataSources(Injector injector) => injector
    ..registerLazySingleton<SubjectCategoryRemoteDataSource>(
      SubjectCategoryRemoteDataSourceImpl.new,
    );

  @override
  void injectRepositories(Injector injector) => injector
    ..registerLazySingleton<SubjectCategoryRepository>(
      SubjectCategoryRepositoryImpl.new,
    );

  @override
  void injectUseCases(Injector injector) => injector
    ..registerLazySingleton<GetAllSubjectCategories>(
      GetAllSubjectCategories.new,
    );
}
