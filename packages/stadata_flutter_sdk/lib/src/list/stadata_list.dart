import 'package:stadata_flutter_sdk/src/base/base.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

part 'stadata_list_impl.dart';

abstract class StadataList {
  /// Fetches a list of domain entities from the BPS (Badan Pusat Statistik)
  /// API.
  ///
  /// Queries the BPS API for domain entities and can filter by domain type
  /// and province code.
  ///
  /// Parameters:
  ///   - `type`: The type of domains to fetch, which can be all domains,
  ///     provinces only, regencies only, etc., as defined by the `DomainType`
  ///     enum. Defaults to `DomainType.all`.
  ///   - `provinceCode`: (Optional) A string representing the specific
  ///     province code to filter domains. If provided, returns domains within
  ///     the specified province.
  ///
  /// Returns a `Future<ListResult<DomainEntity>>` which is a list
  /// of `DomainEntity` objects containing the data of the fetched domains.
  ///
  /// Usage example:
  /// ```dart
  /// domains(
  ///   type: DomainType.province,
  ///   provinceCode: '72',
  /// );
  /// ```
  /// Returns:
  ///   A `Future` that resolves to a `ListResult<DomainEntity>`, containing a
  ///   list of `DomainEntity` objects.
  ///
  /// See: https://webapi.bps.go.id/documentation/#domain for more information
  /// about the API response structure.
  Future<ListResult<DomainEntity>> domains({
    DomainType type = DomainType.all,
    String? provinceCode,
  });

  /// Fetches a list of publications from the BPS (Badan Pusat Statistik) API.
  ///
  /// Queries the BPS API for publications related to a specified domain
  /// and applies filters such as language, page number, keyword, month, and
  /// year.
  ///
  /// Parameters:
  ///   - `domain`: The area code representing the geographical domain for which
  ///     publications are to be fetched. This could be a province code, a
  ///     regency code, or '0000' for national-level data.
  ///   - `lang`: (Optional) The language for data representation, which can be
  ///     Indonesian (`DataLanguage.id`) or English (`DataLanguage.en`).
  ///     Defaults to Indonesian.
  ///   - `page`: (Optional) The page number for paginated results.
  ///     Defaults to 1.
  ///   - `keyword`: (Optional) A string used for searching specific content
  ///     within publications. If provided, filters the results by the given
  ///     keyword.
  ///   - `month`: (Optional) An integer representing the month of publication.
  ///     If provided, filters the results to the specified month.
  ///   - `year`: (Optional) An integer representing the year of publication.
  ///     If provided, filters the results to the specified year.
  ///
  /// Returns a `Future<ListResult<Publication>>` which is a paginated list
  /// of `Publication` objects containing the data of the fetched publications.
  ///
  /// Usage example:
  /// ```dart
  /// publications(
  ///   domain: '0000',
  ///   lang: DataLanguage.eng,
  ///   page: 2,
  ///   keyword: 'statistical',
  ///   month: 12,
  ///   year: 2023,
  /// );
  /// ```
  /// Returns:
  ///   A `Future` that resolves to a `ListResult<Publication>`, containing a
  ///   list of `Publication` objects and associated metadata.
  ///
  /// See: https://webapi.bps.go.id/documentation/#publication_2 for more information
  /// about the API response structure.
  Future<ListResult<Publication>> publications({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    String? keyword,
    int? month,
    int? year,
  });

  /// Fetches a list of infographics from the BPS (Badan Pusat Statistik) API.
  ///
  /// Queries the BPS API for infographics related to a specified domain
  /// and applies filters such as language, page number, and keyword.
  ///
  /// Parameters:
  ///   - `domain`: The area code representing the geographical domain for which
  ///     infographics are to be fetched. This could be a province code, a
  ///     regency code, or '0000' for national-level data.
  ///   - `lang`: (Optional) The language for data representation, which can be
  ///     Indonesian (`DataLanguage.id`) or English (`DataLanguage.en`).
  ///     Defaults to Indonesian.
  ///   - `page`: (Optional) The page number for paginated results.
  ///     Defaults to 1.
  ///   - `keyword`: (Optional) A string used for searching specific content
  ///     within infographics. If provided, filters the results by the given
  ///     keyword.
  ///
  /// Returns a `Future<ListResult<Infographic>>` which is a paginated list
  /// of `Infographic` objects containing the data of the fetched infographics.
  ///
  /// Usage example:
  /// ```dart
  /// infographics(
  ///   domain: '0000',
  ///   lang: DataLanguage.eng,
  ///   page: 2,
  ///   keyword: 'economy',
  /// );
  /// ```
  /// Returns:
  ///   A `Future` that resolves to a `ListResult<Infographic>`, containing a
  ///   list of `Infographic` objects.
  ///
  /// See: https://webapi.bps.go.id/documentation/#infographic for more information
  /// about the API response structure.
  Future<ListResult<Infographic>> infographics({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    String? keyword,
  });

