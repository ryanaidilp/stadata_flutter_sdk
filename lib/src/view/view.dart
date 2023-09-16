import 'package:injectable/injectable.dart';
import 'package:stadata_flutter_sdk/src/core/di/service_locator.dart';
import 'package:stadata_flutter_sdk/src/features/news/domain/usecases/get_detail_news.dart';
import 'package:stadata_flutter_sdk/src/features/publications/domain/usecases/get_detail_publication.dart';
import 'package:stadata_flutter_sdk/src/features/static_tables/domain/usecases/get_detail_static_table.dart';
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

  /// Fetches detailed information about a static table.
  ///
  /// - [id]: The unique identifier of the static table.
  /// - [domain]: The domain to which the static table belongs.
  /// - [lang]: The data language  of request (default is [DataLanguage.id]).
  Future<StaticTable?> staticTable({
    required int id,
    required String domain,
    DataLanguage lang = DataLanguage.id,
  });

  /// Fetches detailed information about a news.
  ///
  /// - [id]: The unique identifier of the news.
  /// - [domain]: The domain to which the news.
  /// - [lang]: The data language  of request (default is [DataLanguage.id]).

  Future<News?> news({
    required int id,
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
  final _getDetailNews = getIt<GetDetailNews>();
  final _getDetailPublication = getIt<GetDetailPublication>();
  final _getDetailStaticTable = getIt<GetDetailStaticTable>();

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
      (l) => throw PublicationException(message: l.message),
      (r) => r.data,
    );
  }

  @override
  Future<StaticTable?> staticTable({
    required int id,
    required String domain,
    DataLanguage lang = DataLanguage.id,
  }) async {
    final result = await _getDetailStaticTable(
      GetDetailStaticTableParam(
        id: id,
        lang: lang,
        domain: domain,
      ),
    );

    return result.fold(
      (l) => throw StaticTableException(message: l.message),
      (r) => r.data,
    );
  }

  @override
  Future<News?> news({
    required int id,
    required String domain,
    DataLanguage lang = DataLanguage.id,
  }) async {
    final result = await _getDetailNews(
      GetDetailNewsParam(
        id: id,
        lang: lang,
        domain: domain,
      ),
    );

    return result.fold(
      (l) => throw NewsException(message: l.message),
      (r) => r.data,
    );
  }
}
