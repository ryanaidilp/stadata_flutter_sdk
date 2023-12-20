// ignore_for_file: public_member_api_docs

import 'package:injectable/injectable.dart';
import 'package:stadata_flutter_sdk/src/core/di/service_locator.dart';
import 'package:stadata_flutter_sdk/src/features/domains/domain/usecases/get_domains.dart';
import 'package:stadata_flutter_sdk/src/features/infographics/domain/usecases/get_all_infographics.dart';
import 'package:stadata_flutter_sdk/src/features/news/domain/usecases/get_all_news.dart';
import 'package:stadata_flutter_sdk/src/features/news_categories/domain/usecases/get_all_news_categories.dart';
import 'package:stadata_flutter_sdk/src/features/press_releases/domain/usecases/get_all_press_releases.dart';
import 'package:stadata_flutter_sdk/src/features/publications/domain/usecases/get_all_publication.dart';
import 'package:stadata_flutter_sdk/src/features/static_tables/domain/usecases/get_all_static_tables.dart';
import 'package:stadata_flutter_sdk/src/features/strategic_indicators/domain/usecases/get_all_strategic_indicators.dart';
import 'package:stadata_flutter_sdk/src/features/subject_categories/domain/usecases/get_all_subject_categories.dart';
import 'package:stadata_flutter_sdk/src/features/subjects/domain/usecases/get_all_subjects.dart';
import 'package:stadata_flutter_sdk/src/features/variables/domain/usecases/get_all_variables.dart';
import 'package:stadata_flutter_sdk/src/features/variables/variables.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

abstract class StadataList {
  Future<ListResult<DomainEntity>> domains({
    DomainType type = DomainType.all,
    String? provinceCode,
  });

  Future<ListResult<Publication>> publications({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    String? keyword,
    int? month,
    int? year,
  });

  Future<ListResult<Infographic>> infographics({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    String? keyword,
  });

  Future<ListResult<StaticTable>> staticTables({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    String? keyword,
    int? month,
    int? year,
  });

  Future<ListResult<News>> news({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    String? keyword,
    String? newsCategoryID,
    @Deprecated('Use newsCategoryID instead') String? newsCategoryId,
    int? month,
    int? year,
  });

  Future<ListResult<NewsCategory>> newsCategories({
    required String domain,
    DataLanguage lang = DataLanguage.id,
  });

  Future<ListResult<StrategicIndicator>> strategicIndicators({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int? variableID,
    int page = 1,
  });

  Future<ListResult<SubjectCategory>> subjectCategories({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
  });

  Future<ListResult<Subject>> subjects({
    required String domain,
    int? subjectCategoryID,
    @Deprecated('Use subjectCategoryID instead') int? subjectCategoryId,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
  });

  Future<ListResult<PressRelease>> pressReleases({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    String? keyword,
    int? month,
    int? year,
  });

  Future<ListResult<Variable>> variables({
    required String domain,
    int page = 1,
    DataLanguage lang = DataLanguage.id,
    bool showExistingVariables = false,
    int? year,
    int? subjectID,
  });
}

@LazySingleton(as: StadataList)
class StadataListImpl implements StadataList {
  final _getDomains = getIt<GetDomains>();
  final _getAllPublications = getIt<GetAllPublication>();
  final _getAllInfographics = getIt<GetAllInfographics>();
  final _getAllStaticTables = getIt<GetAllStaticTables>();
  final _getAllNews = getIt<GetAllNews>();
  final _getAllNewsCategories = getIt<GetAllNewsCategories>();
  final _getAllStrategicIndicators = getIt<GetAllStrategicIndicators>();
  final _getAllSubjectCategories = getIt<GetAllSubjectCategories>();
  final _getAllSubjects = getIt<GetAllSubjects>();
  final _getAllPressReleases = getIt<GetAllPressReleases>();
  final _getAllVariables = getIt<GetAllVariables>();

  @override
  Future<ListResult<DomainEntity>> domains({
    DomainType type = DomainType.all,
    String? provinceCode,
  }) async {
    final result = await _getDomains(
      GetDomainParam(
        type: type,
        provinceCode: provinceCode,
      ),
    );

    return result.fold(
      (l) => throw DomainException(message: l.message),
      (r) => ListResult<DomainEntity>(
        data: r.data ?? [],
        dataAvailability:
            r.dataAvailability ?? DataAvailability.listNotAvailable,
        pagination: r.pagination,
      ),
    );
  }

  @override
  Future<ListResult<Publication>> publications({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    String? keyword,
    int? month,
    int? year,
  }) async {
    final result = await _getAllPublications(
      GetPublicationParam(
        domain: domain,
        lang: lang,
        page: page,
        keyword: keyword,
        month: month,
        year: year,
      ),
    );

    return result.fold(
      (l) => throw PublicationException(message: l.message),
      (r) => ListResult<Publication>(
        data: r.data ?? [],
        dataAvailability:
            r.dataAvailability ?? DataAvailability.listNotAvailable,
        pagination: r.pagination,
      ),
    );
  }

  @override
  Future<ListResult<Infographic>> infographics({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    String? keyword,
  }) async {
    final result = await _getAllInfographics(
      GetAllInfographicParam(
        domain: domain,
        lang: lang,
        page: page,
        keyword: keyword,
      ),
    );

    return result.fold(
      (l) => throw InfographicException(message: l.message),
      (r) => ListResult<Infographic>(
        data: r.data ?? [],
        dataAvailability:
            r.dataAvailability ?? DataAvailability.listNotAvailable,
        pagination: r.pagination,
      ),
    );
  }

