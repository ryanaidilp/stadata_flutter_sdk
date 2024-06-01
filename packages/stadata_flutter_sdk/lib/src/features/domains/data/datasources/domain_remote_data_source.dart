// ignore_for_file: public_member_api_docs

import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

abstract class DomainRemoteDataSource {
  Future<ApiResponseModel<List<DomainModel>?>> get({
    required DomainType type,
    String? provinceCode,
  });
}

class DomainRemoteDataSourceImpl implements DomainRemoteDataSource {
  final client = injector.get<StadataHttpModule>();

  @override
  Future<ApiResponseModel<List<DomainModel>?>> get({
    required DomainType type,
    String? provinceCode,
  }) async {
    if (type == DomainType.regencyByProvince && provinceCode == null) {
      throw const DomainProvinceCodeException();
    }

    final result = await client.get(
      ApiEndpoint.domain(
        type: type,
        provinceCode: provinceCode,
      ),
    );

    final response = ApiResponseModel<List<DomainModel>?>.fromJson(
      result,
      (json) {
        if (json == null || json is! List) {
          return null;
        }

        return json.map((e) => DomainModel.fromJson(e as JSON)).toList();
      },
    );

    if (response.dataAvailability == DataAvailability.listNotAvailable) {
      throw const DomainNotAvailableException();
    }

    return response;
  }
}