  /// Fetches a list of static tables from the BPS (Badan Pusat Statistik) API.
  ///
  /// Queries the BPS API for static tables related to a specified domain
  /// and applies filters such as language, page number, keyword, month, and
  /// year.
  ///
  /// Parameters:
  ///   - `domain`: The area code representing the geographical domain for which
  ///     static tables are to be fetched. This could be a province code, a
  ///     regency code, or '0000' for national-level data.
  ///   - `lang`: (Optional) The language for data representation, which can be
  ///     Indonesian (`DataLanguage.id`) or English (`DataLanguage.en`).
  ///     Defaults to Indonesian.
  ///   - `page`: (Optional) The page number for paginated results.
  ///     Defaults to 1.
  ///   - `keyword`: (Optional) A string used for searching specific content
  ///     within static tables. If provided, filters the results by the given
  ///     keyword.
  ///   - `month`: (Optional) An integer representing the month for which
  ///     static tables are to be fetched. If provided, filters the results to
  ///     the specified month.
  ///   - `year`: (Optional) An integer representing the year for which static
  ///     tables  are to be fetched. If provided, filters the results to the
  ///     specified year.
  ///
  /// Returns a `Future<ListResult<StaticTable>>` which is a paginated list
  /// of `StaticTable` objects containing the data of the fetched static tables.
  ///
  /// Usage example:
  /// ```dart
  /// staticTables(
  ///   domain: '0000',
  ///   lang: DataLanguage.eng,
  ///   page: 2,
  ///   keyword: 'agriculture',
  ///   month: 12,
  ///   year: 2023,
  /// );
  /// ```
  /// Returns:
  ///   A `Future` that resolves to a `ListResult<StaticTable>`, containing a
  ///   list of `StaticTable` objects and associated metadata.
  ///
  /// See: https://webapi.bps.go.id/documentation/#statictable_2 for more information
  /// about the API response structure.
  Future<ListResult<StaticTable>> staticTables({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    String? keyword,
    int? month,
    int? year,
  });

  /// Fetches a list of news articles from the BPS (Badan Pusat Statistik) API.
  ///
  /// Queries the BPS API for news articles related to a specified domain
  /// and applies filters such as language, page number, keyword, news category
  /// ID, month, and year.
  ///
  /// Parameters:
  ///   - `domain`: The area code representing the geographical domain for which
  ///     news articles are to be fetched. This could be a province code, a
  ///     regency code, or '0000' for national-level data.
  ///   - `lang`: (Optional) The language for data representation, which can be
  ///     Indonesian (`DataLanguage.id`) or English (`DataLanguage.en`).
  ///     Defaults to Indonesian.
  ///   - `page`: (Optional) The page number for paginated results.
  ///     Defaults to 1.
  ///   - `keyword`: (Optional) A string used for searching specific content
  ///     within news articles. If provided, filters the results by the given
  ///     keyword.
  ///   - `newsCategoryID`: (Optional) The ID of the news category to filter
  ///     news articles. This is the new parameter to use in place of the
  ///     deprecated `newsCategoryId`.
  ///   - `newsCategoryId`: (Deprecated) Use `newsCategoryID` instead.
  ///     The old parameter for filtering by news category ID.
  ///   - `month`: (Optional) An integer representing the month for which news
  ///     articles are to be fetched. If provided, filters the results to the
  ///     specified month.
  ///   - `year`: (Optional) An integer representing the year for which news
  ///     articles are to be fetched. If provided, filters the results to the \
  ///     specified year.
  ///
  /// Returns a `Future<ListResult<News>>` which is a paginated list
  /// of `News` objects containing the data of the fetched news articles.
  ///
  /// Usage example:
  /// ```dart
  /// news(
  ///   domain: '0000',
  ///   lang: DataLanguage.eng,
  ///   page: 2,
  ///   keyword: 'economy',
  ///   newsCategoryID: '5',
  ///   month: 12,
  ///   year: 2023,
  /// );
  /// ```
  /// Returns:
  ///   A `Future` that resolves to a `ListResult<News>`, containing a
  ///   list of `News` objects and associated metadata.
  ///
  /// See: https://webapi.bps.go.id/documentation/#news_2 for more information
  /// about the API response structure.
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

