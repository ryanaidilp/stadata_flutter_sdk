// ignore_for_file: public_member_api_docs

import 'package:stadata_flutter_sdk/src/core/di/injector.dart';
import 'package:stadata_flutter_sdk/src/core/exceptions/exceptions.dart';
import 'package:stadata_flutter_sdk/src/core/network/api_endpoint.dart';

import 'package:stadata_flutter_sdk/src/core/network/http/modules/stadata_http_module.dart';
import 'package:stadata_flutter_sdk/src/core/typedef/typedef.dart';
import 'package:stadata_flutter_sdk/src/features/domains/data/models/domain_model.dart';
import 'package:stadata_flutter_sdk/src/features/domains/domain/enums/domain_type.dart';
import 'package:stadata_flutter_sdk/src/shared/data/models/api_response_model.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/enums/data_availability.dart';

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
