import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

abstract interface class StatisticClassificationRemoteDataSource {
  Future<ApiResponseModel<List<StatisticClassificationModel>>> get({
    required ClassificationType type,
    ClassificationLevel? level,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    int perPage = 10,
  });
  Future<ApiResponseModel<List<StatisticClassificationModel>>> detail({
    required String id,
    required ClassificationType type,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    int perPage = 10,
  });
}

class StatisticClassificationRemoteDataSourceImpl
    implements StatisticClassificationRemoteDataSource {
  final _listClient = injector.get<NetworkClient>(
    instanceName: InjectorConstant.listClient,
  );
  final _viewClient = injector.get<NetworkClient>(
    instanceName: InjectorConstant.viewClient,
  );

  @override
  Future<ApiResponseModel<List<StatisticClassificationModel>>> detail({
    required String id,
    required ClassificationType type,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    int perPage = 10,
  }) async {
    final result = await _viewClient.get<JSON>(
      ApiEndpoint.statisticClassification(type: type),
      queryParams: {
        QueryParamConstant.id: id,
        QueryParamConstant.page: page,
        QueryParamConstant.lang: lang.value,
        QueryParamConstant.perPage: perPage,
      },
    );

    final response =
        ApiResponseModel<List<StatisticClassificationModel>>.fromJson(result, (
          json,
        ) {
          if (json is! List) {
            return [];
          }

          final jsonList = json.map((e) => e as Map).toList();

          final dataList = jsonList.map(JSON.from).toList();

          return dataList
              .map(
                (e) => StatisticClassificationModel.fromJson(
                  JSON.from(e['_source'] as Map),
                ),
              )
              .toList();
        });

    if (response.dataAvailability == DataAvailability.notAvailable) {
      throw const StatisticClassificationNotAvailableException();
    }

    return response;
  }

  @override
  Future<ApiResponseModel<List<StatisticClassificationModel>>> get({
    required ClassificationType type,
    ClassificationLevel? level,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    int perPage = 10,
  }) async {
    final result = await _listClient.get<JSON>(
      ApiEndpoint.statisticClassification(type: type),
      queryParams: {
        if (level != null) QueryParamConstant.level: level.value,
        QueryParamConstant.lang: lang.value,
        QueryParamConstant.page: page,
        QueryParamConstant.perPage: perPage,
      },
    );

    final response =
        ApiResponseModel<List<StatisticClassificationModel>>.fromJson(result, (
          json,
        ) {
          if (json is! List) {
            return [];
          }

          final jsonList = json.map((e) => e as Map).toList();

          final dataList = jsonList.map(JSON.from).toList();

          return dataList
              .map(
                (e) => StatisticClassificationModel.fromJson(
                  JSON.from(e['_source'] as Map),
                ),
              )
              .toList();
        });

    if (response.dataAvailability == DataAvailability.listNotAvailable) {
      throw const StatisticClassificationNotAvailableException();
    }

    return response;
  }
}