  /// Fetches a list of news categories from the BPS (Badan Pusat Statistik)
  /// API.
  ///
  /// Queries the BPS API for news categories related to a specified domain
  /// and applies filters such as language.
  ///
  /// Parameters:
  ///   - `domain`: The area code representing the geographical domain for which
  ///     news categories are to be fetched. This could be a province code, a
  ///     regency code, or '0000' for national-level data.
  ///   - `lang`: (Optional) The language for data representation, which can be
  ///     Indonesian (`DataLanguage.id`) or English (`DataLanguage.en`).
  ///     Defaults to Indonesian.
  ///
  /// Returns a `Future<ListResult<NewsCategory>>` which is a list
  /// of `NewsCategory` objects containing the data of the fetched news
  /// categories.
  ///
  /// Usage example:
  /// ```dart
  /// newsCategories(
  ///   domain: '0000',
  ///   lang: DataLanguage.eng,
  /// );
  /// ```
  /// Returns:
  ///   A `Future` that resolves to a `ListResult<NewsCategory>`, containing a
  ///   list of `NewsCategory` objects.
  ///
  /// See: https://webapi.bps.go.id/documentation/#news_3 for more information
  /// about the API response structure.
  Future<ListResult<NewsCategory>> newsCategories({
    required String domain,
    DataLanguage lang = DataLanguage.id,
  });

  /// Fetches a list of strategic indicators from the BPS
  /// (Badan Pusat Statistik) API.
  ///
  /// Queries the BPS API for strategic indicators related to a specified domain
  /// and applies filters such as language, variable ID, and page number.
  ///
  /// Parameters:
  ///   - `domain`: The area code representing the geographical domain for which
  ///     strategic indicators are to be fetched. This could be a province code,
  ///     a regency code, or '0000' for national-level data.
  ///   - `lang`: (Optional) The language for data representation, which can be
  ///     Indonesian (`DataLanguage.id`) or English (`DataLanguage.en`).
  ///     Defaults to Indonesian.
  ///   - `variableID`: (Optional) The ID of the variable for which strategic
  ///     indicators are to be fetched. If provided, filters the results to the
  ///     specified variable.
  ///   - `page`: (Optional) The page number for paginated results.
  ///     Defaults to 1.
  ///
  /// Returns a `Future<ListResult<StrategicIndicator>>` which is a paginated
  /// list of `StrategicIndicator` objects containing the data of the fetched
  /// strategic indicators.
  ///
  /// Usage example:
  /// ```dart
  /// strategicIndicators(
  ///   domain: '0000',
  ///   lang: DataLanguage.eng,
  ///   variableID: 1234,
  ///   page: 2,
  /// );
  /// ```
  /// Returns:
  ///   A `Future` that resolves to a `ListResult<StrategicIndicator>`,
  ///  containing a list of `StrategicIndicator` objects and associated
  ///  metadata.
  ///
  /// See: https://webapi.bps.go.id/documentation/#strategicindicator for more information
  /// about the API response structure.
  Future<ListResult<StrategicIndicator>> strategicIndicators({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int? variableID,
    int page = 1,
  });

  /// Fetches a list of subject categories from the BPS (Badan Pusat Statistik)
  /// API.
  ///
  /// Queries the BPS API for subject categories related to a specified domain
  /// and applies filters such as language and page number.
  ///
  /// Parameters:
  ///   - `domain`: The area code representing the geographical domain for which
  ///     subject categories are to be fetched. This could be a province code, a
  ///     regency code, or '0000' for national-level data.
  ///   - `lang`: (Optional) The language for data representation, which can be
  ///     Indonesian (`DataLanguage.id`) or English (`DataLanguage.en`).
  ///     Defaults to Indonesian.
  ///   - `page`: (Optional) The page number for paginated results.
  ///     Defaults to 1.
  ///
  /// Returns a `Future<ListResult<SubjectCategory>>` which is a paginated list
  /// of `SubjectCategory` objects containing the data of the fetched subject
  /// categories.
  ///
  /// Usage example:
  /// ```dart
  /// subjectCategories(
  ///   domain: '0000',
  ///   lang: DataLanguage.eng,
  ///   page: 2,
  /// );
  /// ```
  /// Returns:
  ///   A `Future` that resolves to a `ListResult<SubjectCategory>`, containing
  ///  a list of `SubjectCategory` objects and associated metadata.
  ///
  /// See: https://webapi.bps.go.id/documentation/#subjectcategories for more information
  /// about the API response structure.
  Future<ListResult<SubjectCategory>> subjectCategories({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
  });

