// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [CensusAreasParametersPage]
class CensusAreasParametersRoute extends PageRouteInfo<void> {
  const CensusAreasParametersRoute({List<PageRouteInfo>? children})
    : super(CensusAreasParametersRoute.name, initialChildren: children);

  static const String name = 'CensusAreasParametersRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CensusAreasParametersPage();
    },
  );
}

/// generated route for
/// [CensusAreasResultsPage]
class CensusAreasResultsRoute
    extends PageRouteInfo<CensusAreasResultsRouteArgs> {
  CensusAreasResultsRoute({
    required String censusID,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         CensusAreasResultsRoute.name,
         args: CensusAreasResultsRouteArgs(censusID: censusID, key: key),
         initialChildren: children,
       );

  static const String name = 'CensusAreasResultsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CensusAreasResultsRouteArgs>();
      return CensusAreasResultsPage(censusID: args.censusID, key: args.key);
    },
  );
}

class CensusAreasResultsRouteArgs {
  const CensusAreasResultsRouteArgs({required this.censusID, this.key});

  final String censusID;

  final Key? key;

  @override
  String toString() {
    return 'CensusAreasResultsRouteArgs{censusID: $censusID, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CensusAreasResultsRouteArgs) return false;
    return censusID == other.censusID && key == other.key;
  }

  @override
  int get hashCode => censusID.hashCode ^ key.hashCode;
}

/// generated route for
/// [CensusDataParametersPage]
class CensusDataParametersRoute extends PageRouteInfo<void> {
  const CensusDataParametersRoute({List<PageRouteInfo>? children})
    : super(CensusDataParametersRoute.name, initialChildren: children);

  static const String name = 'CensusDataParametersRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CensusDataParametersPage();
    },
  );
}

/// generated route for
/// [CensusDataResultsPage]
class CensusDataResultsRoute extends PageRouteInfo<CensusDataResultsRouteArgs> {
  CensusDataResultsRoute({
    required String censusID,
    String? censusAreaID,
    required String datasetID,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         CensusDataResultsRoute.name,
         args: CensusDataResultsRouteArgs(
           censusID: censusID,
           censusAreaID: censusAreaID,
           datasetID: datasetID,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'CensusDataResultsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CensusDataResultsRouteArgs>();
      return CensusDataResultsPage(
        censusID: args.censusID,
        censusAreaID: args.censusAreaID,
        datasetID: args.datasetID,
        key: args.key,
      );
    },
  );
}

class CensusDataResultsRouteArgs {
  const CensusDataResultsRouteArgs({
    required this.censusID,
    this.censusAreaID,
    required this.datasetID,
    this.key,
  });

  final String censusID;

  final String? censusAreaID;

  final String datasetID;

  final Key? key;

  @override
  String toString() {
    return 'CensusDataResultsRouteArgs{censusID: $censusID, censusAreaID: $censusAreaID, datasetID: $datasetID, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CensusDataResultsRouteArgs) return false;
    return censusID == other.censusID &&
        censusAreaID == other.censusAreaID &&
        datasetID == other.datasetID &&
        key == other.key;
  }

  @override
  int get hashCode =>
      censusID.hashCode ^
      censusAreaID.hashCode ^
      datasetID.hashCode ^
      key.hashCode;
}

/// generated route for
/// [CensusDatasetsParametersPage]
class CensusDatasetsParametersRoute extends PageRouteInfo<void> {
  const CensusDatasetsParametersRoute({List<PageRouteInfo>? children})
    : super(CensusDatasetsParametersRoute.name, initialChildren: children);

  static const String name = 'CensusDatasetsParametersRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CensusDatasetsParametersPage();
    },
  );
}

