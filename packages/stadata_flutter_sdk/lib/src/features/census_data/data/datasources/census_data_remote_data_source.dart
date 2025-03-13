import 'package:meta/meta.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

abstract class CensusDataRemoteDataSource {
  Future<ApiResponseModel<List<CensusModel>>> get();
}

class CensusDataRemoteDataSourceImpl implements CensusDataRemoteDataSource {
  @internal
  final NetworkClient client;

  const CensusDataRemoteDataSourceImpl({required this.client});

  @override
  Future<ApiResponseModel<List<CensusModel>>> get() async {
    final result = await client.get<JSON>(
      ApiEndpoint.census,
      queryParams: {QueryParamConstant.id: '37'},
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
      throw const CensusDataNotAvailableExcetion();
    }

    return response;
  }
}