  /// Fetches a list of subjects from the BPS (Badan Pusat Statistik) API.
  ///
  /// Queries the BPS API for subjects related to a specified domain
  /// and applies filters such as subject category, language, and page number.
  ///
  /// Parameters:
  ///   - `domain`: The area code representing the geographical domain for which
  ///     subjects are to be fetched. This could be a province code, a regency
  ///     code, or '0000' for national-level data.
  ///   - `subjectCategoryID`: (Optional) The ID representing the category of
  ///     the subjects. This is the newer field that replaces the deprecated
  ///     `subjectCategoryId`.
  ///   - `subjectCategoryId`: (Deprecated) Use `subjectCategoryID` instead.
  ///     The old parameter for the subject category ID.
  ///   - `lang`: (Optional) The language for data representation, which can be
  ///     Indonesian (`DataLanguage.id`) or English (`DataLanguage.en`).
  ///     Defaults to Indonesian.
  ///   - `page`: (Optional) The page number for paginated results.
  ///     Defaults to 1.
  ///
  /// Returns a `Future<ListResult<Subject>>` which is a paginated list
  /// of `Subject` objects containing the data of the fetched subjects.
  ///
  /// Usage example:
  /// ```dart
  /// subjects(
  ///   domain: '0000',
  ///   subjectCategoryID: 2,
  ///   lang: DataLanguage.en,
  ///   page: 1,
  /// );
  /// ```
  /// Returns:
  ///   A `Future` that resolves to a `ListResult<Subject>`, containing a
  ///   list of `Subject` objects and associated metadata.
  ///
  /// See: https://webapi.bps.go.id/documentation/#subject for more information
  /// about the API response structure.
  Future<ListResult<Subject>> subjects({
    required String domain,
    int? subjectCategoryID,
    @Deprecated('Use subjectCategoryID instead') int? subjectCategoryId,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
  });

  /// Fetches a list of press releases from the BPS (Badan Pusat Statistik) API.
  ///
  /// Queries the BPS API for press releases related to a specified domain
  /// and applies filters such as language, page number, keyword, month, and
  /// year.
  ///
  /// Parameters:
  ///   - `domain`: The area code representing the geographical domain for which
  ///      press release are to be fetched. This could be a province code (e.g.,
  ///      '7200' for Central Sulawesi), a regency code (e.g., '7205' for
  ///      DonggalaRegency), or '0000' for national-level data.
  ///   - `page`: (Optional) The page number for paginated results.
  ///      Defaults to 1.
  ///   - `lang`: (Optional) The language for data representation, which can be
  ///      Indonesian (`DataLanguage.id`) or English (`DataLanguage.en`).
  ///      Defaults to Indonesian.
  ///   - `keyword`: An optional string used for searching specific content
  ///     within press releases. If provided, filters the results by the given
  ///     keyword.
  ///   - `month`: An optional integer representing the month of the press
  ///     release. If provided, filters the results to the specified month.
  ///   - `year`: An optional integer representing the year of the press
  ///     release. If provided, filters the results to the specified year.
  ///
  /// Returns a `Future<ListResult<PressRelease>>` which is a paginated list
  /// of `PressRelease` objects containing the data of the fetched press
  /// releases.
  ///
  /// Usage example:
  /// ```dart
  /// pressReleases(
  ///   domain: '0000',
  ///   lang: DataLanguage.eng,
  ///   page: 2,
  ///   keyword: 'economy',
  /// );
  /// ```
  /// Returns:
  ///   A `Future` that resolves to a `ListResult<PressRelease>`, containing a
  ///  list of  `PressRelease` objects and associated metadata.
  ///
  /// See: https://webapi.bps.go.id/documentation/#pressrelease_2 for more information
  /// about the API response structure.
  Future<ListResult<PressRelease>> pressReleases({
    required String domain,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    String? keyword,
    int? month,
    int? year,
  });

