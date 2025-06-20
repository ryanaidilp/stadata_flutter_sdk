part of 'stadata_list.dart';

class StadataListImpl implements StadataList {
  final GetDomains _getDomains = injector.get<GetDomains>();
  final GetAllPublication _getAllPublications =
      injector.get<GetAllPublication>();
  final GetAllInfographics _getAllInfographics =
      injector.get<GetAllInfographics>();
  final GetAllStaticTables _getAllStaticTables =
      injector.get<GetAllStaticTables>();
  final GetAllNews _getAllNews = injector.get<GetAllNews>();
  final GetAllNewsCategories _getAllNewsCategories =
      injector.get<GetAllNewsCategories>();
  final GetAllStrategicIndicators _getAllStrategicIndicators =
      injector.get<GetAllStrategicIndicators>();
  final GetAllSubjectCategories _getAllSubjectCategories =
      injector.get<GetAllSubjectCategories>();
  final GetAllSubjects _getAllSubjects = injector.get<GetAllSubjects>();
  final GetAllPressReleases _getAllPressReleases =
      injector.get<GetAllPressReleases>();
  final GetAllVariables _getAllVariables = injector.get<GetAllVariables>();
  final GetAllVerticalVariables _getAllVerticalVariables =
      injector.get<GetAllVerticalVariables>();
  final GetAllUnits _getAllUnits = injector.get<GetAllUnits>();
  final GetStatisticClassification _getStatisticClassifications =
      injector.get<GetStatisticClassification>();
  final GetListOfCensus _getListOfCensus = injector.get<GetListOfCensus>();
  final GetListOfCensusTopic _getListOfCensusTopic =
      injector.get<GetListOfCensusTopic>();
  final GetListOfCensusArea _getListOfCensusArea =
      injector.get<GetListOfCensusArea>();
  final GetListOfCensusDatasets _getListOfCensusDatasets =
      injector.get<GetListOfCensusDatasets>();

  @override
  Future<ListResult<DomainEntity>> domains({
    DomainType type = DomainType.all,
    String? provinceCode,
  }) async {
    final result = await _getDomains(
      GetDomainParam(type: type, provinceCode: provinceCode),
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
      GetAllNewsCategoriesParam(lang: lang, domain: domain),
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
      GetAllSubjectCategoriesParam(lang: lang, page: page, domain: domain),
    );

    return result.fold(
      (l) => throw SubjectCategoryException(message: l.message),
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

  @override
  Future<ListResult<VerticalVariable>> verticalVariables({
    required String domain,
    int page = 1,
    DataLanguage lang = DataLanguage.id,
    int? variableID,
  }) async {
    final result = await _getAllVerticalVariables(
      GetAllVerticalVariablesParam(
        domain: domain,
        lang: lang,
        page: page,
        variableID: variableID,
      ),
    );

    return result.fold(
      (l) => throw VerticalVariableException(message: l.message),
      (r) => ListResult<VerticalVariable>(
        data: r.data ?? [],
        dataAvailability:
            r.dataAvailability ?? DataAvailability.listNotAvailable,
        pagination: r.pagination,
      ),
    );
  }

  @override
  Future<ListResult<UnitData>> units({
    required String domain,
    int page = 1,
    DataLanguage lang = DataLanguage.id,
    int? variableID,
  }) async {
    final result = await _getAllUnits(
      GetAllUnitsParam(
        domain: domain,
        lang: lang,
        page: page,
        variableID: variableID,
      ),
    );

    return result.fold(
      (l) => throw UnitException(message: l.message),
      (r) => ListResult<UnitData>(
        data: r.data ?? [],
        dataAvailability:
            r.dataAvailability ?? DataAvailability.listNotAvailable,
        pagination: r.pagination,
      ),
    );
  }

  @override
  Future<ListResult<StatisticClassification>> statisticClassifications({
    required ClassificationType type,
    ClassificationLevel? level,
    DataLanguage lang = DataLanguage.id,
    int page = 1,
    int perPage = 10,
  }) async {
    final result = await _getStatisticClassifications.call(
      GetStatisticClassificationParam(
        type: type,
        level: level,
        lang: lang,
        page: page,
        perPage: perPage,
      ),
    );

    return result.fold(
      (l) => throw StatisticClassificationException(message: l.message),
      (r) => ListResult<StatisticClassification>(
        data: r.data ?? [],
        pagination: r.pagination,
        dataAvailability:
            r.dataAvailability ?? DataAvailability.listNotAvailable,
      ),
    );
  }

  @override
  Future<ListResult<Census>> census() async {
    final result = await _getListOfCensus.call(NoParams());

    return result.fold(
      (l) => throw CensusDataException(message: l.message),
      (r) => ListResult(
        data: r.data ?? [],
        pagination: r.pagination,
        dataAvailability:
            r.dataAvailability ?? DataAvailability.listNotAvailable,
      ),
    );
  }

  @override
  Future<ListResult<CensusTopic>> censusTopics({
    required String censusID,
  }) async {
    final result = await _getListOfCensusTopic.call(censusID);

    return result.fold(
      (l) => throw CensusTopicException(message: l.message),
      (r) => ListResult(
        data: r.data ?? [],
        pagination: r.pagination,
        dataAvailability:
            r.dataAvailability ?? DataAvailability.listNotAvailable,
      ),
    );
  }

  @override
  Future<ListResult<CensusArea>> censusEventAreas({
    required String censusID,
  }) async {
    final result = await _getListOfCensusArea.call(censusID);

    return result.fold(
      (l) => throw CensusAreaException(message: l.message),
      (r) => ListResult(
        data: r.data ?? [],
        pagination: r.pagination,
        dataAvailability:
            r.dataAvailability ?? DataAvailability.listNotAvailable,
      ),
    );
  }

  @override
  Future<ListResult<CensusDataset>> censusEventDatasets({
    required int topicID,
    required String censusID,
  }) async {
    final result = await _getListOfCensusDatasets.call(
      GetListOfCensusDatasetsParam(
        topicID: topicID,
        censusID: censusID,
      ),
    );

    return result.fold(
      (l) => throw CensusDataException(message: l.message),
      (r) => ListResult(
        data: r.data ?? [],
        pagination: r.pagination,
        dataAvailability:
            r.dataAvailability ?? DataAvailability.listNotAvailable,
      ),
    );
  }
}
