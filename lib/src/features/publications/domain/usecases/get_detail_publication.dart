import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/di/service_locator.dart';
import 'package:stadata_flutter_sdk/src/core/failures/failures.dart';
import 'package:stadata_flutter_sdk/src/features/publications/domain/entities/publication.dart';
import 'package:stadata_flutter_sdk/src/features/publications/domain/repositories/publication_repository.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/entities/api_response.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/enums/data_language.dart';

/// A use case for fetching detailed information about a publication.
@LazySingleton()
class GetDetailPublication
    implements
        UseCase<ApiResponse<Publication>, GetPublicationDetailParam,
            PublicationRepository> {
  @override
  Future<Either<Failure, ApiResponse<Publication>>> call(
    GetPublicationDetailParam param,
  ) =>
      repo.detail(
        id: param.id,
        domain: param.domain,
        lang: param.lang,
      );

  @override
  PublicationRepository get repo => getIt<PublicationRepository>();
}

/// Parameters for fetching detailed information about a publication.
class GetPublicationDetailParam extends Equatable {
  /// Constructor of [GetPublicationDetailParam]
  const GetPublicationDetailParam({
    required this.id,
    required this.domain,
    this.lang = DataLanguage.id,
  });

  /// The unique identifier of the publication.
  final String id;

  /// The domain for which the publication detail is requested.
  final String domain;

  /// The data language for the request (default is [DataLanguage.id]).
  final DataLanguage lang;

  @override
  List<Object> get props => [id, domain, lang];
}
