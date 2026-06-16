// Repository implementations use generic catch for comprehensive error handling
// ignore_for_file: avoid_catches_without_on_clauses
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/trade/data/datasources/trade_remote_data_source.dart';
import 'package:stadata_flutter_sdk/src/features/trade/domain/entities/entities.dart';
import 'package:stadata_flutter_sdk/src/features/trade/domain/params/params.dart';
import 'package:stadata_flutter_sdk/src/features/trade/domain/repositories/trade_repository.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

/// Implementation of [TradeRepository].
///
/// Delegates to [TradeRemoteDataSource] and transforms the response
/// into domain entities, handling errors via [TradeFailure].
class TradeRepositoryImpl implements TradeRepository {
  final TradeRemoteDataSource _remoteDataSource = injector
      .get<TradeRemoteDataSource>();
  final Log _log = injector.get<Log>();

  @override
  Future<Result<Failure, ApiResponse<List<TradeData>>>> getTrade(
    TradeParam param,
  ) async {
    try {
      final response = await _remoteDataSource.getTrade(param);

      final data = response.data ?? [];

      return Result.success(
        ApiResponse<List<TradeData>>(
          data: data,
          status: response.status,
          message: response.message,
          pagination: response.pagination,
          dataAvailability: response.dataAvailability,
        ),
      );
    } catch (e, s) {
      _log.console(e.toString(), error: e, stackTrace: s, type: LogType.error);
      return Result.failure(TradeFailure(message: e.toString()));
    }
  }
}
