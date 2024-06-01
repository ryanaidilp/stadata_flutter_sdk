import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:stadata_flutter_sdk/src/base/usecase.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

/// A use case for fetching detailed information about a publication.

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
  PublicationRepository get repo => injector.get<PublicationRepository>();
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
