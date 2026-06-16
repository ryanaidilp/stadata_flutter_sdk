import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/trade/data/models/models.dart';
import 'package:stadata_flutter_sdk/src/features/trade/domain/params/params.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

/// Abstract interface for the trade remote data source.
///
/// Defines the contract for fetching foreign trade data from the BPS
/// `dataexim` API endpoint.
abstract class TradeRemoteDataSource {
  /// Retrieves a list of foreign trade records for the given [param].
  ///
  /// Throws [TradeNotAvailableException] if no data is available.
  Future<ApiResponseModel<List<TradeDataModel>>> getTrade(TradeParam param);
}

/// Implementation of [TradeRemoteDataSource] using the base network client.
///
/// The `dataexim` endpoint is at the API root (no `list/` or `view/` prefix),
/// so this implementation uses the base [NetworkClient] without a named instance.
class TradeRemoteDataSourceImpl implements TradeRemoteDataSource {
  final NetworkClient _client = injector.get<NetworkClient>();

  @override
  Future<ApiResponseModel<List<TradeDataModel>>> getTrade(
    TradeParam param,
  ) async {
    final result = await _client.get<JSON>(
      ApiEndpoint.trade,
      queryParams: {
        'sumber': param.source.value,
        'periode': param.period.value,
        'kodehs': param.hsCode,
        'jenishs': param.hsType.value,
        'tahun': param.year,
      },
    );

    if (result.containsKey('status') && result['status'] == 'Error') {
      throw ApiException(result['message']?.toString() ?? '');
    }

    final response = ApiResponseModel<List<TradeDataModel>>.fromJson(result, (
      json,
    ) {
      if (json == null || json is! List) {
        return [];
      }

      return json.map((e) => TradeDataModel.fromJson(e as JSON)).toList();
    });

    if (response.dataAvailability == DataAvailability.listNotAvailable) {
      throw const TradeNotAvailableException();
    }

    return response;
  }
}