  @override
  Future<ListResult<StaticTable>> staticTables({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    String? keyword,
    int? month,
    int? year,
  }) async {
    final result = await _getAllStaticTables(
      GetAllStaticTableParams(
        lang: lang,
        page: page,
        year: year,
        month: month,
        domain: domain,
        keyword: keyword,
      ),
    );

    return result.fold(
      (l) => throw StaticTableException(message: l.message),
      (r) => ListResult<StaticTable>(
        data: r.data ?? [],
        dataAvailability:
            r.dataAvailability ?? DataAvailability.listNotAvailable,
        pagination: r.pagination,
      ),
    );
  }

  @override
  Future<ListResult<News>> news({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    String? keyword,
    String? newsCategoryID,
    String? newsCategoryId,
    int? month,
    int? year,
  }) async {
    final result = await _getAllNews(
      GetAllNewsParam(
        lang: lang,
        year: year,
        page: page,
        month: month,
        domain: domain,
        keyword: keyword,
        newsCategoryID: newsCategoryID ?? newsCategoryId,
      ),
    );

    return result.fold(
      (l) => throw NewsException(message: l.message),
      (r) => ListResult<News>(
        data: r.data ?? [],
        dataAvailability:
            r.dataAvailability ?? DataAvailability.listNotAvailable,
        pagination: r.pagination,
      ),
    );
  }

  @override
  Future<ListResult<NewsCategory>> newsCategories({
    required String domain,
    DataLanguage lang = DataLanguage.id,
  }) async {
    final result = await _getAllNewsCategories(
      GetAllNewsCategoriesParam(
        lang: lang,
        domain: domain,
      ),
    );

    return result.fold(
      (l) => throw NewsCategoryException(message: l.message),
      (r) => ListResult<NewsCategory>(
        data: r.data ?? [],
        dataAvailability:
            r.dataAvailability ?? DataAvailability.listNotAvailable,
        pagination: r.pagination,
      ),
    );
  }

  @override
  Future<ListResult<SubjectCategory>> subjectCategories({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
  }) async {
    final result = await _getAllSubjectCategories(
      GetAllSubjectCategoriesParam(
        lang: lang,
        page: page,
        domain: domain,
      ),
    );

    return result.fold(
      (l) => throw SubjectCategoryException(
        message: l.message,
      ),
      (r) => ListResult<SubjectCategory>(
        data: r.data ?? [],
        dataAvailability:
            r.dataAvailability ?? DataAvailability.listNotAvailable,
        pagination: r.pagination,
      ),
    );
  }

  @override
  Future<ListResult<Subject>> subjects({
    required String domain,
    int? subjectCategoryID,
    @Deprecated('use subjectCategoryID') int? subjectCategoryId,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
  }) async {
    final result = await _getAllSubjects(
      GetAllSubjectsParam(
        page: page,
        lang: lang,
        domain: domain,
        subjectCategoryID: subjectCategoryID ?? subjectCategoryId,
      ),
    );

    return result.fold(
      (l) => throw SubjectException(message: l.message),
      (r) => ListResult<Subject>(
        data: r.data ?? [],
        dataAvailability:
            r.dataAvailability ?? DataAvailability.listNotAvailable,
        pagination: r.pagination,
      ),
    );
  }

  @override
  Future<ListResult<PressRelease>> pressReleases({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    String? keyword,
    int? month,
    int? year,
  }) async {
    final result = await _getAllPressReleases(
      GetAllPressReleasesParam(
        page: page,
        year: year,
        month: month,
        domain: domain,
        keyword: keyword,
      ),
    );

    return result.fold(
      (l) => throw PressReleaseException(message: l.message),
      (r) => ListResult<PressRelease>(
        data: r.data ?? [],
        dataAvailability:
            r.dataAvailability ?? DataAvailability.listNotAvailable,
        pagination: r.pagination,
      ),
    );
  }

  @override
  Future<ListResult<StrategicIndicator>> strategicIndicators({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int? variableID,
    int page = 1,
  }) async {
    final result = await _getAllStrategicIndicators(
      GetAllStrategicIndicatorsParam(
        domain: domain,
        lang: lang,
        page: page,
        variableID: variableID,
      ),
    );

    return result.fold(
      (l) => throw StrategicIndicatorException(message: l.message),
      (r) => ListResult<StrategicIndicator>(
        data: r.data ?? [],
        pagination: r.pagination,
        dataAvailability:
            r.dataAvailability ?? DataAvailability.listNotAvailable,
      ),
    );
  }

  @override
  Future<ListResult<Variable>> variables({
    required String domain,
    int page = 1,
    DataLanguage lang = DataLanguage.id,
    bool showExistingVariables = false,
    int? year,
    int? subjectID,
  }) async {
    final result = await _getAllVariables(
      GetAllVariablesParam(
        domain: domain,
        lang: lang,
        page: page,
        year: year,
        subjectID: subjectID,
        showExistingVariables: showExistingVariables,
      ),
    );

    return result.fold(
      (l) => throw VariableException(message: l.message),
      (r) => ListResult<Variable>(
        data: r.data ?? [],
        dataAvailability:
            r.dataAvailability ?? DataAvailability.listNotAvailable,
        pagination: r.pagination,
      ),
    );
  }
}
