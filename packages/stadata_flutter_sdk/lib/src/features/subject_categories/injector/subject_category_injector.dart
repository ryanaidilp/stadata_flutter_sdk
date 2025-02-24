import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

/// Subject Category dependency injector
class SubjectCategoryInjector implements ModuleInjector {
  @override
  void injectDataSources(Injector injector) =>
      injector..registerLazySingleton<SubjectCategoryRemoteDataSource>(
        SubjectCategoryRemoteDataSourceImpl.new,
      );

  @override
  void injectRepositories(Injector injector) =>
      injector..registerLazySingleton<SubjectCategoryRepository>(
        SubjectCategoryRepositoryImpl.new,
      );

  @override
  void injectUseCases(Injector injector) =>
      injector..registerLazySingleton<GetAllSubjectCategories>(
        GetAllSubjectCategories.new,
      );
}
