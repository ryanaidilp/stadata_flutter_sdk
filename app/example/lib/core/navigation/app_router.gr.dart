// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

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
    Key? key,
    required DomainType type,
    required DataLanguage language,
    String? provinceCode,
    List<PageRouteInfo>? children,
  }) : super(
         DomainsResultsRoute.name,
         args: DomainsResultsRouteArgs(
           key: key,
           type: type,
           language: language,
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
        key: args.key,
        type: args.type,
        language: args.language,
        provinceCode: args.provinceCode,
      );
    },
  );
}

class DomainsResultsRouteArgs {
  const DomainsResultsRouteArgs({
    this.key,
    required this.type,
    required this.language,
    this.provinceCode,
  });

  final Key? key;

  final DomainType type;

  final DataLanguage language;

  final String? provinceCode;

  @override
  String toString() {
    return 'DomainsResultsRouteArgs{key: $key, type: $type, language: $language, provinceCode: $provinceCode}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! DomainsResultsRouteArgs) return false;
    return key == other.key &&
        type == other.type &&
        language == other.language &&
        provinceCode == other.provinceCode;
  }

  @override
  int get hashCode =>
      key.hashCode ^ type.hashCode ^ language.hashCode ^ provinceCode.hashCode;
}

/// generated route for
/// [DynamicTablesPage]
class DynamicTablesRoute extends PageRouteInfo<void> {
  const DynamicTablesRoute({List<PageRouteInfo>? children})
    : super(DynamicTablesRoute.name, initialChildren: children);

  static const String name = 'DynamicTablesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const DynamicTablesPage();
    },
  );
}

/// generated route for
/// [DynamicTablesResultsPage]
class DynamicTablesResultsRoute
    extends PageRouteInfo<DynamicTablesResultsRouteArgs> {
  DynamicTablesResultsRoute({
    Key? key,
    required String domain,
    required DataLanguage language,
    required Variable variable,
    required int yearId,
    List<PageRouteInfo>? children,
  }) : super(
         DynamicTablesResultsRoute.name,
         args: DynamicTablesResultsRouteArgs(
           key: key,
           domain: domain,
           language: language,
           variable: variable,
           yearId: yearId,
         ),
         initialChildren: children,
       );

  static const String name = 'DynamicTablesResultsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DynamicTablesResultsRouteArgs>();
      return DynamicTablesResultsPage(
        key: args.key,
        domain: args.domain,
        language: args.language,
        variable: args.variable,
        yearId: args.yearId,
      );
    },
  );
}

class DynamicTablesResultsRouteArgs {
  const DynamicTablesResultsRouteArgs({
    this.key,
    required this.domain,
    required this.language,
    required this.variable,
    required this.yearId,
  });

  final Key? key;

  final String domain;

  final DataLanguage language;

  final Variable variable;

  final int yearId;

  @override
  String toString() {
    return 'DynamicTablesResultsRouteArgs{key: $key, domain: $domain, language: $language, variable: $variable, yearId: $yearId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! DynamicTablesResultsRouteArgs) return false;
    return key == other.key &&
        domain == other.domain &&
        language == other.language &&
        variable == other.variable &&
        yearId == other.yearId;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      domain.hashCode ^
      language.hashCode ^
      variable.hashCode ^
      yearId.hashCode;
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
    Key? key,
    required String domain,
    required DataLanguage language,
    String? keyword,
    List<PageRouteInfo>? children,
  }) : super(
         InfographicsResultsRoute.name,
         args: InfographicsResultsRouteArgs(
           key: key,
           domain: domain,
           language: language,
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
        key: args.key,
        domain: args.domain,
        language: args.language,
        keyword: args.keyword,
      );
    },
  );
}

class InfographicsResultsRouteArgs {
  const InfographicsResultsRouteArgs({
    this.key,
    required this.domain,
    required this.language,
    this.keyword,
  });

  final Key? key;

  final String domain;

  final DataLanguage language;

  final String? keyword;

