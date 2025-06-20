import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

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

  /// Fetches detailed information about a press release.
  ///
  /// - [id]: The unique identifier of the press release.
  /// - [domain]: The domain to which the press release.
  /// - [lang]: The data language  of request (default is [DataLanguage.id]).

  Future<PressRelease?> pressRelease({
    required int id,
    required String domain,
    DataLanguage lang = DataLanguage.id,
  });

  /// Retrieves a list of statistic classifications based on the provided parameters.
  ///
  /// - [id]: The unique identifier of the statistic classification.
  /// - [type]: The classification type (e.g., KBLIType or KBKIType).
  /// - [lang]: The language of the data (default: [DataLanguage.id]).
  /// - [page]: The page number for pagination (default: 1).
  /// - [perPage]: The number of items per page (default: 10).

  Future<List<StatisticClassification>?> statisticClassification({
    required String id,
    required ClassificationType type,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    int perPage = 10,
  });
}

/// Implementation of the [StadataView] interface.
///
/// This class provides methods to retrieve detailed information about
/// various data items within a domain.
class StadataViewImpl implements StadataView {
  final GetDetailNews _getDetailNews = injector.get<GetDetailNews>();
  final GetDetailPublication _getDetailPublication = injector.get<GetDetailPublication>();
  final GetDetailStaticTable _getDetailStaticTable = injector.get<GetDetailStaticTable>();
  final GetDetailPressRelease _getDetailPressRelease = injector.get<GetDetailPressRelease>();
  final GetDetailStatisticClassification _getDetailStatisticClassification =
      injector.get<GetDetailStatisticClassification>();

  @override
  Future<Publication?> publication({
    required String id,
    required String domain,
    DataLanguage lang = DataLanguage.id,
  }) async {
    final result = await _getDetailPublication(
      GetPublicationDetailParam(id: id, domain: domain, lang: lang),
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
      GetDetailStaticTableParam(id: id, lang: lang, domain: domain),
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
      GetDetailNewsParam(id: id, lang: lang, domain: domain),
    );

    return result.fold(
      (l) => throw NewsException(message: l.message),
      (r) => r.data,
    );
  }

  @override
  Future<PressRelease?> pressRelease({
    required int id,
    required String domain,
    DataLanguage lang = DataLanguage.id,
  }) async {
    final result = await _getDetailPressRelease(
      GetDetailPressReleaseParam(id: id, lang: lang, domain: domain),
    );

    return result.fold(
      (l) => throw PressReleaseException(message: l.message),
      (r) => r.data,
    );
  }

  @override
  Future<List<StatisticClassification>?> statisticClassification({
    required String id,
    required ClassificationType type,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    int perPage = 10,
  }) async {
    final result = await _getDetailStatisticClassification(
      GetDetailStatisticClassificationParam(
        id: id,
        type: type,
        lang: lang,
        page: page,
        perPage: perPage,
      ),
    );

    return result.fold(
      (l) => throw StatisticClassificationException(message: l.message),
      (r) => r.data,
    );
  }
}
