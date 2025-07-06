import 'package:meta/meta.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

abstract class CensusRemoteDataSource {
  Future<ApiResponseModel<List<CensusEventModel>>> get();
  Future<ApiResponseModel<List<CensusTopicModel>>> getCensusTopics({
    required String censusID,
  });
  Future<ApiResponseModel<List<CensusAreaModel>>> getCensusArea({
    required String censusID,
  });
  Future<ApiResponseModel<List<CensusDatasetModel>>> getCensusDatasets({
    required String censusID,
    required int topicID,
  });
  Future<ApiResponseModel<List<CensusDataModel>>> getCensusData({
    required String censusID,
    required String censusAreaID,
    required String datasetID,
  });
}

class CensusRemoteDataSourceImpl implements CensusRemoteDataSource {
  @internal
  final NetworkClient client;

  const CensusRemoteDataSourceImpl({required this.client});

  @override
  Future<ApiResponseModel<List<CensusEventModel>>> get() async {
    final result = await client.get<JSON>(
      ApiEndpoint.census,
      queryParams: {QueryParamConstant.id: '37'},
    );

    if (result.containsKey('status') && result['status'] == 'Error') {
      throw ApiException(result['message']?.toString() ?? '');
    }

    final response = ApiResponseModel<List<CensusEventModel>>.fromJson(result, (
      json,
    ) {
      if (json == null || json is! List) {
        return [];
      }

      return json.map((e) => CensusEventModel.fromJson(e as JSON)).toList();
    });

    if (response.dataAvailability == DataAvailability.listNotAvailable) {
      throw const CensusDataNotAvailableException();
    }

    return response;
  }

  @override
  Future<ApiResponseModel<List<CensusTopicModel>>> getCensusTopics({
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

  @override
  Future<ApiResponseModel<List<CensusAreaModel>>> getCensusArea({
    required String censusID,
  }) async {
    final result = await client.get<JSON>(
      ApiEndpoint.census,
      queryParams: {
        QueryParamConstant.id: '39',
        QueryParamConstant.event: censusID,
      },
    );

    if (result.containsKey('status') && result['status'] == 'Error') {
      throw ApiException(result['message']?.toString() ?? '');
    }

    final response = ApiResponseModel<List<CensusAreaModel>>.fromJson(result, (
      json,
    ) {
      if (json == null || json is! List) {
        return [];
      }

      return json.map((e) => CensusAreaModel.fromJson(e as JSON)).toList();
    });

    if (response.dataAvailability == DataAvailability.listNotAvailable) {
      throw const CensusAreaNotAvailableException();
    }

    return response;
  }

  @override
  Future<ApiResponseModel<List<CensusDatasetModel>>> getCensusDatasets({
    required String censusID,
    required int topicID,
  }) async {
    final result = await client.get<JSON>(
      ApiEndpoint.census,
      queryParams: {
        QueryParamConstant.id: '40',
        QueryParamConstant.event: censusID,
        QueryParamConstant.topic: topicID.toString(),
      },
    );

    if (result.containsKey('status') && result['status'] == 'Error') {
      throw ApiException(result['message']?.toString() ?? '');
    }

    final response = ApiResponseModel<List<CensusDatasetModel>>.fromJson(
      result,
      (
        json,
      ) {
        if (json == null || json is! List) {
          return [];
        }

        return json.map((e) => CensusDatasetModel.fromJson(e as JSON)).toList();
      },
    );

    if (response.dataAvailability == DataAvailability.listNotAvailable) {
      throw const CensusDatasetNotAvailableException();
    }

    return response;
  }

  @override
  Future<ApiResponseModel<List<CensusDataModel>>> getCensusData({
    required String censusID,
    required String censusAreaID,
    required String datasetID,
  }) async {
    final result = await client.get<JSON>(
      ApiEndpoint.census,
      queryParams: {
        QueryParamConstant.id: '41',
        QueryParamConstant.event: censusID,
        QueryParamConstant.censusArea: censusAreaID,
        QueryParamConstant.dataset: datasetID,
      },
    );

    if (result.containsKey('status') && result['status'] == 'Error') {
      throw ApiException(result['message']?.toString() ?? '');
    }

    // First, parse the original response as CensusDataWrapper
    final wrapperResponse = ApiResponseModel<CensusDataWrapper>.fromJson(
      result,
      (json) {
        if (json == null) {
          // Return empty wrapper if no data
          return CensusDataWrapper(
            status: 200,
            dataCount: 0,
            timestamp: DateTime.now(),
            data: const [],
          );
        }

        // Parse the wrapper object from the nested structure
        if (json is Map<String, dynamic>) {
          return CensusDataWrapper.fromJson(json);
        }

        // Return empty wrapper for unexpected structure
        return CensusDataWrapper(
          status: 200,
          dataCount: 0,
          timestamp: DateTime.now(),
          data: const [],
        );
      },
    );

    if (wrapperResponse.dataAvailability == DataAvailability.listNotAvailable) {
      throw const CensusDataNotAvailableException();
    }

    // Extract the census data from the wrapper and create new response
    final censusDataList = wrapperResponse.data?.data ?? <CensusDataModel>[];

    final response = ApiResponseModel<List<CensusDataModel>>(
      status: wrapperResponse.status,
      dataAvailability: wrapperResponse.dataAvailability,
      message: wrapperResponse.message,
      pagination: wrapperResponse.pagination,
      data: censusDataList,
    );

    return response;
  }
}
