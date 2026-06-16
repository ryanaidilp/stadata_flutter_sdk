import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/trade/domain/entities/entities.dart';
import 'package:stadata_flutter_sdk/src/features/trade/domain/params/params.dart';
import 'package:stadata_flutter_sdk/src/features/trade/domain/repositories/trade_repository.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

/// Use case for retrieving foreign trade data from BPS Web API.
///
/// Fetches export or import trade statistics aggregated by HS commodity code,
/// port, and trading partner country via the `dataexim` endpoint.
///
/// Example:
/// ```dart
/// final useCase = GetTrade();
/// final result = await useCase(
///   TradeParam(
///     source: TradeSource.export,
///     period: TradePeriod.annually,
///     hsCode: '01',
///     hsType: HSCodeType.twoDigit,
///     year: '2023',
///   ),
/// );
/// ```
class GetTrade
    implements
        UseCase<ApiResponse<List<TradeData>>, TradeParam, TradeRepository> {
  @override
  Future<Result<Failure, ApiResponse<List<TradeData>>>> call(
    TradeParam param,
  ) => repo.getTrade(param);

  @override
  TradeRepository get repo => injector.get<TradeRepository>();
}
