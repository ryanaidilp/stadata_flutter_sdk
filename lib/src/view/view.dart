// ignore_for_file: one_member_abstracts

import 'package:injectable/injectable.dart';
import 'package:stadata_flutter_sdk/src/core/di/service_locator.dart';
import 'package:stadata_flutter_sdk/src/features/publications/domain/usecases/get_detail_publication.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

/// An abstract class for retrieving detailed information about various types
/// of data such as publications, domains, etc.
///
/// Implementations of this class provide methods to fetch details for specific
/// items within a domain.
abstract class StadataView {
  /// Fetches detailed information about a publication.
  ///
  /// - [id]: The unique identifier of the publication.
  /// - [domain]: The domain to which the publication belongs.
  /// - [lang]: The data language  of request (default is [DataLanguage.id]).
  Future<Publication?> publication({
    required String id,
    required String domain,
    DataLanguage lang = DataLanguage.id,
  });
}

/// Implementation of the [StadataView] interface.
///
/// This class provides methods to retrieve detailed information about
/// various data items within a domain.
@LazySingleton(as: StadataView)
class StadataViewImpl implements StadataView {
  final _getDetailPublication = getIt<GetDetailPublication>();

  @override
  Future<Publication?> publication({
    required String id,
    required String domain,
    DataLanguage lang = DataLanguage.id,
  }) async {
    final result = await _getDetailPublication(
      GetPublicationDetailParam(
        id: id,
        domain: domain,
        lang: lang,
      ),
    );

    return result.fold(
      (l) => throw Exception(l.message),
      (r) => r.data,
    );
  }
}