/// generated route for
/// [CensusDatasetsResultsPage]
class CensusDatasetsResultsRoute
    extends PageRouteInfo<CensusDatasetsResultsRouteArgs> {
  CensusDatasetsResultsRoute({
    required String censusID,
    required int topicID,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         CensusDatasetsResultsRoute.name,
         args: CensusDatasetsResultsRouteArgs(
           censusID: censusID,
           topicID: topicID,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'CensusDatasetsResultsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CensusDatasetsResultsRouteArgs>();
      return CensusDatasetsResultsPage(
        censusID: args.censusID,
        topicID: args.topicID,
        key: args.key,
      );
    },
  );
}

class CensusDatasetsResultsRouteArgs {
  const CensusDatasetsResultsRouteArgs({
    required this.censusID,
    required this.topicID,
    this.key,
  });

  final String censusID;

  final int topicID;

  final Key? key;

  @override
  String toString() {
    return 'CensusDatasetsResultsRouteArgs{censusID: $censusID, topicID: $topicID, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CensusDatasetsResultsRouteArgs) return false;
    return censusID == other.censusID &&
        topicID == other.topicID &&
        key == other.key;
  }

  @override
  int get hashCode => censusID.hashCode ^ topicID.hashCode ^ key.hashCode;
}

/// generated route for
/// [CensusEventsPage]
class CensusEventsRoute extends PageRouteInfo<void> {
  const CensusEventsRoute({List<PageRouteInfo>? children})
    : super(CensusEventsRoute.name, initialChildren: children);

  static const String name = 'CensusEventsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CensusEventsPage();
    },
  );
}

/// generated route for
/// [CensusTopicsParametersPage]
class CensusTopicsParametersRoute extends PageRouteInfo<void> {
  const CensusTopicsParametersRoute({List<PageRouteInfo>? children})
    : super(CensusTopicsParametersRoute.name, initialChildren: children);

  static const String name = 'CensusTopicsParametersRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CensusTopicsParametersPage();
    },
  );
}

/// generated route for
/// [CensusTopicsResultsPage]
class CensusTopicsResultsRoute
    extends PageRouteInfo<CensusTopicsResultsRouteArgs> {
  CensusTopicsResultsRoute({
    required String censusID,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         CensusTopicsResultsRoute.name,
         args: CensusTopicsResultsRouteArgs(censusID: censusID, key: key),
         initialChildren: children,
       );

  static const String name = 'CensusTopicsResultsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CensusTopicsResultsRouteArgs>();
      return CensusTopicsResultsPage(censusID: args.censusID, key: args.key);
    },
  );
}

class CensusTopicsResultsRouteArgs {
  const CensusTopicsResultsRouteArgs({required this.censusID, this.key});

  final String censusID;

  final Key? key;

  @override
  String toString() {
    return 'CensusTopicsResultsRouteArgs{censusID: $censusID, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CensusTopicsResultsRouteArgs) return false;
    return censusID == other.censusID && key == other.key;
  }

  @override
  int get hashCode => censusID.hashCode ^ key.hashCode;
}

/// generated route for
/// [DomainsPage]
class DomainsRoute extends PageRouteInfo<void> {
  const DomainsRoute({List<PageRouteInfo>? children})
    : super(DomainsRoute.name, initialChildren: children);

  static const String name = 'DomainsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const DomainsPage();
    },
  );
}

/// generated route for
/// [DomainsResultsPage]
class DomainsResultsRoute extends PageRouteInfo<DomainsResultsRouteArgs> {
  DomainsResultsRoute({
    required DomainType type,
    required DataLanguage language,
    Key? key,
    String? provinceCode,
    List<PageRouteInfo>? children,
  }) : super(
         DomainsResultsRoute.name,
         args: DomainsResultsRouteArgs(
           type: type,
           language: language,
           key: key,
           provinceCode: provinceCode,
         ),
         initialChildren: children,
       );

  static const String name = 'DomainsResultsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DomainsResultsRouteArgs>();
      return DomainsResultsPage(
        type: args.type,
        language: args.language,
        key: args.key,
        provinceCode: args.provinceCode,
      );
    },
  );
}

class DomainsResultsRouteArgs {
  const DomainsResultsRouteArgs({
    required this.type,
    required this.language,
    this.key,
    this.provinceCode,
  });

  final DomainType type;

  final DataLanguage language;

  final Key? key;

  final String? provinceCode;

  @override
  String toString() {
    return 'DomainsResultsRouteArgs{type: $type, language: $language, key: $key, provinceCode: $provinceCode}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! DomainsResultsRouteArgs) return false;
    return type == other.type &&
        language == other.language &&
        key == other.key &&
        provinceCode == other.provinceCode;
  }

  @override
  int get hashCode =>
      type.hashCode ^ language.hashCode ^ key.hashCode ^ provinceCode.hashCode;
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomePage();
    },
  );
}

