import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

abstract class VariableRemoteDataSource {
  Future<ApiResponseModel<List<VariableModel>?>> get({
    required String domain,
    int page = 1,
    DataLanguage lang = DataLanguage.id,
    bool showExistingVariables = false,
    int? year,
    int? subjectID,
  });
}

class VariableRemoteDataSourceImpl implements VariableRemoteDataSource {
  final _listHttpModule =
      injector.get<NetworkClient>(instanceName: 'listClient');

  @override
  Future<ApiResponseModel<List<VariableModel>?>> get({
    required String domain,
    int page = 1,
    DataLanguage lang = DataLanguage.id,
    bool showExistingVariables = false,
    int? year,
    int? subjectID,
  }) async {
    final result = await _listHttpModule.get<JSON>(
      ApiEndpoint.variables(
        lang: lang,
        page: page,
        domain: domain,
        showExistingVariables: showExistingVariables,
        year: year,
        subjectID: subjectID,
      ),
    );

    final response = ApiResponseModel<List<VariableModel>?>.fromJson(
      result,
      (json) {
        if (json == null || json is! List) {
          return null;
        }

        return json.map((e) => VariableModel.fromJson(e as JSON)).toList();
      },
    );

    if (response.dataAvailability == DataAvailability.listNotAvailable) {
      throw const VariableNotAvailableException();
    }

    return response;
  }
}
