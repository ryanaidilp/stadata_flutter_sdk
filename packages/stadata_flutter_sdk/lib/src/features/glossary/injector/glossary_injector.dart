import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

class GlossaryInjector implements ModuleInjector {
  @override
  void injectDataSources(Injector injector) =>
      injector..registerLazySingleton<GlossaryRemoteDataSource>(
        GlossaryRemoteDataSourceImpl.new,
      );

  @override
  void injectRepositories(Injector injector) =>
      injector..registerLazySingleton<GlossaryRepository>(
        GlossaryRepositoryImpl.new,
      );

  @override
  void injectUseCases(Injector injector) =>
      injector..registerLazySingleton<GetAllGlossary>(GetAllGlossary.new);
}