/// generated route for
/// [InfographicsPage]
class InfographicsRoute extends PageRouteInfo<void> {
  const InfographicsRoute({List<PageRouteInfo>? children})
    : super(InfographicsRoute.name, initialChildren: children);

  static const String name = 'InfographicsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const InfographicsPage();
    },
  );
}

/// generated route for
/// [InfographicsResultsPage]
class InfographicsResultsRoute
    extends PageRouteInfo<InfographicsResultsRouteArgs> {
  InfographicsResultsRoute({
    required String domain,
    required DataLanguage language,
    Key? key,
    String? keyword,
    List<PageRouteInfo>? children,
  }) : super(
         InfographicsResultsRoute.name,
         args: InfographicsResultsRouteArgs(
           domain: domain,
           language: language,
           key: key,
           keyword: keyword,
         ),
         initialChildren: children,
       );

  static const String name = 'InfographicsResultsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<InfographicsResultsRouteArgs>();
      return InfographicsResultsPage(
        domain: args.domain,
        language: args.language,
        key: args.key,
        keyword: args.keyword,
      );
    },
  );
}

class InfographicsResultsRouteArgs {
  const InfographicsResultsRouteArgs({
    required this.domain,
    required this.language,
    this.key,
    this.keyword,
  });

  final String domain;

  final DataLanguage language;

  final Key? key;

  final String? keyword;

  @override
  String toString() {
    return 'InfographicsResultsRouteArgs{domain: $domain, language: $language, key: $key, keyword: $keyword}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! InfographicsResultsRouteArgs) return false;
    return domain == other.domain &&
        language == other.language &&
        key == other.key &&
        keyword == other.keyword;
  }

  @override
  int get hashCode =>
      domain.hashCode ^ language.hashCode ^ key.hashCode ^ keyword.hashCode;
}

/// generated route for
/// [NewsCategoriesPage]
class NewsCategoriesRoute extends PageRouteInfo<void> {
  const NewsCategoriesRoute({List<PageRouteInfo>? children})
    : super(NewsCategoriesRoute.name, initialChildren: children);

  static const String name = 'NewsCategoriesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const NewsCategoriesPage();
    },
  );
}

/// generated route for
/// [NewsCategoriesResultsPage]
class NewsCategoriesResultsRoute
    extends PageRouteInfo<NewsCategoriesResultsRouteArgs> {
  NewsCategoriesResultsRoute({
    required String domain,
    required DataLanguage language,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         NewsCategoriesResultsRoute.name,
         args: NewsCategoriesResultsRouteArgs(
           domain: domain,
           language: language,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'NewsCategoriesResultsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NewsCategoriesResultsRouteArgs>();
      return NewsCategoriesResultsPage(
        domain: args.domain,
        language: args.language,
        key: args.key,
      );
    },
  );
}

class NewsCategoriesResultsRouteArgs {
  const NewsCategoriesResultsRouteArgs({
    required this.domain,
    required this.language,
    this.key,
  });

  final String domain;

  final DataLanguage language;

  final Key? key;

  @override
  String toString() {
    return 'NewsCategoriesResultsRouteArgs{domain: $domain, language: $language, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! NewsCategoriesResultsRouteArgs) return false;
    return domain == other.domain &&
        language == other.language &&
        key == other.key;
  }

  @override
  int get hashCode => domain.hashCode ^ language.hashCode ^ key.hashCode;
}

/// generated route for
/// [NewsDetailPage]
class NewsDetailRoute extends PageRouteInfo<NewsDetailRouteArgs> {
  NewsDetailRoute({
    required int newsId,
    Key? key,
    DataLanguage language = DataLanguage.id,
    String domain = '7200',
    List<PageRouteInfo>? children,
  }) : super(
         NewsDetailRoute.name,
         args: NewsDetailRouteArgs(
           newsId: newsId,
           key: key,
           language: language,
           domain: domain,
         ),
         initialChildren: children,
       );

  static const String name = 'NewsDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NewsDetailRouteArgs>();
      return NewsDetailPage(
        newsId: args.newsId,
        key: args.key,
        language: args.language,
        domain: args.domain,
      );
    },
  );
}

class NewsDetailRouteArgs {
  const NewsDetailRouteArgs({
    required this.newsId,
    this.key,
    this.language = DataLanguage.id,
    this.domain = '7200',
  });

  final int newsId;

  final Key? key;

