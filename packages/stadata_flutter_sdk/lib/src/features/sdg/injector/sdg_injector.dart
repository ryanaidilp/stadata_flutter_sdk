import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

class SdgInjector implements ModuleInjector {
  @override
  void injectDataSources(Injector injector) =>
      injector..registerLazySingleton<SdgRemoteDataSource>(
        SdgRemoteDataSourceImpl.new,
      );

  @override
  void injectRepositories(Injector injector) =>
      injector..registerLazySingleton<SdgRepository>(SdgRepositoryImpl.new);

  @override
  void injectUseCases(Injector injector) =>
      injector..registerLazySingleton<GetAllSdgIndicators>(
        GetAllSdgIndicators.new,
      );
}