  /// Fetches a list of `Variable` objects from the BPS API.
  ///
  /// This function retrieves statistical variables from the Badan Pusat
  /// Statistik (BPS) API, based on the specified domain and other optional
  /// parameters. It is capable of fetching data for a specific region (
  /// province/regency/national level) and can filter the variables based on
  /// their existence in the specified domain.
  ///
  /// Parameters:
  ///   - `domain`: The area code representing the geographical domain for which
  ///      variables are to be fetched. This could be a province code (e.g.,
  ///      '7200' for Central Sulawesi), a regency code (e.g., '7205' for
  ///      DonggalaRegency), or '0000' for national-level data.
  ///   - `page`: (Optional) The page number for paginated results.
  ///      Defaults to 1.
  ///   - `lang`: (Optional) The language for data representation, which can be
  ///      Indonesian (`DataLanguage.id`) or English (`DataLanguage.en`).
  ///      Defaults to Indonesian.
  ///   - `showExistingVariables`: (Optional) A boolean flag to determine
  ///      whether to only show variables that have values for the specified
  ///      domain. When set to `true`, the function translates this to the
  ///      'area' query parameter with a value of 1, filtering the variables
  ///      to include only those that have existing values in the domain.
  ///      Defaults to `false`.
  ///   - `year`: (Optional) The specific year for which variables are being
  ///      requested.
  ///   - `subjectID`: (Optional) The identifier for a specific subject/category under
  ///     which variables are categorized.
  ///
  ///Usage example:
  /// ```dart
  /// variables(
  ///   domain: '0000',
  ///   lang: DataLanguage.eng,
  ///   page: 2,
  /// );
  /// ```
  ///
  /// Returns:
  ///   A `Future` that resolves to a `ListResult<Variable>`, containing a
  ///  list of  `Variable` objects and associated metadata.
  ///
  /// See: https://webapi.bps.go.id/documentation/#dynamicdata_6 for more information
  /// about the API response structure.
  Future<ListResult<Variable>> variables({
    required String domain,
    int page = 1,
    DataLanguage lang = DataLanguage.id,
    bool showExistingVariables = false,
    int? year,
    int? subjectID,
  });

  /// Fetches a list of vertical variables from the BPS (Badan Pusat Statistik)
  /// API.
  ///
  /// Queries the BPS API for vertical variables related to a specified domain
  /// and applies filters such as language, page number, and specific variable
  /// ID.
  ///
  /// Parameters:
  ///   - `domain`: The area code representing the geographical domain for which
  ///     vertical variables are to be fetched. This could be a province code, a
  ///     regency code, or '0000' for national-level data.
  ///   - `page`: (Optional) The page number for paginated results.
  ///     Defaults to 1.
  ///   - `lang`: (Optional) The language for data representation, which can be
  ///     Indonesian (`DataLanguage.id`) or English (`DataLanguage.en`).
  ///     Defaults to Indonesian.
  ///   - `variableID`: (Optional) The ID of a specific variable for which
  ///     vertical variables are to be fetched. If provided, filters the results
  ///     to include vertical variables related to the specified variable ID.
  ///
  /// Returns a `Future<ListResult<VerticalVariable>>` which is a paginated list
  /// of `VerticalVariable` objects containing the data of the fetched vertical
  /// variables.
  ///
  /// Usage example:
  /// ```dart
  /// verticalVariables(
  ///   domain: '0000',
  ///   lang: DataLanguage.eng,
  ///   page: 2,
  ///   variableID: 1234,
  /// );
  /// ```
  /// Returns:
  ///   A `Future` that resolves to a `ListResult<VerticalVariable>`, containing
  ///   a list of `VerticalVariable` objects and associated metadata.
  ///
  /// See: https://webapi.bps.go.id/documentation/#dynamicdata_7 for more information
  /// about the API response structure.
  Future<ListResult<VerticalVariable>> verticalVariables({
    required String domain,
    int page = 1,
    DataLanguage lang = DataLanguage.id,
    int? variableID,
  });