  final DataLanguage language;

  final String domain;

  @override
  String toString() {
    return 'NewsDetailRouteArgs{newsId: $newsId, key: $key, language: $language, domain: $domain}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! NewsDetailRouteArgs) return false;
    return newsId == other.newsId &&
        key == other.key &&
        language == other.language &&
        domain == other.domain;
  }

  @override
  int get hashCode =>
      newsId.hashCode ^ key.hashCode ^ language.hashCode ^ domain.hashCode;
}

/// generated route for
/// [NewsPage]
class NewsRoute extends PageRouteInfo<void> {
  const NewsRoute({List<PageRouteInfo>? children})
    : super(NewsRoute.name, initialChildren: children);

  static const String name = 'NewsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const NewsPage();
    },
  );
}

/// generated route for
/// [NewsResultsPage]
class NewsResultsRoute extends PageRouteInfo<NewsResultsRouteArgs> {
  NewsResultsRoute({
    required String domain,
    required DataLanguage language,
    Key? key,
    String? keyword,
    String? newsCategoryID,
    int? month,
    int? year,
    List<PageRouteInfo>? children,
  }) : super(
         NewsResultsRoute.name,
         args: NewsResultsRouteArgs(
           domain: domain,
           language: language,
           key: key,
           keyword: keyword,
           newsCategoryID: newsCategoryID,
           month: month,
           year: year,
         ),
         initialChildren: children,
       );

  static const String name = 'NewsResultsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NewsResultsRouteArgs>();
      return NewsResultsPage(
        domain: args.domain,
        language: args.language,
        key: args.key,
        keyword: args.keyword,
        newsCategoryID: args.newsCategoryID,
        month: args.month,
        year: args.year,
      );
    },
  );
}

class NewsResultsRouteArgs {
  const NewsResultsRouteArgs({
    required this.domain,
    required this.language,
    this.key,
    this.keyword,
    this.newsCategoryID,
    this.month,
    this.year,
  });

  final String domain;

  final DataLanguage language;

  final Key? key;

  final String? keyword;

  final String? newsCategoryID;

  final int? month;

  final int? year;

  @override
  String toString() {
    return 'NewsResultsRouteArgs{domain: $domain, language: $language, key: $key, keyword: $keyword, newsCategoryID: $newsCategoryID, month: $month, year: $year}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! NewsResultsRouteArgs) return false;
    return domain == other.domain &&
        language == other.language &&
        key == other.key &&
        keyword == other.keyword &&
        newsCategoryID == other.newsCategoryID &&
        month == other.month &&
        year == other.year;
  }

  @override
  int get hashCode =>
      domain.hashCode ^
      language.hashCode ^
      key.hashCode ^
      keyword.hashCode ^
      newsCategoryID.hashCode ^
      month.hashCode ^
      year.hashCode;
}

/// generated route for
/// [PressReleaseDetailPage]
class PressReleaseDetailRoute
    extends PageRouteInfo<PressReleaseDetailRouteArgs> {
  PressReleaseDetailRoute({
    required int pressReleaseId,
    required String domain,
    required DataLanguage language,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         PressReleaseDetailRoute.name,
         args: PressReleaseDetailRouteArgs(
           pressReleaseId: pressReleaseId,
           domain: domain,
           language: language,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'PressReleaseDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PressReleaseDetailRouteArgs>();
      return PressReleaseDetailPage(
        pressReleaseId: args.pressReleaseId,
        domain: args.domain,
        language: args.language,
        key: args.key,
      );
    },
  );
}

class PressReleaseDetailRouteArgs {
  const PressReleaseDetailRouteArgs({
    required this.pressReleaseId,
    required this.domain,
    required this.language,
    this.key,
  });

  final int pressReleaseId;

  final String domain;

  final DataLanguage language;

  final Key? key;

  @override
  String toString() {
    return 'PressReleaseDetailRouteArgs{pressReleaseId: $pressReleaseId, domain: $domain, language: $language, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PressReleaseDetailRouteArgs) return false;
    return pressReleaseId == other.pressReleaseId &&
        domain == other.domain &&
        language == other.language &&
        key == other.key;
  }

  @override
  int get hashCode =>
      pressReleaseId.hashCode ^
      domain.hashCode ^
      language.hashCode ^
      key.hashCode;
}

/// generated route for
/// [PressReleasesPage]
class PressReleasesRoute extends PageRouteInfo<void> {
  const PressReleasesRoute({List<PageRouteInfo>? children})
    : super(PressReleasesRoute.name, initialChildren: children);

  static const String name = 'PressReleasesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PressReleasesPage();
    },
  );
}

