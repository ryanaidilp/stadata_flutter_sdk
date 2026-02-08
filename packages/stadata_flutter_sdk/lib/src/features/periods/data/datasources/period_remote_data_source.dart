import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

/// Abstract interface for Period remote data source.
///
/// Defines the contract for fetching period data from the BPS API.
abstract class PeriodRemoteDataSource {
  /// Fetches periods from the remote API.
  ///
  /// Returns an [ApiResponseModel] containing a list of [PeriodModel] objects.
  /// Throws [PeriodNotAvailableException] if no data is available.
  /// Throws [ApiException] if the API returns an error.
  Future<ApiResponseModel<List<PeriodModel>?>> get({
    required String domain,
    int page = 1,
    DataLanguage lang = DataLanguage.id,
    int? variableID,
  });
}

/// Implementation of [PeriodRemoteDataSource] that fetches data from BPS API.
class PeriodRemoteDataSourceImpl implements PeriodRemoteDataSource {
  final NetworkClient _listHttpModule = injector.get<NetworkClient>(
    instanceName: InjectorConstant.listClient,
  );

  @override
  Future<ApiResponseModel<List<PeriodModel>?>> get({
    required String domain,
    int page = 1,
    DataLanguage lang = DataLanguage.id,
    int? variableID,
  }) async {
    final result = await _listHttpModule.get<JSON>(
      ApiEndpoint.period,
      queryParams: {
        QueryParamConstant.page: page,
        QueryParamConstant.domain: domain,
        QueryParamConstant.lang: lang.value,
        if (variableID != null) QueryParamConstant.variable: variableID,
      },
    );

    if (result.containsKey('status') && result['status'] == 'Error') {
      throw ApiException(result['message']?.toString() ?? '');
    }

    final response = ApiResponseModel<List<PeriodModel>?>.fromJson(result, (
      json,
    ) {
      if (json == null || json is! List) {
        return null;
      }

      return json.map((e) => PeriodModel.fromJson(e as JSON)).toList();
    });

    if (response.dataAvailability == DataAvailability.listNotAvailable) {
      throw const PeriodNotAvailableException();
    }

    return response;
  }
}
