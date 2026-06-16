import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/trade/domain/entities/entities.dart';
import 'package:stadata_flutter_sdk/src/features/trade/domain/params/params.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

/// Repository interface for foreign trade data operations.
///
/// Defines the contract for retrieving foreign trade (export/import) data
/// from the BPS Web API `dataexim` endpoint.
abstract class TradeRepository {
  /// Retrieves a list of foreign trade records matching the given [param].
  ///
  /// Returns a [Result] containing either:
  /// - Success: [ApiResponse] with list of [TradeData]
  /// - Failure: [Failure] describing the error
  Future<Result<Failure, ApiResponse<List<TradeData>>>> getTrade(
    TradeParam param,
  );
}