/// generated route for
/// [PressReleasesParametersPage]
class PressReleasesParametersRoute extends PageRouteInfo<void> {
  const PressReleasesParametersRoute({List<PageRouteInfo>? children})
    : super(PressReleasesParametersRoute.name, initialChildren: children);

  static const String name = 'PressReleasesParametersRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PressReleasesParametersPage();
    },
  );
}

/// generated route for
/// [PressReleasesResultsPage]
class PressReleasesResultsRoute
    extends PageRouteInfo<PressReleasesResultsRouteArgs> {
  PressReleasesResultsRoute({
    required String domain,
    required DataLanguage language,
    String? keyword,
    int? month,
    int? year,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         PressReleasesResultsRoute.name,
         args: PressReleasesResultsRouteArgs(
           domain: domain,
           language: language,
           keyword: keyword,
           month: month,
           year: year,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'PressReleasesResultsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PressReleasesResultsRouteArgs>();
      return PressReleasesResultsPage(
        domain: args.domain,
        language: args.language,
        keyword: args.keyword,
        month: args.month,
        year: args.year,
        key: args.key,
      );
    },
  );
}

class PressReleasesResultsRouteArgs {
  const PressReleasesResultsRouteArgs({
    required this.domain,
    required this.language,
    this.keyword,
    this.month,
    this.year,
    this.key,
  });

  final String domain;

  final DataLanguage language;

  final String? keyword;

  final int? month;

  final int? year;

  final Key? key;

  @override
  String toString() {
    return 'PressReleasesResultsRouteArgs{domain: $domain, language: $language, keyword: $keyword, month: $month, year: $year, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PressReleasesResultsRouteArgs) return false;
    return domain == other.domain &&
        language == other.language &&
        keyword == other.keyword &&
        month == other.month &&
        year == other.year &&
        key == other.key;
  }

  @override
  int get hashCode =>
      domain.hashCode ^
      language.hashCode ^
      keyword.hashCode ^
      month.hashCode ^
      year.hashCode ^
      key.hashCode;
}

/// generated route for
/// [PublicationDetailPage]
class PublicationDetailRoute extends PageRouteInfo<PublicationDetailRouteArgs> {
  PublicationDetailRoute({
    required String publicationId,
    required String domain,
    required DataLanguage language,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         PublicationDetailRoute.name,
         args: PublicationDetailRouteArgs(
           publicationId: publicationId,
           domain: domain,
           language: language,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'PublicationDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PublicationDetailRouteArgs>();
      return PublicationDetailPage(
        publicationId: args.publicationId,
        domain: args.domain,
        language: args.language,
        key: args.key,
      );
    },
  );
}

class PublicationDetailRouteArgs {
  const PublicationDetailRouteArgs({
    required this.publicationId,
    required this.domain,
    required this.language,
    this.key,
  });

  final String publicationId;

  final String domain;

  final DataLanguage language;

  final Key? key;

  @override
  String toString() {
    return 'PublicationDetailRouteArgs{publicationId: $publicationId, domain: $domain, language: $language, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PublicationDetailRouteArgs) return false;
    return publicationId == other.publicationId &&
        domain == other.domain &&
        language == other.language &&
        key == other.key;
  }

  @override
  int get hashCode =>
      publicationId.hashCode ^
      domain.hashCode ^
      language.hashCode ^
      key.hashCode;
}

/// generated route for
/// [PublicationsPage]
class PublicationsRoute extends PageRouteInfo<void> {
  const PublicationsRoute({List<PageRouteInfo>? children})
    : super(PublicationsRoute.name, initialChildren: children);

  static const String name = 'PublicationsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PublicationsPage();
    },
  );
}

/// generated route for
/// [PublicationsParametersPage]
class PublicationsParametersRoute extends PageRouteInfo<void> {
  const PublicationsParametersRoute({List<PageRouteInfo>? children})
    : super(PublicationsParametersRoute.name, initialChildren: children);

  static const String name = 'PublicationsParametersRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PublicationsParametersPage();
    },
  );
}

