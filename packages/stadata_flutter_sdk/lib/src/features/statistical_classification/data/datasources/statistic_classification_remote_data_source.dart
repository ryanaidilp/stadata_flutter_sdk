import 'package:stadata_flutter_sdk/src/core/di/injector.dart';
import 'package:stadata_flutter_sdk/src/core/network/api_endpoint.dart';
import 'package:stadata_flutter_sdk/src/core/network/http/modules/stadata_list_http_module.dart';
import 'package:stadata_flutter_sdk/src/core/network/http/modules/stadata_view_http_module.dart';
import 'package:stadata_flutter_sdk/src/core/typedef/typedef.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/api_response_model.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

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
  final _listClient = injector.get<StadataListHttpModule>();
  final _viewClient = injector.get<StadataViewHttpModule>();

  @override
  Future<ApiResponseModel<List<StatisticClassificationModel>>> detail({
    required String id,
    required ClassificationType type,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    int perPage = 10,
  }) async {
    final result = await _viewClient.get(
      ApiEndpoint.statisticClassification(
        type: type,
      ),
      param: {
        'id': id,
        'lang': lang.value,
        'page': page,
        'perpage': perPage,
      },
    );

    final response =
        ApiResponseModel<List<StatisticClassificationModel>>.fromJson(
      result,
      (json) {
        if (json is! List) {
          return [];
        }

        final jsonList = json.map((e) => e as Map).toList();

        final dataList = jsonList
            .map(
              JSON.from,
            )
            .toList();

        return dataList
            .map(
              (e) => StatisticClassificationModel.fromJson(
                JSON.from(e['_source'] as Map),
              ),
            )
            .toList();
      },
    );

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
    final result = await _listClient.get(
      ApiEndpoint.statisticClassification(
        type: type,
      ),
      param: {
        if (level != null) 'level': level.value,
        'lang': lang.value,
        'page': page,
        'perpage': perPage,
      },
    );

    final response =
        ApiResponseModel<List<StatisticClassificationModel>>.fromJson(
      result,
      (json) {
        if (json is! List) {
          return [];
        }

        final jsonList = json.map((e) => e as Map).toList();

        final dataList = jsonList
            .map(
              JSON.from,
            )
            .toList();

        return dataList
            .map(
              (e) => StatisticClassificationModel.fromJson(
                JSON.from(e['_source'] as Map),
              ),
            )
            .toList();
      },
    );

    if (response.dataAvailability == DataAvailability.listNotAvailable) {
      throw const StatisticClassificationNotAvailableException();
    }

    return response;
  }
}
