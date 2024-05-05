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
        model: type.value,
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
        if (json is! List<Map>) {
          return [];
        }

        final dataList = json.map((e) => e['_source'] as JSON).toList();

        return dataList
            .map(
              StatisticClassificationModel.fromJson,
            )
            .toList();
      },
    );

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
        model: type.value,
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
        if (json is! List<Map>) {
          return [];
        }

        final dataList = json.map((e) => e['_source'] as JSON).toList();

        return dataList
            .map(
              StatisticClassificationModel.fromJson,
            )
            .toList();
      },
    );

    return response;
  }
}