/// generated route for
/// [PublicationsResultsPage]
class PublicationsResultsRoute
    extends PageRouteInfo<PublicationsResultsRouteArgs> {
  PublicationsResultsRoute({
    required String domain,
    required DataLanguage language,
    String? keyword,
    int? month,
    int? year,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         PublicationsResultsRoute.name,
         args: PublicationsResultsRouteArgs(
           domain: domain,
           language: language,
           keyword: keyword,
           month: month,
           year: year,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'PublicationsResultsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PublicationsResultsRouteArgs>();
      return PublicationsResultsPage(
        domain: args.domain,
        language: args.language,
        keyword: args.keyword,
        month: args.month,
        year: args.year,
        key: args.key,
      );
    },
  );
}

class PublicationsResultsRouteArgs {
  const PublicationsResultsRouteArgs({
    required this.domain,
    required this.language,
    this.keyword,
    this.month,
    this.year,
    this.key,
  });

  final String domain;

  final DataLanguage language;

  final String? keyword;

  final int? month;

  final int? year;

  final Key? key;

  @override
  String toString() {
    return 'PublicationsResultsRouteArgs{domain: $domain, language: $language, keyword: $keyword, month: $month, year: $year, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PublicationsResultsRouteArgs) return false;
    return domain == other.domain &&
        language == other.language &&
        keyword == other.keyword &&
        month == other.month &&
        year == other.year &&
        key == other.key;
  }

  @override
  int get hashCode =>
      domain.hashCode ^
      language.hashCode ^
      keyword.hashCode ^
      month.hashCode ^
      year.hashCode ^
      key.hashCode;
}

/// generated route for
/// [StatisticalClassificationsPage]
class StatisticalClassificationsRoute extends PageRouteInfo<void> {
  const StatisticalClassificationsRoute({List<PageRouteInfo>? children})
    : super(StatisticalClassificationsRoute.name, initialChildren: children);

  static const String name = 'StatisticalClassificationsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const StatisticalClassificationsPage();
    },
  );
}

/// generated route for
/// [StatisticalClassificationsParametersPage]
class StatisticalClassificationsParametersRoute extends PageRouteInfo<void> {
  const StatisticalClassificationsParametersRoute({
    List<PageRouteInfo>? children,
  }) : super(
         StatisticalClassificationsParametersRoute.name,
         initialChildren: children,
       );

  static const String name = 'StatisticalClassificationsParametersRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const StatisticalClassificationsParametersPage();
    },
  );
}

/// generated route for
/// [StatisticalClassificationsResultsPage]
class StatisticalClassificationsResultsRoute
    extends PageRouteInfo<StatisticalClassificationsResultsRouteArgs> {
  StatisticalClassificationsResultsRoute({
    required ClassificationType type,
    required DataLanguage language,
    ClassificationLevel? level,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         StatisticalClassificationsResultsRoute.name,
         args: StatisticalClassificationsResultsRouteArgs(
           type: type,
           language: language,
           level: level,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'StatisticalClassificationsResultsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<StatisticalClassificationsResultsRouteArgs>();
      return StatisticalClassificationsResultsPage(
        type: args.type,
        language: args.language,
        level: args.level,
        key: args.key,
      );
    },
  );
}

class StatisticalClassificationsResultsRouteArgs {
  const StatisticalClassificationsResultsRouteArgs({
    required this.type,
    required this.language,
    this.level,
    this.key,
  });

  final ClassificationType type;

  final DataLanguage language;

  final ClassificationLevel? level;

  final Key? key;

  @override
  String toString() {
    return 'StatisticalClassificationsResultsRouteArgs{type: $type, language: $language, level: $level, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! StatisticalClassificationsResultsRouteArgs) return false;
    return type == other.type &&
        language == other.language &&
        level == other.level &&
        key == other.key;
  }

  @override
  int get hashCode =>
      type.hashCode ^ language.hashCode ^ level.hashCode ^ key.hashCode;
}

/// generated route for
/// [StrategicIndicatorsPage]
class StrategicIndicatorsRoute extends PageRouteInfo<void> {
  const StrategicIndicatorsRoute({List<PageRouteInfo>? children})
    : super(StrategicIndicatorsRoute.name, initialChildren: children);

  static const String name = 'StrategicIndicatorsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const StrategicIndicatorsPage();
    },
  );
}

