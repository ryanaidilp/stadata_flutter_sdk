import 'package:meta/meta.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

abstract class CensusRemoteDataSource {
  Future<ApiResponseModel<List<CensusModel>>> get();
  Future<ApiResponseModel<List<CensusTopic>>> getCensusTopics({
    required String censusID,
  });
}

class CensusRemoteDataSourceImpl implements CensusRemoteDataSource {
  @internal
  final NetworkClient client;

  const CensusRemoteDataSourceImpl({required this.client});

  @override
  Future<ApiResponseModel<List<CensusModel>>> get() async {
    final cancelToken = CancelToken();
    final result = await client.get<JSON>(
      ApiEndpoint.census,
      queryParams: {QueryParamConstant.id: '37'},
      cancelToken: cancelToken,
    );

    if (result.containsKey('status') && result['status'] == 'Error') {
      throw ApiException(result['message']?.toString() ?? '');
    }

    final response = ApiResponseModel<List<CensusModel>>.fromJson(result, (
      json,
    ) {
      if (json == null || json is! List) {
        return [];
      }

      return json.map((e) => CensusModel.fromJson(e as JSON)).toList();
    });

    if (response.dataAvailability == DataAvailability.listNotAvailable) {
      throw const CensusDataNotAvailableException();
    }

    return response;
  }

  @override
  Future<ApiResponseModel<List<CensusTopic>>> getCensusTopics({
    required String censusID,
  }) async {
    final result = await client.get<JSON>(
      ApiEndpoint.census,
      queryParams: {
        QueryParamConstant.id: '38',
        QueryParamConstant.event: censusID,
      },
    );

    if (result.containsKey('status') && result['status'] == 'Error') {
      throw ApiException(result['message']?.toString() ?? '');
    }

    final response = ApiResponseModel<List<CensusTopicModel>>.fromJson(result, (
      json,
    ) {
      if (json == null || json is! List) {
        return [];
      }

      return json.map((e) => CensusTopicModel.fromJson(e as JSON)).toList();
    });

    if (response.dataAvailability == DataAvailability.listNotAvailable) {
      throw const CensusTopicNotAvailableException();
    }

    return response;
  }
}
