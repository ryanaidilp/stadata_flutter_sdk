import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

/// Abstract interface for DerivedPeriod remote data source.
abstract class DerivedPeriodRemoteDataSource {
  /// Fetches derived periods from the remote API.
  Future<ApiResponseModel<List<DerivedPeriodModel>?>> get({
    required String domain,
    int page = 1,
    DataLanguage lang = DataLanguage.id,
    int? variableID,
  });
}

/// Implementation of [DerivedPeriodRemoteDataSource] that fetches data from BPS API.
class DerivedPeriodRemoteDataSourceImpl
    implements DerivedPeriodRemoteDataSource {
  final NetworkClient _listHttpModule = injector.get<NetworkClient>(
    instanceName: InjectorConstant.listClient,
  );

  @override
  Future<ApiResponseModel<List<DerivedPeriodModel>?>> get({
    required String domain,
    int page = 1,
    DataLanguage lang = DataLanguage.id,
    int? variableID,
  }) async {
    final result = await _listHttpModule.get<JSON>(
      ApiEndpoint.derivedPeriod,
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

    final response = ApiResponseModel<List<DerivedPeriodModel>?>.fromJson(
      result,
      (
        json,
      ) {
        if (json == null || json is! List) {
          return null;
        }

        return json.map((e) => DerivedPeriodModel.fromJson(e as JSON)).toList();
      },
    );

    if (response.dataAvailability == DataAvailability.listNotAvailable) {
      throw const DerivedPeriodNotAvailableException();
    }

    return response;
  }
}
