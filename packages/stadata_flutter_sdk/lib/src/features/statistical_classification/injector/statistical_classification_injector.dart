import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

class StatisticalClassificationInjector implements ModuleInjector {
  @override
  void injectDataSources(Injector injector) {
    injector.registerLazySingleton<StatisticClassificationRemoteDataSource>(
      StatisticClassificationRemoteDataSourceImpl.new,
    );
  }

  @override
  void injectRepositories(Injector injector) {
    injector.registerLazySingleton<StatisticClassificationRepository>(
      StatisticClassificationRepositoryImpl.new,
    );
  }

  @override
  void injectUseCases(Injector injector) {
    injector
      ..registerLazySingleton<GetStatisticClassification>(
        GetStatisticClassification.new,
      )
      ..registerLazySingleton<GetDetailStatisticClassification>(
        GetDetailStatisticClassification.new,
      );
  }
}
