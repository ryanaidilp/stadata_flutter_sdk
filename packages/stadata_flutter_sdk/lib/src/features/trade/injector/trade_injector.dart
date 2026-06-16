import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/trade/data/data.dart';
import 'package:stadata_flutter_sdk/src/features/trade/domain/repositories/trade_repository.dart';
import 'package:stadata_flutter_sdk/src/features/trade/domain/usecases/get_trade.dart';

/// Trade feature dependency injector.
class TradeInjector implements ModuleInjector {
  @override
  void injectDataSources(Injector injector) =>
      injector.registerLazySingleton<TradeRemoteDataSource>(
        TradeRemoteDataSourceImpl.new,
      );

  @override
  void injectRepositories(Injector injector) =>
      injector.registerLazySingleton<TradeRepository>(TradeRepositoryImpl.new);

  @override
  void injectUseCases(Injector injector) =>
      injector.registerLazySingleton<GetTrade>(GetTrade.new);
}