  @override
  String toString() {
    return 'InfographicsResultsRouteArgs{key: $key, domain: $domain, language: $language, keyword: $keyword}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! InfographicsResultsRouteArgs) return false;
    return key == other.key &&
        domain == other.domain &&
        language == other.language &&
        keyword == other.keyword;
  }

  @override
  int get hashCode =>
      key.hashCode ^ domain.hashCode ^ language.hashCode ^ keyword.hashCode;
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
    Key? key,
    required String domain,
    required DataLanguage language,
    List<PageRouteInfo>? children,
  }) : super(
         NewsCategoriesResultsRoute.name,
         args: NewsCategoriesResultsRouteArgs(
           key: key,
           domain: domain,
           language: language,
         ),
         initialChildren: children,
       );

  static const String name = 'NewsCategoriesResultsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NewsCategoriesResultsRouteArgs>();
      return NewsCategoriesResultsPage(
        key: args.key,
        domain: args.domain,
        language: args.language,
      );
    },
  );
}

class NewsCategoriesResultsRouteArgs {
  const NewsCategoriesResultsRouteArgs({
    this.key,
    required this.domain,
    required this.language,
  });

  final Key? key;

  final String domain;

  final DataLanguage language;

  @override
  String toString() {
    return 'NewsCategoriesResultsRouteArgs{key: $key, domain: $domain, language: $language}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! NewsCategoriesResultsRouteArgs) return false;
    return key == other.key &&
        domain == other.domain &&
        language == other.language;
  }

  @override
  int get hashCode => key.hashCode ^ domain.hashCode ^ language.hashCode;
}

/// generated route for
/// [NewsDetailPage]
class NewsDetailRoute extends PageRouteInfo<NewsDetailRouteArgs> {
  NewsDetailRoute({
    Key? key,
    required int newsId,
    DataLanguage language = DataLanguage.id,
    String domain = '7200',
    List<PageRouteInfo>? children,
  }) : super(
         NewsDetailRoute.name,
         args: NewsDetailRouteArgs(
           key: key,
           newsId: newsId,
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
        key: args.key,
        newsId: args.newsId,
        language: args.language,
        domain: args.domain,
      );
    },
  );
}

class NewsDetailRouteArgs {
  const NewsDetailRouteArgs({
    this.key,
    required this.newsId,
    this.language = DataLanguage.id,
    this.domain = '7200',
  });

  final Key? key;

  final int newsId;

  final DataLanguage language;

  final String domain;

  @override
  String toString() {
    return 'NewsDetailRouteArgs{key: $key, newsId: $newsId, language: $language, domain: $domain}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! NewsDetailRouteArgs) return false;
    return key == other.key &&
        newsId == other.newsId &&
        language == other.language &&
        domain == other.domain;
  }

  @override
  int get hashCode =>
      key.hashCode ^ newsId.hashCode ^ language.hashCode ^ domain.hashCode;
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
    Key? key,
    required String domain,
    required DataLanguage language,
    String? keyword,
    String? newsCategoryID,
    int? month,
    int? year,
    List<PageRouteInfo>? children,
  }) : super(
         NewsResultsRoute.name,
         args: NewsResultsRouteArgs(
           key: key,
           domain: domain,
           language: language,
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
        key: args.key,
        domain: args.domain,
        language: args.language,
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
    this.key,
    required this.domain,
    required this.language,
    this.keyword,
    this.newsCategoryID,
    this.month,
    this.year,
  });

  final Key? key;

  final String domain;

  final DataLanguage language;

  final String? keyword;

  final String? newsCategoryID;

  final int? month;

  final int? year;

  @override
  String toString() {
    return 'NewsResultsRouteArgs{key: $key, domain: $domain, language: $language, keyword: $keyword, newsCategoryID: $newsCategoryID, month: $month, year: $year}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! NewsResultsRouteArgs) return false;
    return key == other.key &&
        domain == other.domain &&
        language == other.language &&
        keyword == other.keyword &&
        newsCategoryID == other.newsCategoryID &&
        month == other.month &&
        year == other.year;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      domain.hashCode ^
      language.hashCode ^
      keyword.hashCode ^
      newsCategoryID.hashCode ^
      month.hashCode ^
      year.hashCode;
}