/// generated route for
/// [StrategicIndicatorsParametersPage]
class StrategicIndicatorsParametersRoute extends PageRouteInfo<void> {
  const StrategicIndicatorsParametersRoute({List<PageRouteInfo>? children})
    : super(StrategicIndicatorsParametersRoute.name, initialChildren: children);

  static const String name = 'StrategicIndicatorsParametersRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const StrategicIndicatorsParametersPage();
    },
  );
}

/// generated route for
/// [StrategicIndicatorsResultsPage]
class StrategicIndicatorsResultsRoute
    extends PageRouteInfo<StrategicIndicatorsResultsRouteArgs> {
  StrategicIndicatorsResultsRoute({
    required String domain,
    required DataLanguage language,
    int? variableID,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         StrategicIndicatorsResultsRoute.name,
         args: StrategicIndicatorsResultsRouteArgs(
           domain: domain,
           language: language,
           variableID: variableID,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'StrategicIndicatorsResultsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<StrategicIndicatorsResultsRouteArgs>();
      return StrategicIndicatorsResultsPage(
        domain: args.domain,
        language: args.language,
        variableID: args.variableID,
        key: args.key,
      );
    },
  );
}

class StrategicIndicatorsResultsRouteArgs {
  const StrategicIndicatorsResultsRouteArgs({
    required this.domain,
    required this.language,
    this.variableID,
    this.key,
  });

  final String domain;

  final DataLanguage language;

  final int? variableID;

  final Key? key;

  @override
  String toString() {
    return 'StrategicIndicatorsResultsRouteArgs{domain: $domain, language: $language, variableID: $variableID, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! StrategicIndicatorsResultsRouteArgs) return false;
    return domain == other.domain &&
        language == other.language &&
        variableID == other.variableID &&
        key == other.key;
  }

  @override
  int get hashCode =>
      domain.hashCode ^ language.hashCode ^ variableID.hashCode ^ key.hashCode;
}

/// generated route for
/// [SubjectCategoriesPage]
class SubjectCategoriesRoute extends PageRouteInfo<void> {
  const SubjectCategoriesRoute({List<PageRouteInfo>? children})
    : super(SubjectCategoriesRoute.name, initialChildren: children);

  static const String name = 'SubjectCategoriesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SubjectCategoriesPage();
    },
  );
}

/// generated route for
/// [SubjectCategoriesParametersPage]
class SubjectCategoriesParametersRoute extends PageRouteInfo<void> {
  const SubjectCategoriesParametersRoute({List<PageRouteInfo>? children})
    : super(SubjectCategoriesParametersRoute.name, initialChildren: children);

  static const String name = 'SubjectCategoriesParametersRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SubjectCategoriesParametersPage();
    },
  );
}

/// generated route for
/// [SubjectCategoriesResultsPage]
class SubjectCategoriesResultsRoute
    extends PageRouteInfo<SubjectCategoriesResultsRouteArgs> {
  SubjectCategoriesResultsRoute({
    required String domain,
    required DataLanguage language,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         SubjectCategoriesResultsRoute.name,
         args: SubjectCategoriesResultsRouteArgs(
           domain: domain,
           language: language,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'SubjectCategoriesResultsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SubjectCategoriesResultsRouteArgs>();
      return SubjectCategoriesResultsPage(
        domain: args.domain,
        language: args.language,
        key: args.key,
      );
    },
  );
}

class SubjectCategoriesResultsRouteArgs {
  const SubjectCategoriesResultsRouteArgs({
    required this.domain,
    required this.language,
    this.key,
  });

  final String domain;

  final DataLanguage language;

  final Key? key;

  @override
  String toString() {
    return 'SubjectCategoriesResultsRouteArgs{domain: $domain, language: $language, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SubjectCategoriesResultsRouteArgs) return false;
    return domain == other.domain &&
        language == other.language &&
        key == other.key;
  }

  @override
  int get hashCode => domain.hashCode ^ language.hashCode ^ key.hashCode;
}

/// generated route for
/// [SubjectsPage]
class SubjectsRoute extends PageRouteInfo<void> {
  const SubjectsRoute({List<PageRouteInfo>? children})
    : super(SubjectsRoute.name, initialChildren: children);

  static const String name = 'SubjectsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SubjectsPage();
    },
  );
}

