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

/// A use case for fetching a list of publications.
@LazySingleton()
class GetAllPublication
    implements
        UseCase<ApiResponse<List<Publication>>, GetPublicationParam,
            PublicationRepository> {
  @override
  Future<Either<Failure, ApiResponse<List<Publication>>>> call(
    GetPublicationParam param,
  ) =>
      repo.get(
        domain: param.domain,
        keyword: param.keyword,
        lang: param.lang,
        month: param.month,
        page: param.page,
        year: param.year,
      );

  @override
  PublicationRepository get repo => getIt<PublicationRepository>();
}

/// Parameters for fetching publications.
class GetPublicationParam extends Equatable {
  /// Constructor of GetPublicationParam
  const GetPublicationParam({
    required this.domain,
    this.lang = DataLanguage.id,
    this.page = 1,
    this.keyword,
    this.month,
    this.year,
  });

  /// The domain for which publications are requested.
  final String domain;

  /// The data language for the request.
  final DataLanguage lang;

  /// The page number to retrieve.
  final int page;

  /// A keyword to filter publications by.
  final String? keyword;

  /// The month to filter publications by.
  final int? month;

  /// The year to filter publications by.
  final int? year;

  @override
  List<Object?> get props {
    return [
      domain,
      lang,
      page,
      keyword,
      month,
      year,
    ];
  }
}