  /// Fetches a list of unit data from the BPS (Badan Pusat Statistik) API.
  ///
  /// Queries the BPS API for unit data related to a specified domain
  /// and applies filters such as language, page number, and specific variable
  /// ID.
  ///
  /// Parameters:
  ///   - `domain`: The area code representing the geographical domain for which
  ///     unit data are to be fetched. This could be a province code, a
  ///     regency code, or '0000' for national-level data.
  ///   - `page`: (Optional) The page number for paginated results.
  ///     Defaults to 1.
  ///   - `lang`: (Optional) The language for data representation, which can be
  ///     Indonesian (`DataLanguage.id`) or English (`DataLanguage.en`).
  ///     Defaults to Indonesian.
  ///   - `variableID`: (Optional) The ID of a specific variable for which unit
  ///     data are to be fetched. If provided, filters the results to include
  ///     unit data related to the specified variable ID.
  ///
  /// Returns a `Future<ListResult<UnitData>>` which is a paginated list
  /// of `UnitData` objects containing the data of the fetched units.
  ///
  /// Usage example:
  /// ```dart
  /// units(
  ///   domain: '0000',
  ///   lang: DataLanguage.eng,
  ///   page: 2,
  ///   variableID: 1234,
  /// );
  /// ```
  /// Returns:
  ///   A `Future` that resolves to a `ListResult<UnitData>`, containing a
  ///   list of `UnitData` objects and associated metadata.
  ///
  /// See: https://webapi.bps.go.id/documentation/#dynamicdata_5 for more information
  /// about the API response structure.
  Future<ListResult<UnitData>> units({
    required String domain,
    int page = 1,
    DataLanguage lang = DataLanguage.id,
    int? variableID,
  });

  Future<ListResult<StatisticClassification>> statisticClassifications({
    required ClassificationType type,
    ClassificationLevel? level,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    int perPage = 10,
  });

  /// Retrieves a list of census data from the BPS API.
  ///
  /// Returns a paginated list of census data containing information about
  /// various censuses conducted by BPS, including population census,
  /// agricultural census, economic census, etc.
  ///
  /// Returns a `Future<ListResult<Census>>` which contains a list of `Census`
  /// objects representing different census data.
  ///
  /// Usage example:
  /// ```dart
  /// final censusResult = await census();
  /// ```
  ///
  /// Returns:
  ///   A `Future` that resolves to a `ListResult<Census>`, containing a
  ///   list of `Census` objects and associated metadata.
  ///
  /// See: https://webapi.bps.go.id/documentation/#census for more information
  /// about the API response structure.
  Future<ListResult<Census>> census();

  /// Retrieves a list of census topic data from the BPS API.
  ///
  /// Returns a paginated list of census toic data containing information about
  /// topic of selected census conducted by BPS, including population census,
  /// agricultural census, economic census, etc.
  ///
  /// Returns a `Future<ListResult<CensusTopic>>` which contains a list of `CensusTopic`
  /// objects representing different census data.
  ///
  /// Usage example:
  /// ```dart
  /// final censusResult = await censusTopics(
  ///   censusID: 'sp2020',
  /// );
  /// ```
  ///
  /// Returns:
  ///   A `Future` that resolves to a `ListResult<CensusTopic>`, containing a
  ///   list of `CensusTopic` objects and associated metadata.
  ///
  /// See: https://webapi.bps.go.id/documentation/#census for more information
  /// about the API response structure.
  Future<ListResult<CensusTopic>> censusTopics({required String censusID});

  /// Fetches a list of areas for a specific census event from the BPS (Badan Pusat Statistik) API.
  ///
  /// Queries the BPS API for areas associated with a given census event (e.g., "sp2020").
  ///
  /// Parameters:
  ///   - `censusID`: The ID of the census event (e.g., "sp2020") for which to fetch areas.
  ///
  /// Returns a `Future<ListResult<CensusArea>>` which is a list of `CensusArea` objects
  /// containing the data of the fetched census event areas.
  ///
  /// Usage example:
  /// ```dart
  /// censusEventAreas(
  ///   censusID: 'sp2020',
  /// );
  /// ```
  /// Returns:
  ///   A `Future` that resolves to a `ListResult<CensusArea>`, containing a list of `CensusArea` objects.
  ///
  /// See: https://webapi.bps.go.id/documentation/#census for more information about the API response structure.
  Future<ListResult<CensusArea>> censusEventAreas({required String censusID});
}