/// generated route for
/// [SubjectsParametersPage]
class SubjectsParametersRoute extends PageRouteInfo<void> {
  const SubjectsParametersRoute({List<PageRouteInfo>? children})
    : super(SubjectsParametersRoute.name, initialChildren: children);

  static const String name = 'SubjectsParametersRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SubjectsParametersPage();
    },
  );
}

/// generated route for
/// [SubjectsResultsPage]
class SubjectsResultsRoute extends PageRouteInfo<SubjectsResultsRouteArgs> {
  SubjectsResultsRoute({
    required String domain,
    required DataLanguage language,
    int? subjectCategoryID,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         SubjectsResultsRoute.name,
         args: SubjectsResultsRouteArgs(
           domain: domain,
           language: language,
           subjectCategoryID: subjectCategoryID,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'SubjectsResultsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SubjectsResultsRouteArgs>();
      return SubjectsResultsPage(
        domain: args.domain,
        language: args.language,
        subjectCategoryID: args.subjectCategoryID,
        key: args.key,
      );
    },
  );
}

class SubjectsResultsRouteArgs {
  const SubjectsResultsRouteArgs({
    required this.domain,
    required this.language,
    this.subjectCategoryID,
    this.key,
  });

  final String domain;

  final DataLanguage language;

  final int? subjectCategoryID;

  final Key? key;

  @override
  String toString() {
    return 'SubjectsResultsRouteArgs{domain: $domain, language: $language, subjectCategoryID: $subjectCategoryID, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SubjectsResultsRouteArgs) return false;
    return domain == other.domain &&
        language == other.language &&
        subjectCategoryID == other.subjectCategoryID &&
        key == other.key;
  }

  @override
  int get hashCode =>
      domain.hashCode ^
      language.hashCode ^
      subjectCategoryID.hashCode ^
      key.hashCode;
}

/// generated route for
/// [VariablesPage]
class VariablesRoute extends PageRouteInfo<void> {
  const VariablesRoute({List<PageRouteInfo>? children})
    : super(VariablesRoute.name, initialChildren: children);

  static const String name = 'VariablesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const VariablesPage();
    },
  );
}

/// generated route for
/// [VariablesParametersPage]
class VariablesParametersRoute extends PageRouteInfo<void> {
  const VariablesParametersRoute({List<PageRouteInfo>? children})
    : super(VariablesParametersRoute.name, initialChildren: children);

  static const String name = 'VariablesParametersRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const VariablesParametersPage();
    },
  );
}

/// generated route for
/// [VariablesResultsPage]
class VariablesResultsRoute extends PageRouteInfo<VariablesResultsRouteArgs> {
  VariablesResultsRoute({
    required String domain,
    required DataLanguage language,
    int? year,
    int? subjectID,
    bool showExistingVariables = false,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         VariablesResultsRoute.name,
         args: VariablesResultsRouteArgs(
           domain: domain,
           language: language,
           year: year,
           subjectID: subjectID,
           showExistingVariables: showExistingVariables,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'VariablesResultsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VariablesResultsRouteArgs>();
      return VariablesResultsPage(
        domain: args.domain,
        language: args.language,
        year: args.year,
        subjectID: args.subjectID,
        showExistingVariables: args.showExistingVariables,
        key: args.key,
      );
    },
  );
}

class VariablesResultsRouteArgs {
  const VariablesResultsRouteArgs({
    required this.domain,
    required this.language,
    this.year,
    this.subjectID,
    this.showExistingVariables = false,
    this.key,
  });

  final String domain;

  final DataLanguage language;

  final int? year;

  final int? subjectID;

  final bool showExistingVariables;

  final Key? key;

  @override
  String toString() {
    return 'VariablesResultsRouteArgs{domain: $domain, language: $language, year: $year, subjectID: $subjectID, showExistingVariables: $showExistingVariables, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! VariablesResultsRouteArgs) return false;
    return domain == other.domain &&
        language == other.language &&
        year == other.year &&
        subjectID == other.subjectID &&
        showExistingVariables == other.showExistingVariables &&
        key == other.key;
  }

  @override
  int get hashCode =>
      domain.hashCode ^
      language.hashCode ^
      year.hashCode ^
      subjectID.hashCode ^
      showExistingVariables.hashCode ^
      key.hashCode;
}
