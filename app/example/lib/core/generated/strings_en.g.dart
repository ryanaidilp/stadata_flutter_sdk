///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final TranslationsAppEn app = TranslationsAppEn._(_root);
	late final TranslationsNavigationEn navigation = TranslationsNavigationEn._(_root);
	late final TranslationsCommonEn common = TranslationsCommonEn._(_root);
	late final TranslationsErrorsEn errors = TranslationsErrorsEn._(_root);
	late final TranslationsHomeEn home = TranslationsHomeEn._(_root);
	late final TranslationsListApiEn listApi = TranslationsListApiEn._(_root);
	late final TranslationsViewApiEn viewApi = TranslationsViewApiEn._(_root);
	late final TranslationsDomainsEn domains = TranslationsDomainsEn._(_root);
	late final TranslationsInfographicsEn infographics = TranslationsInfographicsEn._(_root);
	late final TranslationsPublicationsEn publications = TranslationsPublicationsEn._(_root);
	late final TranslationsNewsEn news = TranslationsNewsEn._(_root);
	late final TranslationsNewsCategoriesEn newsCategories = TranslationsNewsCategoriesEn._(_root);
	late final TranslationsDynamicTablesEn dynamicTables = TranslationsDynamicTablesEn._(_root);
	late final TranslationsPressReleasesEn pressReleases = TranslationsPressReleasesEn._(_root);
	late final TranslationsStaticTablesEn staticTables = TranslationsStaticTablesEn._(_root);
	late final TranslationsStrategicIndicatorsEn strategicIndicators = TranslationsStrategicIndicatorsEn._(_root);
	late final TranslationsCensusTopicsEn censusTopics = TranslationsCensusTopicsEn._(_root);
	late final TranslationsCensusDatasetsEn censusDatasets = TranslationsCensusDatasetsEn._(_root);
	late final TranslationsCensusDataEn censusData = TranslationsCensusDataEn._(_root);
	late final TranslationsCensusAreasEn censusAreas = TranslationsCensusAreasEn._(_root);
	late final TranslationsSubjectCategoriesEn subjectCategories = TranslationsSubjectCategoriesEn._(_root);
	late final TranslationsSubjectsEn subjects = TranslationsSubjectsEn._(_root);
	late final TranslationsUnitsEn units = TranslationsUnitsEn._(_root);
	late final TranslationsVariablesEn variables = TranslationsVariablesEn._(_root);
	late final TranslationsVerticalVariablesEn verticalVariables = TranslationsVerticalVariablesEn._(_root);
	late final TranslationsSharedEn shared = TranslationsSharedEn._(_root);
	late final TranslationsValidationEn validation = TranslationsValidationEn._(_root);
	late final TranslationsCategoriesEn categories = TranslationsCategoriesEn._(_root);
	late final TranslationsInstructionsEn instructions = TranslationsInstructionsEn._(_root);
	late final TranslationsSettingsEn settings = TranslationsSettingsEn._(_root);
	late final TranslationsStatisticalClassificationsEn statisticalClassifications = TranslationsStatisticalClassificationsEn._(_root);
	late final TranslationsCensusEventsEn censusEvents = TranslationsCensusEventsEn._(_root);
}

// Path: app
class TranslationsAppEn {
	TranslationsAppEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'STADATA Example'
	String get title => 'STADATA Example';

	/// en: 'Showcase of STADATA Flutter SDK capabilities'
	String get description => 'Showcase of STADATA Flutter SDK capabilities';
}

// Path: navigation
class TranslationsNavigationEn {
	TranslationsNavigationEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Home'
	String get home => 'Home';

	/// en: 'List API'
	String get listApi => 'List API';

	/// en: 'View API'
	String get viewApi => 'View API';

	/// en: 'Dynamic Tables'
	String get dynamicTables => 'Dynamic Tables';

	/// en: 'Periods'
	String get periods => 'Periods';

	/// en: 'Page Not Found'
	String get pageNotFound => 'Page Not Found';

	/// en: 'The page you are looking for does not exist.'
	String get pageNotFoundMessage => 'The page you are looking for does not exist.';
}

// Path: common
class TranslationsCommonEn {
	TranslationsCommonEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Loading...'
	String get loading => 'Loading...';

	/// en: 'Error'
	String get error => 'Error';

	/// en: 'Retry'
	String get retry => 'Retry';

	/// en: 'No data available'
	String get noData => 'No data available';

	/// en: 'Search'
	String get search => 'Search';

	/// en: 'Refresh'
	String get refresh => 'Refresh';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'Save'
	String get save => 'Save';

	/// en: 'Delete'
	String get delete => 'Delete';

	/// en: 'Edit'
	String get edit => 'Edit';

	/// en: 'Create'
	String get create => 'Create';

	/// en: 'Update'
	String get update => 'Update';

	/// en: 'Back'
	String get back => 'Back';

	/// en: 'Next'
	String get next => 'Next';

	/// en: 'Previous'
	String get previous => 'Previous';

	/// en: 'Page'
	String get page => 'Page';

	/// en: 'Total'
	String get total => 'Total';

	/// en: 'items'
	String get items => 'items';

	/// en: 'of'
	String get of => 'of';

	/// en: 'Language'
	String get language => 'Language';

	/// en: 'Details'
	String get details => 'Details';

	/// en: 'Unknown state'
	String get unknownState => 'Unknown state';

	/// en: 'Show more'
	String get showMore => 'Show more';

	/// en: 'Show less'
	String get showLess => 'Show less';
}

// Path: errors
class TranslationsErrorsEn {
	TranslationsErrorsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Something went wrong. Please try again.'
	String get generic => 'Something went wrong. Please try again.';

	/// en: 'Network error. Please check your connection.'
	String get network => 'Network error. Please check your connection.';

	/// en: 'Data not found.'
	String get notFound => 'Data not found.';

	/// en: 'Request timeout. Please try again.'
	String get timeout => 'Request timeout. Please try again.';

	/// en: 'Unauthorized access.'
	String get unauthorized => 'Unauthorized access.';

	/// en: 'Server error. Please try again later.'
	String get serverError => 'Server error. Please try again later.';
}

// Path: home
class TranslationsHomeEn {
	TranslationsHomeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Welcome to STADATA'
	String get title => 'Welcome to STADATA';

	/// en: 'Explore Indonesian Statistical Data'
	String get subtitle => 'Explore Indonesian Statistical Data';

	/// en: 'Access comprehensive statistical data from Badan Pusat Statistik (BPS) Indonesia through this showcase application.'
	String get description => 'Access comprehensive statistical data from Badan Pusat Statistik (BPS) Indonesia through this showcase application.';

	late final TranslationsHomeFeaturesEn features = TranslationsHomeFeaturesEn._(_root);
	late final TranslationsHomeAboutDemoEn aboutDemo = TranslationsHomeAboutDemoEn._(_root);
	late final TranslationsHomeSectionsEn sections = TranslationsHomeSectionsEn._(_root);
}

// Path: listApi
class TranslationsListApiEn {
	TranslationsListApiEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'List API'
	String get title => 'List API';

	/// en: 'Explore statistical data collections from BPS'
	String get subtitle => 'Explore statistical data collections from BPS';

	late final TranslationsListApiSectionsEn sections = TranslationsListApiSectionsEn._(_root);
}

// Path: viewApi
class TranslationsViewApiEn {
	TranslationsViewApiEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'View API'
	String get title => 'View API';

	/// en: 'Detailed information views'
	String get subtitle => 'Detailed information views';

	late final TranslationsViewApiSectionsEn sections = TranslationsViewApiSectionsEn._(_root);
}

// Path: domains
class TranslationsDomainsEn {
	TranslationsDomainsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Domains'
	String get title => 'Domains';

	late final TranslationsDomainsTypesEn types = TranslationsDomainsTypesEn._(_root);
	late final TranslationsDomainsFieldsEn fields = TranslationsDomainsFieldsEn._(_root);
	late final TranslationsDomainsParametersEn parameters = TranslationsDomainsParametersEn._(_root);
	late final TranslationsDomainsRequestDetailsEn requestDetails = TranslationsDomainsRequestDetailsEn._(_root);
	late final TranslationsDomainsResultsEn results = TranslationsDomainsResultsEn._(_root);
	late final TranslationsDomainsEducationEn education = TranslationsDomainsEducationEn._(_root);
}

// Path: infographics
class TranslationsInfographicsEn {
	TranslationsInfographicsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Infographics'
	String get title => 'Infographics';

	late final TranslationsInfographicsFieldsEn fields = TranslationsInfographicsFieldsEn._(_root);
	late final TranslationsInfographicsParametersEn parameters = TranslationsInfographicsParametersEn._(_root);
	late final TranslationsInfographicsRequestDetailsEn requestDetails = TranslationsInfographicsRequestDetailsEn._(_root);
	late final TranslationsInfographicsResultsEn results = TranslationsInfographicsResultsEn._(_root);
	late final TranslationsInfographicsEducationEn education = TranslationsInfographicsEducationEn._(_root);
}

// Path: publications
class TranslationsPublicationsEn {
	TranslationsPublicationsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Publications'
	String get title => 'Publications';

	/// en: 'Publications Page - Coming Soon'
	String get comingSoon => 'Publications Page - Coming Soon';

	late final TranslationsPublicationsDetailEn detail = TranslationsPublicationsDetailEn._(_root);
	late final TranslationsPublicationsFieldsEn fields = TranslationsPublicationsFieldsEn._(_root);
	late final TranslationsPublicationsParametersEn parameters = TranslationsPublicationsParametersEn._(_root);
	late final TranslationsPublicationsRequestDetailsEn requestDetails = TranslationsPublicationsRequestDetailsEn._(_root);
	late final TranslationsPublicationsResultsEn results = TranslationsPublicationsResultsEn._(_root);
	late final TranslationsPublicationsEducationEn education = TranslationsPublicationsEducationEn._(_root);
}

// Path: news
class TranslationsNewsEn {
	TranslationsNewsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'News'
	String get title => 'News';

	/// en: 'Categories'
	String get categories => 'Categories';

	late final TranslationsNewsFieldsEn fields = TranslationsNewsFieldsEn._(_root);
	late final TranslationsNewsParametersEn parameters = TranslationsNewsParametersEn._(_root);
	late final TranslationsNewsRequestDetailsEn requestDetails = TranslationsNewsRequestDetailsEn._(_root);
	late final TranslationsNewsResultsEn results = TranslationsNewsResultsEn._(_root);
	late final TranslationsNewsDetailEn detail = TranslationsNewsDetailEn._(_root);
	late final TranslationsNewsEducationEn education = TranslationsNewsEducationEn._(_root);
}

// Path: newsCategories
class TranslationsNewsCategoriesEn {
	TranslationsNewsCategoriesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'News Categories'
	String get title => 'News Categories';

	late final TranslationsNewsCategoriesFieldsEn fields = TranslationsNewsCategoriesFieldsEn._(_root);
	late final TranslationsNewsCategoriesParametersEn parameters = TranslationsNewsCategoriesParametersEn._(_root);
	late final TranslationsNewsCategoriesRequestDetailsEn requestDetails = TranslationsNewsCategoriesRequestDetailsEn._(_root);
	late final TranslationsNewsCategoriesResultsEn results = TranslationsNewsCategoriesResultsEn._(_root);
	late final TranslationsNewsCategoriesCategoryDetailEn categoryDetail = TranslationsNewsCategoriesCategoryDetailEn._(_root);
	late final TranslationsNewsCategoriesEducationEn education = TranslationsNewsCategoriesEducationEn._(_root);
}

// Path: dynamicTables
class TranslationsDynamicTablesEn {
	TranslationsDynamicTablesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Dynamic Tables'
	String get title => 'Dynamic Tables';

	late final TranslationsDynamicTablesParametersEn parameters = TranslationsDynamicTablesParametersEn._(_root);
	late final TranslationsDynamicTablesRequestDetailsEn requestDetails = TranslationsDynamicTablesRequestDetailsEn._(_root);
	late final TranslationsDynamicTablesResultsEn results = TranslationsDynamicTablesResultsEn._(_root);
	late final TranslationsDynamicTablesWorkflowEn workflow = TranslationsDynamicTablesWorkflowEn._(_root);
	late final TranslationsDynamicTablesStatesEn states = TranslationsDynamicTablesStatesEn._(_root);
}

// Path: pressReleases
class TranslationsPressReleasesEn {
	TranslationsPressReleasesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Press Releases'
	String get title => 'Press Releases';

	/// en: 'Press Releases Page - Coming Soon'
	String get comingSoon => 'Press Releases Page - Coming Soon';

	late final TranslationsPressReleasesDetailEn detail = TranslationsPressReleasesDetailEn._(_root);
	late final TranslationsPressReleasesFieldsEn fields = TranslationsPressReleasesFieldsEn._(_root);
	late final TranslationsPressReleasesParametersEn parameters = TranslationsPressReleasesParametersEn._(_root);
	late final TranslationsPressReleasesResultsEn results = TranslationsPressReleasesResultsEn._(_root);
	late final TranslationsPressReleasesActionsEn actions = TranslationsPressReleasesActionsEn._(_root);
}

// Path: staticTables
class TranslationsStaticTablesEn {
	TranslationsStaticTablesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Static Tables'
	String get title => 'Static Tables';

	/// en: 'Pre-defined statistical tables with data in HTML and Excel formats'
	String get description => 'Pre-defined statistical tables with data in HTML and Excel formats';

	/// en: 'No static tables found'
	String get noDataFound => 'No static tables found';

	/// en: '(one) {Found $n static table} (other) {Found $n static tables}'
	String found({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		one: 'Found ${n} static table',
		other: 'Found ${n} static tables',
	);

	late final TranslationsStaticTablesFieldsEn fields = TranslationsStaticTablesFieldsEn._(_root);
	late final TranslationsStaticTablesParametersEn parameters = TranslationsStaticTablesParametersEn._(_root);
	late final TranslationsStaticTablesActionsEn actions = TranslationsStaticTablesActionsEn._(_root);
	late final TranslationsStaticTablesDetailEn detail = TranslationsStaticTablesDetailEn._(_root);
}

// Path: strategicIndicators
class TranslationsStrategicIndicatorsEn {
	TranslationsStrategicIndicatorsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Strategic Indicators'
	String get title => 'Strategic Indicators';

	late final TranslationsStrategicIndicatorsFieldsEn fields = TranslationsStrategicIndicatorsFieldsEn._(_root);
	late final TranslationsStrategicIndicatorsParametersEn parameters = TranslationsStrategicIndicatorsParametersEn._(_root);
	late final TranslationsStrategicIndicatorsResultsEn results = TranslationsStrategicIndicatorsResultsEn._(_root);
}

// Path: censusTopics
class TranslationsCensusTopicsEn {
	TranslationsCensusTopicsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Census Topics'
	String get title => 'Census Topics';

	late final TranslationsCensusTopicsFieldsEn fields = TranslationsCensusTopicsFieldsEn._(_root);
	late final TranslationsCensusTopicsParametersEn parameters = TranslationsCensusTopicsParametersEn._(_root);
	late final TranslationsCensusTopicsResultsEn results = TranslationsCensusTopicsResultsEn._(_root);
}

// Path: censusDatasets
class TranslationsCensusDatasetsEn {
	TranslationsCensusDatasetsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Census Datasets'
	String get title => 'Census Datasets';

	late final TranslationsCensusDatasetsFieldsEn fields = TranslationsCensusDatasetsFieldsEn._(_root);
	late final TranslationsCensusDatasetsParametersEn parameters = TranslationsCensusDatasetsParametersEn._(_root);
	late final TranslationsCensusDatasetsResultsEn results = TranslationsCensusDatasetsResultsEn._(_root);
}

// Path: censusData
class TranslationsCensusDataEn {
	TranslationsCensusDataEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Census Data'
	String get title => 'Census Data';

	late final TranslationsCensusDataFieldsEn fields = TranslationsCensusDataFieldsEn._(_root);
	late final TranslationsCensusDataParametersEn parameters = TranslationsCensusDataParametersEn._(_root);
	late final TranslationsCensusDataResultsEn results = TranslationsCensusDataResultsEn._(_root);
}

// Path: censusAreas
class TranslationsCensusAreasEn {
	TranslationsCensusAreasEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Census Areas'
	String get title => 'Census Areas';

	/// en: 'Geographical areas covered by census events'
	String get description => 'Geographical areas covered by census events';

	late final TranslationsCensusAreasFieldsEn fields = TranslationsCensusAreasFieldsEn._(_root);
	late final TranslationsCensusAreasParametersEn parameters = TranslationsCensusAreasParametersEn._(_root);
	late final TranslationsCensusAreasResultsEn results = TranslationsCensusAreasResultsEn._(_root);
}

// Path: subjectCategories
class TranslationsSubjectCategoriesEn {
	TranslationsSubjectCategoriesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Subject Categories'
	String get title => 'Subject Categories';

	late final TranslationsSubjectCategoriesFieldsEn fields = TranslationsSubjectCategoriesFieldsEn._(_root);
	late final TranslationsSubjectCategoriesParametersEn parameters = TranslationsSubjectCategoriesParametersEn._(_root);
	late final TranslationsSubjectCategoriesResultsEn results = TranslationsSubjectCategoriesResultsEn._(_root);
}

// Path: subjects
class TranslationsSubjectsEn {
	TranslationsSubjectsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Subjects'
	String get title => 'Subjects';

	/// en: 'Subjects Page - Coming Soon'
	String get comingSoon => 'Subjects Page - Coming Soon';
}

// Path: units
class TranslationsUnitsEn {
	TranslationsUnitsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Units'
	String get title => 'Units';

	/// en: 'Units of measurement for statistical data'
	String get description => 'Units of measurement for statistical data';

	/// en: 'No units found'
	String get noDataFound => 'No units found';

	/// en: '(one) {Found $n unit} (other) {Found $n units}'
	String found({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		one: 'Found ${n} unit',
		other: 'Found ${n} units',
	);

	late final TranslationsUnitsFieldsEn fields = TranslationsUnitsFieldsEn._(_root);
	late final TranslationsUnitsParametersEn parameters = TranslationsUnitsParametersEn._(_root);
}

// Path: variables
class TranslationsVariablesEn {
	TranslationsVariablesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Variables'
	String get title => 'Variables';

	/// en: 'Statistical variables and measures'
	String get description => 'Statistical variables and measures';

	/// en: 'No variables found'
	String get noDataFound => 'No variables found';

	/// en: '(one) {Found $n variable} (other) {Found $n variables}'
	String found({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		one: 'Found ${n} variable',
		other: 'Found ${n} variables',
	);

	late final TranslationsVariablesFieldsEn fields = TranslationsVariablesFieldsEn._(_root);
	late final TranslationsVariablesParametersEn parameters = TranslationsVariablesParametersEn._(_root);
}

// Path: verticalVariables
class TranslationsVerticalVariablesEn {
	TranslationsVerticalVariablesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Vertical Variables'
	String get title => 'Vertical Variables';

	/// en: 'Categorical dimensions and classification systems'
	String get description => 'Categorical dimensions and classification systems';

	/// en: 'No vertical variables found'
	String get noDataFound => 'No vertical variables found';

	/// en: '(one) {Found $n vertical variable} (other) {Found $n vertical variables}'
	String found({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		one: 'Found ${n} vertical variable',
		other: 'Found ${n} vertical variables',
	);

	late final TranslationsVerticalVariablesFieldsEn fields = TranslationsVerticalVariablesFieldsEn._(_root);
	late final TranslationsVerticalVariablesParametersEn parameters = TranslationsVerticalVariablesParametersEn._(_root);
}

// Path: shared
class TranslationsSharedEn {
	TranslationsSharedEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsSharedPaginationEn pagination = TranslationsSharedPaginationEn._(_root);
	late final TranslationsSharedCodeSnippetEn codeSnippet = TranslationsSharedCodeSnippetEn._(_root);
	late final TranslationsSharedErrorWidgetEn errorWidget = TranslationsSharedErrorWidgetEn._(_root);
	late final TranslationsSharedSearchableDropdownEn searchableDropdown = TranslationsSharedSearchableDropdownEn._(_root);
	late final TranslationsSharedRequestDetailsEn requestDetails = TranslationsSharedRequestDetailsEn._(_root);
}

// Path: validation
class TranslationsValidationEn {
	TranslationsValidationEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Domain is required'
	String get domainRequired => 'Domain is required';
}

// Path: categories
class TranslationsCategoriesEn {
	TranslationsCategoriesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Image not available'
	String get imageNotAvailable => 'Image not available';

	/// en: 'Category ID'
	String get categoryId => 'Category ID';

	/// en: 'Release Date'
	String get releaseDate => 'Release Date';

	/// en: 'Image URL'
	String get imageUrl => 'Image URL';

	/// en: 'Tap to read more'
	String get tapToReadMore => 'Tap to read more';
}

// Path: instructions
class TranslationsInstructionsEn {
	TranslationsInstructionsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Request details will be shown in the results page'
	String get requestDetailsWillShow => 'Request details will be shown in the results page';

	/// en: 'This page only handles parameter configuration. Click "Search Domains" to see request details in the results page.'
	String get onlyHandlesParameters => 'This page only handles parameter configuration. Click "Search Domains" to see request details in the results page.';

	/// en: 'Enter parameters and click load to see data'
	String get enterParametersAndLoad => 'Enter parameters and click load to see data';

	late final TranslationsInstructionsLanguageLabelsEn languageLabels = TranslationsInstructionsLanguageLabelsEn._(_root);
}

// Path: settings
class TranslationsSettingsEn {
	TranslationsSettingsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Settings'
	String get title => 'Settings';

	/// en: 'Language'
	String get language => 'Language';

	/// en: 'Theme'
	String get theme => 'Theme';

	/// en: 'Dark Mode'
	String get darkMode => 'Dark Mode';

	/// en: 'About'
	String get about => 'About';
}

// Path: statisticalClassifications
class TranslationsStatisticalClassificationsEn {
	TranslationsStatisticalClassificationsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Statistical Classifications'
	String get title => 'Statistical Classifications';

	late final TranslationsStatisticalClassificationsFieldsEn fields = TranslationsStatisticalClassificationsFieldsEn._(_root);
	late final TranslationsStatisticalClassificationsLevelsEn levels = TranslationsStatisticalClassificationsLevelsEn._(_root);
	late final TranslationsStatisticalClassificationsKbkiLevelsEn kbkiLevels = TranslationsStatisticalClassificationsKbkiLevelsEn._(_root);
	late final TranslationsStatisticalClassificationsParametersEn parameters = TranslationsStatisticalClassificationsParametersEn._(_root);
	late final TranslationsStatisticalClassificationsResultsEn results = TranslationsStatisticalClassificationsResultsEn._(_root);
	late final TranslationsStatisticalClassificationsDetailEn detail = TranslationsStatisticalClassificationsDetailEn._(_root);
}

// Path: censusEvents
class TranslationsCensusEventsEn {
	TranslationsCensusEventsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Census Events'
	String get title => 'Census Events';

	late final TranslationsCensusEventsFieldsEn fields = TranslationsCensusEventsFieldsEn._(_root);

	/// en: '(one) {Found $n census event} (other) {Found $n census events}'
	String found({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		one: 'Found ${n} census event',
		other: 'Found ${n} census events',
	);

	/// en: 'Initializing...'
	String get initializing => 'Initializing...';
}

// Path: home.features
class TranslationsHomeFeaturesEn {
	TranslationsHomeFeaturesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Features'
	String get title => 'Features';
}

// Path: home.aboutDemo
class TranslationsHomeAboutDemoEn {
	TranslationsHomeAboutDemoEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'About This Demo'
	String get title => 'About This Demo';

	/// en: 'This simplified example demonstrates the domains functionality of the STADATA Flutter SDK. Click on the domains card above to explore statistical domains from BPS Indonesia.'
	String get description => 'This simplified example demonstrates the domains functionality of the STADATA Flutter SDK. Click on the domains card above to explore statistical domains from BPS Indonesia.';
}

// Path: home.sections
class TranslationsHomeSectionsEn {
	TranslationsHomeSectionsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsHomeSectionsListApiEn listApi = TranslationsHomeSectionsListApiEn._(_root);
	late final TranslationsHomeSectionsViewApiEn viewApi = TranslationsHomeSectionsViewApiEn._(_root);
	late final TranslationsHomeSectionsDynamicTablesEn dynamicTables = TranslationsHomeSectionsDynamicTablesEn._(_root);
	late final TranslationsHomeSectionsPeriodsEn periods = TranslationsHomeSectionsPeriodsEn._(_root);
}

// Path: listApi.sections
class TranslationsListApiSectionsEn {
	TranslationsListApiSectionsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsListApiSectionsDomainsEn domains = TranslationsListApiSectionsDomainsEn._(_root);
	late final TranslationsListApiSectionsPublicationsEn publications = TranslationsListApiSectionsPublicationsEn._(_root);
	late final TranslationsListApiSectionsNewsEn news = TranslationsListApiSectionsNewsEn._(_root);
	late final TranslationsListApiSectionsPressReleasesEn pressReleases = TranslationsListApiSectionsPressReleasesEn._(_root);
	late final TranslationsListApiSectionsInfographicsEn infographics = TranslationsListApiSectionsInfographicsEn._(_root);
	late final TranslationsListApiSectionsNewsCategoriesEn newsCategories = TranslationsListApiSectionsNewsCategoriesEn._(_root);
	late final TranslationsListApiSectionsDynamicTablesEn dynamicTables = TranslationsListApiSectionsDynamicTablesEn._(_root);
	late final TranslationsListApiSectionsStaticTablesEn staticTables = TranslationsListApiSectionsStaticTablesEn._(_root);
	late final TranslationsListApiSectionsStatisticalClassificationsEn statisticalClassifications = TranslationsListApiSectionsStatisticalClassificationsEn._(_root);
	late final TranslationsListApiSectionsStrategicIndicatorsEn strategicIndicators = TranslationsListApiSectionsStrategicIndicatorsEn._(_root);
	late final TranslationsListApiSectionsSubjectCategoriesEn subjectCategories = TranslationsListApiSectionsSubjectCategoriesEn._(_root);
	late final TranslationsListApiSectionsSubjectsEn subjects = TranslationsListApiSectionsSubjectsEn._(_root);
	late final TranslationsListApiSectionsVariablesEn variables = TranslationsListApiSectionsVariablesEn._(_root);
	late final TranslationsListApiSectionsVerticalVariablesEn verticalVariables = TranslationsListApiSectionsVerticalVariablesEn._(_root);
	late final TranslationsListApiSectionsUnitsEn units = TranslationsListApiSectionsUnitsEn._(_root);
	late final TranslationsListApiSectionsPeriodsEn periods = TranslationsListApiSectionsPeriodsEn._(_root);
	late final TranslationsListApiSectionsDerivedPeriodsEn derivedPeriods = TranslationsListApiSectionsDerivedPeriodsEn._(_root);
	late final TranslationsListApiSectionsDerivedVariablesEn derivedVariables = TranslationsListApiSectionsDerivedVariablesEn._(_root);
	late final TranslationsListApiSectionsCensusEventsEn censusEvents = TranslationsListApiSectionsCensusEventsEn._(_root);
	late final TranslationsListApiSectionsCensusTopicsEn censusTopics = TranslationsListApiSectionsCensusTopicsEn._(_root);
	late final TranslationsListApiSectionsCensusDatasetsEn censusDatasets = TranslationsListApiSectionsCensusDatasetsEn._(_root);
	late final TranslationsListApiSectionsCensusDataEn censusData = TranslationsListApiSectionsCensusDataEn._(_root);
	late final TranslationsListApiSectionsCensusAreasEn censusAreas = TranslationsListApiSectionsCensusAreasEn._(_root);
}

// Path: viewApi.sections
class TranslationsViewApiSectionsEn {
	TranslationsViewApiSectionsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsViewApiSectionsPublicationEn publication = TranslationsViewApiSectionsPublicationEn._(_root);
	late final TranslationsViewApiSectionsNewsEn news = TranslationsViewApiSectionsNewsEn._(_root);
	late final TranslationsViewApiSectionsPressReleaseEn pressRelease = TranslationsViewApiSectionsPressReleaseEn._(_root);
	late final TranslationsViewApiSectionsStaticTableEn staticTable = TranslationsViewApiSectionsStaticTableEn._(_root);
}

// Path: domains.types
class TranslationsDomainsTypesEn {
	TranslationsDomainsTypesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Province'
	String get province => 'Province';

	/// en: 'Regency'
	String get regency => 'Regency';

	/// en: 'Regency by Province'
	String get regencyByProvince => 'Regency by Province';

	/// en: 'All Domains'
	String get all => 'All Domains';
}

// Path: domains.fields
class TranslationsDomainsFieldsEn {
	TranslationsDomainsFieldsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'ID'
	String get id => 'ID';

	/// en: 'Name'
	String get name => 'Name';

	/// en: 'URL'
	String get url => 'URL';
}

// Path: domains.parameters
class TranslationsDomainsParametersEn {
	TranslationsDomainsParametersEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'API Parameters'
	String get title => 'API Parameters';

	/// en: 'Domain Type'
	String get domainType => 'Domain Type';

	/// en: 'Province Code'
	String get provinceCode => 'Province Code';

	/// en: 'e.g., 32 for West Java'
	String get provinceCodeHint => 'e.g., 32 for West Java';

	/// en: 'Province code is required for Regency by Province type'
	String get provinceCodeRequired => 'Province code is required for Regency by Province type';

	/// en: 'Language'
	String get language => 'Language';

	/// en: 'Educational - not applied to domains endpoint'
	String get languageNote => 'Educational - not applied to domains endpoint';

	/// en: 'Load Domains'
	String get loadButton => 'Load Domains';

	/// en: 'Loading...'
	String get loading => 'Loading...';

	/// en: 'Search Domains'
	String get searchDomains => 'Search Domains';
}

// Path: domains.requestDetails
class TranslationsDomainsRequestDetailsEn {
	TranslationsDomainsRequestDetailsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Request Details'
	String get title => 'Request Details';

	/// en: 'Method'
	String get method => 'Method';

	/// en: 'URL'
	String get url => 'URL';

	/// en: 'Parameters'
	String get parameters => 'Parameters';

	/// en: 'Response Time'
	String get responseTime => 'Response Time';

	/// en: 'Copy URL'
	String get copyUrl => 'Copy URL';

	/// en: 'URL copied to clipboard'
	String get urlCopied => 'URL copied to clipboard';

	/// en: 'No request made yet'
	String get noRequest => 'No request made yet';

	/// en: 'Show Request Details'
	String get showDetails => 'Show Request Details';

	/// en: 'Hide Request Details'
	String get hideDetails => 'Hide Request Details';
}

// Path: domains.results
class TranslationsDomainsResultsEn {
	TranslationsDomainsResultsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Domain Results'
	String get title => 'Domain Results';

	/// en: 'Found {count} domain(s)'
	String get found => 'Found {count} domain(s)';

	/// en: 'No domains found for the selected criteria'
	String get empty => 'No domains found for the selected criteria';

	/// en: 'Select parameters and click "Load Domains" to start'
	String get initial => 'Select parameters and click "Load Domains" to start';

	/// en: 'Search Parameters'
	String get searchParameters => 'Search Parameters';
}

// Path: domains.education
class TranslationsDomainsEducationEn {
	TranslationsDomainsEducationEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'How to Use'
	String get title => 'How to Use';

	/// en: 'Learn how to search and explore domain data from BPS.'
	String get description => 'Learn how to search and explore domain data from BPS.';

	/// en: 'Parameters'
	String get parameters => 'Parameters';

	/// en: 'Configure domain type and region settings'
	String get parametersDescription => 'Configure domain type and region settings';

	/// en: 'Results'
	String get results => 'Results';

	/// en: 'View domains matching your criteria'
	String get resultsDescription => 'View domains matching your criteria';

	/// en: 'Detail'
	String get detail => 'Detail';

	/// en: 'See domain information and access links'
	String get detailDescription => 'See domain information and access links';
}

// Path: infographics.fields
class TranslationsInfographicsFieldsEn {
	TranslationsInfographicsFieldsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'ID'
	String get id => 'ID';

	/// en: 'Title'
	String get title => 'Title';

	/// en: 'Image'
	String get image => 'Image';

	/// en: 'Description'
	String get description => 'Description';

	/// en: 'Category'
	String get category => 'Category';

	/// en: 'Download URL'
	String get downloadUrl => 'Download URL';
}

// Path: infographics.parameters
class TranslationsInfographicsParametersEn {
	TranslationsInfographicsParametersEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'API Parameters'
	String get title => 'API Parameters';

	/// en: 'Domain'
	String get domain => 'Domain';

	/// en: 'e.g., 7200 for national level'
	String get domainHint => 'e.g., 7200 for national level';

	/// en: 'Keyword (Optional)'
	String get keyword => 'Keyword (Optional)';

	/// en: 'Filter by keyword'
	String get keywordHint => 'Filter by keyword';

	/// en: 'Page'
	String get page => 'Page';

	/// en: 'Language'
	String get language => 'Language';

	/// en: 'Applied to infographics content language'
	String get languageNote => 'Applied to infographics content language';

	/// en: 'Load Infographics'
	String get loadButton => 'Load Infographics';

	/// en: 'Loading...'
	String get loading => 'Loading...';

	/// en: 'Search Infographics'
	String get searchInfographics => 'Search Infographics';
}

// Path: infographics.requestDetails
class TranslationsInfographicsRequestDetailsEn {
	TranslationsInfographicsRequestDetailsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Request Details'
	String get title => 'Request Details';

	/// en: 'Method'
	String get method => 'Method';

	/// en: 'URL'
	String get url => 'URL';

	/// en: 'Parameters'
	String get parameters => 'Parameters';

	/// en: 'Response Time'
	String get responseTime => 'Response Time';

	/// en: 'Copy URL'
	String get copyUrl => 'Copy URL';

	/// en: 'URL copied to clipboard'
	String get urlCopied => 'URL copied to clipboard';

	/// en: 'No request made yet'
	String get noRequest => 'No request made yet';

	/// en: 'Show Request Details'
	String get showDetails => 'Show Request Details';

	/// en: 'Hide Request Details'
	String get hideDetails => 'Hide Request Details';
}

// Path: infographics.results
class TranslationsInfographicsResultsEn {
	TranslationsInfographicsResultsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Results'
	String get title => 'Results';

	/// en: 'Found {count} infographic(s)'
	String get found => 'Found {count} infographic(s)';

	/// en: 'No infographics found for the selected criteria'
	String get empty => 'No infographics found for the selected criteria';

	/// en: 'Configure parameters and click "Load Infographics" to start'
	String get initial => 'Configure parameters and click "Load Infographics" to start';

	/// en: 'Search Parameters'
	String get searchParameters => 'Search Parameters';
}

// Path: infographics.education
class TranslationsInfographicsEducationEn {
	TranslationsInfographicsEducationEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Tips'
	String get title => 'Tips';

	/// en: 'Learn how to use the infographics feature effectively.'
	String get description => 'Learn how to use the infographics feature effectively.';

	/// en: 'Parameters'
	String get parameters => 'Parameters';

	/// en: 'Configure your search criteria here'
	String get parametersDescription => 'Configure your search criteria here';

	/// en: 'Results'
	String get results => 'Results';

	/// en: 'View infographics matching your criteria'
	String get resultsDescription => 'View infographics matching your criteria';

	/// en: 'Detail'
	String get detail => 'Detail';

	/// en: 'See full content and download options'
	String get detailDescription => 'See full content and download options';
}

// Path: publications.detail
class TranslationsPublicationsDetailEn {
	TranslationsPublicationsDetailEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Publication Detail'
	String get title => 'Publication Detail';
}

// Path: publications.fields
class TranslationsPublicationsFieldsEn {
	TranslationsPublicationsFieldsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'ID'
	String get id => 'ID';

	/// en: 'Title'
	String get title => 'Title';

	/// en: 'ISSN'
	String get issn => 'ISSN';

	/// en: 'Cover'
	String get cover => 'Cover';

	/// en: 'PDF URL'
	String get pdfUrl => 'PDF URL';

	/// en: 'Size'
	String get size => 'Size';

	/// en: 'Abstract'
	String get abstract => 'Abstract';

	/// en: 'Catalogue Number'
	String get catalogueNumber => 'Catalogue Number';

	/// en: 'Publication Number'
	String get publicationNumber => 'Publication Number';

	/// en: 'Release Date'
	String get releaseDate => 'Release Date';

	/// en: 'Updated At'
	String get updatedAt => 'Updated At';
}

// Path: publications.parameters
class TranslationsPublicationsParametersEn {
	TranslationsPublicationsParametersEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'API Parameters'
	String get title => 'API Parameters';

	/// en: 'Domain'
	String get domain => 'Domain';

	/// en: 'e.g., 7200 for national level'
	String get domainHint => 'e.g., 7200 for national level';

	/// en: 'Keyword (Optional)'
	String get keyword => 'Keyword (Optional)';

	/// en: 'Filter by keyword'
	String get keywordHint => 'Filter by keyword';

	/// en: 'Month (Optional)'
	String get month => 'Month (Optional)';

	/// en: 'Select month'
	String get monthHint => 'Select month';

	/// en: 'Year (Optional)'
	String get year => 'Year (Optional)';

	/// en: 'Select year'
	String get yearHint => 'Select year';

	/// en: 'Language'
	String get language => 'Language';

	/// en: 'Applied to publications content language'
	String get languageNote => 'Applied to publications content language';

	/// en: 'Load Publications'
	String get loadButton => 'Load Publications';

	/// en: 'Loading...'
	String get loading => 'Loading...';

	/// en: 'Search Publications'
	String get searchPublications => 'Search Publications';

	/// en: 'Clear Filters'
	String get clearButton => 'Clear Filters';
}

// Path: publications.requestDetails
class TranslationsPublicationsRequestDetailsEn {
	TranslationsPublicationsRequestDetailsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Request Details'
	String get title => 'Request Details';

	/// en: 'Method'
	String get method => 'Method';

	/// en: 'URL'
	String get url => 'URL';

	/// en: 'Parameters'
	String get parameters => 'Parameters';

	/// en: 'Response Time'
	String get responseTime => 'Response Time';

	/// en: 'Copy URL'
	String get copyUrl => 'Copy URL';

	/// en: 'URL copied to clipboard'
	String get urlCopied => 'URL copied to clipboard';

	/// en: 'No request made yet'
	String get noRequest => 'No request made yet';

	/// en: 'Show Request Details'
	String get showDetails => 'Show Request Details';

	/// en: 'Hide Request Details'
	String get hideDetails => 'Hide Request Details';
}

// Path: publications.results
class TranslationsPublicationsResultsEn {
	TranslationsPublicationsResultsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Publications Results'
	String get title => 'Publications Results';

	/// en: 'Found {count} publication(s)'
	String get found => 'Found {count} publication(s)';

	/// en: 'No publications found for the selected criteria'
	String get empty => 'No publications found for the selected criteria';

	/// en: 'Configure parameters and click "Load Publications" to start'
	String get initial => 'Configure parameters and click "Load Publications" to start';

	/// en: 'Search Parameters'
	String get searchParameters => 'Search Parameters';
}

// Path: publications.education
class TranslationsPublicationsEducationEn {
	TranslationsPublicationsEducationEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'How to Use'
	String get title => 'How to Use';

	/// en: 'Learn how to search and explore publication data from BPS.'
	String get description => 'Learn how to search and explore publication data from BPS.';

	/// en: 'Parameters'
	String get parameters => 'Parameters';

	/// en: 'Configure domain and search criteria'
	String get parametersDescription => 'Configure domain and search criteria';

	/// en: 'Results'
	String get results => 'Results';

	/// en: 'View publications matching your criteria'
	String get resultsDescription => 'View publications matching your criteria';

	/// en: 'Detail'
	String get detail => 'Detail';

	/// en: 'See publication information and download options'
	String get detailDescription => 'See publication information and download options';
}

// Path: news.fields
class TranslationsNewsFieldsEn {
	TranslationsNewsFieldsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'ID'
	String get id => 'ID';

	/// en: 'Title'
	String get title => 'Title';

	/// en: 'Content'
	String get content => 'Content';

	/// en: 'Picture'
	String get picture => 'Picture';

	/// en: 'Release Date'
	String get releaseDate => 'Release Date';

	/// en: 'Category'
	String get category => 'Category';

	/// en: 'Category ID'
	String get categoryID => 'Category ID';
}

// Path: news.parameters
class TranslationsNewsParametersEn {
	TranslationsNewsParametersEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'API Parameters'
	String get title => 'API Parameters';

	/// en: 'Domain'
	String get domain => 'Domain';

	/// en: 'e.g., 7200 for Central Sulawesi'
	String get domainHint => 'e.g., 7200 for Central Sulawesi';

	/// en: 'Keyword (Optional)'
	String get keyword => 'Keyword (Optional)';

	/// en: 'Filter by keyword'
	String get keywordHint => 'Filter by keyword';

	/// en: 'Category ID (Optional)'
	String get category => 'Category ID (Optional)';

	/// en: 'Filter by news category ID'
	String get categoryHint => 'Filter by news category ID';

	/// en: 'Month (Optional)'
	String get month => 'Month (Optional)';

	/// en: 'Select month'
	String get monthHint => 'Select month';

	/// en: 'Year (Optional)'
	String get year => 'Year (Optional)';

	/// en: 'Select year'
	String get yearHint => 'Select year';

	/// en: 'Page'
	String get page => 'Page';

	/// en: 'Language'
	String get language => 'Language';

	/// en: 'Applied to news content language'
	String get languageNote => 'Applied to news content language';

	/// en: 'Load News'
	String get loadButton => 'Load News';

	/// en: 'Search News'
	String get searchNews => 'Search News';

	/// en: 'Clear Filters'
	String get clearButton => 'Clear Filters';

	/// en: 'Loading...'
	String get loading => 'Loading...';
}

// Path: news.requestDetails
class TranslationsNewsRequestDetailsEn {
	TranslationsNewsRequestDetailsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Request Details'
	String get title => 'Request Details';

	/// en: 'Method'
	String get method => 'Method';

	/// en: 'URL'
	String get url => 'URL';

	/// en: 'Parameters'
	String get parameters => 'Parameters';

	/// en: 'Response Time'
	String get responseTime => 'Response Time';

	/// en: 'Copy URL'
	String get copyUrl => 'Copy URL';

	/// en: 'URL copied to clipboard'
	String get urlCopied => 'URL copied to clipboard';

	/// en: 'No request made yet'
	String get noRequest => 'No request made yet';

	/// en: 'Show Request Details'
	String get showDetails => 'Show Request Details';

	/// en: 'Hide Request Details'
	String get hideDetails => 'Hide Request Details';
}

// Path: news.results
class TranslationsNewsResultsEn {
	TranslationsNewsResultsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'News Results'
	String get title => 'News Results';

	/// en: 'Found {count} news article(s)'
	String get found => 'Found {count} news article(s)';

	/// en: 'No news found for the selected criteria'
	String get empty => 'No news found for the selected criteria';

	/// en: 'Configure parameters and click "Load News" to start'
	String get initial => 'Configure parameters and click "Load News" to start';

	/// en: 'Search Parameters'
	String get searchParameters => 'Search Parameters';
}

// Path: news.detail
class TranslationsNewsDetailEn {
	TranslationsNewsDetailEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'News Detail'
	String get title => 'News Detail';

	/// en: 'News Information'
	String get metadata => 'News Information';

	/// en: 'Article Content'
	String get content => 'Article Content';
}

// Path: news.education
class TranslationsNewsEducationEn {
	TranslationsNewsEducationEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'How this works'
	String get title => 'How this works';

	/// en: 'This demonstrates the news API workflow with separate pages for parameters, results, and detailed views.'
	String get description => 'This demonstrates the news API workflow with separate pages for parameters, results, and detailed views.';

	/// en: 'Parameters'
	String get parameters => 'Parameters';

	/// en: 'Configure your search criteria here'
	String get parametersDescription => 'Configure your search criteria here';

	/// en: 'Results'
	String get results => 'Results';

	/// en: 'View news articles matching your criteria'
	String get resultsDescription => 'View news articles matching your criteria';

	/// en: 'Detail'
	String get detail => 'Detail';

	/// en: 'See full content using the view API'
	String get detailDescription => 'See full content using the view API';
}

// Path: newsCategories.fields
class TranslationsNewsCategoriesFieldsEn {
	TranslationsNewsCategoriesFieldsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'ID'
	String get id => 'ID';

	/// en: 'Name'
	String get name => 'Name';
}

// Path: newsCategories.parameters
class TranslationsNewsCategoriesParametersEn {
	TranslationsNewsCategoriesParametersEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'API Parameters'
	String get title => 'API Parameters';

	/// en: 'Domain'
	String get domain => 'Domain';

	/// en: 'e.g., 7200 for national level'
	String get domainHint => 'e.g., 7200 for national level';

	/// en: '4+ character domain code (required)'
	String get domainDescription => '4+ character domain code (required)';

	/// en: 'Language'
	String get language => 'Language';

	/// en: 'Indonesian'
	String get languageIndonesian => 'Indonesian';

	/// en: 'English'
	String get languageEnglish => 'English';

	/// en: 'Content language for news categories'
	String get languageDescription => 'Content language for news categories';

	/// en: 'Search News Categories'
	String get searchNewsCategories => 'Search News Categories';
}

// Path: newsCategories.requestDetails
class TranslationsNewsCategoriesRequestDetailsEn {
	TranslationsNewsCategoriesRequestDetailsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Request Details'
	String get title => 'Request Details';

	/// en: 'Endpoint'
	String get endpoint => 'Endpoint';

	/// en: 'Method'
	String get method => 'Method';

	/// en: 'Parameters'
	String get parameters => 'Parameters';

	/// en: 'cURL Example'
	String get curlExample => 'cURL Example';

	/// en: 'Show Request Details'
	String get showDetails => 'Show Request Details';

	/// en: 'Hide Request Details'
	String get hideDetails => 'Hide Request Details';

	/// en: 'No request made yet'
	String get noRequestYet => 'No request made yet';
}

// Path: newsCategories.results
class TranslationsNewsCategoriesResultsEn {
	TranslationsNewsCategoriesResultsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'News Categories Results'
	String get title => 'News Categories Results';

	/// en: 'Search Parameters'
	String get searchParameters => 'Search Parameters';

	/// en: 'categories found'
	String get categoriesFound => 'categories found';

	/// en: 'No Categories Found'
	String get noDataFound => 'No Categories Found';

	/// en: 'Try adjusting your search parameters or check if the domain exists.'
	String get noDataDescription => 'Try adjusting your search parameters or check if the domain exists.';
}

// Path: newsCategories.categoryDetail
class TranslationsNewsCategoriesCategoryDetailEn {
	TranslationsNewsCategoriesCategoryDetailEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Category Details'
	String get title => 'Category Details';

	/// en: 'Category ID'
	String get id => 'Category ID';

	/// en: 'Category Name'
	String get name => 'Category Name';
}

// Path: newsCategories.education
class TranslationsNewsCategoriesEducationEn {
	TranslationsNewsCategoriesEducationEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'How this works'
	String get title => 'How this works';

	/// en: 'Browse news categories available for different domains and languages from BPS statistical data.'
	String get description => 'Browse news categories available for different domains and languages from BPS statistical data.';

	/// en: 'Parameters'
	String get parameters => 'Parameters';

	/// en: 'Configure domain and language settings'
	String get parametersDescription => 'Configure domain and language settings';

	/// en: 'Results'
	String get results => 'Results';

	/// en: 'View news categories available for the domain'
	String get resultsDescription => 'View news categories available for the domain';

	/// en: 'Categories'
	String get categories => 'Categories';

	/// en: 'Browse different news category classifications'
	String get categoriesDescription => 'Browse different news category classifications';
}

// Path: dynamicTables.parameters
class TranslationsDynamicTablesParametersEn {
	TranslationsDynamicTablesParametersEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'API Parameters'
	String get title => 'API Parameters';

	/// en: 'Domain'
	String get domain => 'Domain';

	/// en: 'e.g., 7200 for national level'
	String get domainHint => 'e.g., 7200 for national level';

	/// en: 'Variable'
	String get variable => 'Variable';

	/// en: 'Select a statistical variable'
	String get variableHint => 'Select a statistical variable';

	/// en: 'Select Year'
	String get selectYear => 'Select Year';

	/// en: 'Language'
	String get language => 'Language';

	/// en: 'Applied to dynamic table content language'
	String get languageNote => 'Applied to dynamic table content language';

	/// en: 'Load Available Periods'
	String get loadPeriods => 'Load Available Periods';

	/// en: 'Generate Dynamic Table'
	String get generateTable => 'Generate Dynamic Table';

	/// en: 'Loading...'
	String get loading => 'Loading...';
}

// Path: dynamicTables.requestDetails
class TranslationsDynamicTablesRequestDetailsEn {
	TranslationsDynamicTablesRequestDetailsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Request Details'
	String get title => 'Request Details';

	/// en: 'Show Request Details'
	String get showDetails => 'Show Request Details';

	/// en: 'Hide Request Details'
	String get hideDetails => 'Hide Request Details';

	/// en: 'No request made yet'
	String get noRequest => 'No request made yet';
}

// Path: dynamicTables.results
class TranslationsDynamicTablesResultsEn {
	TranslationsDynamicTablesResultsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Dynamic Table Results'
	String get title => 'Dynamic Table Results';

	/// en: 'Available Periods'
	String get periodsAvailable => 'Available Periods';

	/// en: 'Select a period from above to generate table'
	String get selectPeriod => 'Select a period from above to generate table';

	/// en: 'Table generated successfully'
	String get tableGenerated => 'Table generated successfully';

	/// en: 'No data available for selected criteria'
	String get empty => 'No data available for selected criteria';

	/// en: 'Enter parameters above and click "Load Available Years" to get started'
	String get initial => 'Enter parameters above and click "Load Available Years" to get started';

	/// en: 'Select a year from the dropdown above, then click "Load Dynamic Table" to view the data.'
	String get periodInitial => 'Select a year from the dropdown above, then click "Load Dynamic Table" to view the data.';

	/// en: 'Period ID'
	String get periodId => 'Period ID';
}

// Path: dynamicTables.workflow
class TranslationsDynamicTablesWorkflowEn {
	TranslationsDynamicTablesWorkflowEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Dynamic Table Workflow'
	String get title => 'Dynamic Table Workflow';

	/// en: 'Follow these steps to generate a dynamic table from BPS data.'
	String get description => 'Follow these steps to generate a dynamic table from BPS data.';

	/// en: 'Step 1'
	String get step1 => 'Step 1';

	/// en: 'Select domain and language, then choose a variable'
	String get step1Description => 'Select domain and language, then choose a variable';

	/// en: 'Step 2'
	String get step2 => 'Step 2';

	/// en: 'Load available periods for the selected variable'
	String get step2Description => 'Load available periods for the selected variable';

	/// en: 'Step 3'
	String get step3 => 'Step 3';

	/// en: 'Select a year/period and generate the table'
	String get step3Description => 'Select a year/period and generate the table';
}

// Path: dynamicTables.states
class TranslationsDynamicTablesStatesEn {
	TranslationsDynamicTablesStatesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Initializing...'
	String get initializing => 'Initializing...';

	/// en: 'Unknown state'
	String get unknown => 'Unknown state';
}

// Path: pressReleases.detail
class TranslationsPressReleasesDetailEn {
	TranslationsPressReleasesDetailEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Press Release Detail'
	String get title => 'Press Release Detail';

	/// en: 'Press Release Detail for ID: {id}'
	String get forId => 'Press Release Detail for ID: {id}';
}

// Path: pressReleases.fields
class TranslationsPressReleasesFieldsEn {
	TranslationsPressReleasesFieldsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'ID'
	String get id => 'ID';

	/// en: 'Title'
	String get title => 'Title';

	/// en: 'Cover'
	String get cover => 'Cover';

	/// en: 'PDF URL'
	String get pdfUrl => 'PDF URL';

	/// en: 'Size'
	String get size => 'Size';

	/// en: 'Abstract'
	String get abstract => 'Abstract';

	/// en: 'Release Date'
	String get releaseDate => 'Release Date';
}

// Path: pressReleases.parameters
class TranslationsPressReleasesParametersEn {
	TranslationsPressReleasesParametersEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'API Parameters'
	String get title => 'API Parameters';

	/// en: 'Domain'
	String get domain => 'Domain';

	/// en: 'e.g., 7200 for national level'
	String get domainHint => 'e.g., 7200 for national level';

	/// en: 'Keyword (Optional)'
	String get keyword => 'Keyword (Optional)';

	/// en: 'Filter by keyword'
	String get keywordHint => 'Filter by keyword';

	/// en: 'Month (Optional)'
	String get month => 'Month (Optional)';

	/// en: 'Select month'
	String get monthHint => 'Select month';

	/// en: 'Year (Optional)'
	String get year => 'Year (Optional)';

	/// en: 'Select year'
	String get yearHint => 'Select year';

	/// en: 'Language'
	String get language => 'Language';

	/// en: 'Applied to press releases content language'
	String get languageNote => 'Applied to press releases content language';

	/// en: 'Clear Filters'
	String get clearFilters => 'Clear Filters';

	/// en: 'Search'
	String get search => 'Search';

	/// en: 'Load Press Releases'
	String get load => 'Load Press Releases';
}

// Path: pressReleases.results
class TranslationsPressReleasesResultsEn {
	TranslationsPressReleasesResultsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Press Releases Results'
	String get title => 'Press Releases Results';

	/// en: '{count} press releases found'
	String get count => '{count} press releases found';

	/// en: 'No press releases found'
	String get noData => 'No press releases found';

	/// en: 'Search Parameters'
	String get searchParameters => 'Search Parameters';

	/// en: 'Loading press releases...'
	String get loading => 'Loading press releases...';

	/// en: 'Press search button to load data'
	String get pressSearchToLoad => 'Press search button to load data';
}

// Path: pressReleases.actions
class TranslationsPressReleasesActionsEn {
	TranslationsPressReleasesActionsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Download PDF'
	String get downloadPdf => 'Download PDF';

	/// en: 'View Details'
	String get viewDetails => 'View Details';
}

// Path: staticTables.fields
class TranslationsStaticTablesFieldsEn {
	TranslationsStaticTablesFieldsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'ID'
	String get id => 'ID';

	/// en: 'Title'
	String get title => 'Title';

	/// en: 'Subject'
	String get subject => 'Subject';

	/// en: 'Size'
	String get size => 'Size';

	/// en: 'Updated At'
	String get updatedAt => 'Updated At';

	/// en: 'Created At'
	String get createdAt => 'Created At';
}

// Path: staticTables.parameters
class TranslationsStaticTablesParametersEn {
	TranslationsStaticTablesParametersEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Parameters'
	String get title => 'Parameters';

	/// en: 'Domain *'
	String get domain => 'Domain *';

	/// en: 'e.g., 7200'
	String get domainHint => 'e.g., 7200';

	/// en: 'Language'
	String get language => 'Language';

	/// en: 'Keyword (Optional)'
	String get keyword => 'Keyword (Optional)';

	/// en: 'Filter by keyword'
	String get keywordHint => 'Filter by keyword';

	/// en: 'Month (Optional)'
	String get month => 'Month (Optional)';

	/// en: 'Select month'
	String get monthHint => 'Select month';

	/// en: 'Year (Optional)'
	String get year => 'Year (Optional)';

	/// en: 'Select year'
	String get yearHint => 'Select year';

	/// en: 'Clear Filters'
	String get clearFilters => 'Clear Filters';

	/// en: 'Load Static Tables'
	String get loadButton => 'Load Static Tables';
}

// Path: staticTables.actions
class TranslationsStaticTablesActionsEn {
	TranslationsStaticTablesActionsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'View Table'
	String get viewTable => 'View Table';

	/// en: 'Download Excel'
	String get downloadExcel => 'Download Excel';
}

// Path: staticTables.detail
class TranslationsStaticTablesDetailEn {
	TranslationsStaticTablesDetailEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Static Table Detail'
	String get title => 'Static Table Detail';

	/// en: 'Loading table...'
	String get loading => 'Loading table...';

	/// en: 'No table data available'
	String get noTableData => 'No table data available';

	/// en: 'Refresh'
	String get refresh => 'Refresh';

	/// en: 'Download Excel'
	String get downloadExcel => 'Download Excel';
}

// Path: strategicIndicators.fields
class TranslationsStrategicIndicatorsFieldsEn {
	TranslationsStrategicIndicatorsFieldsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'ID'
	String get id => 'ID';

	/// en: 'Title'
	String get title => 'Title';

	/// en: 'Name'
	String get name => 'Name';

	/// en: 'Data Source'
	String get dataSource => 'Data Source';

	/// en: 'Value'
	String get value => 'Value';

	/// en: 'Unit'
	String get unit => 'Unit';

	/// en: 'Period'
	String get period => 'Period';

	/// en: 'Category ID'
	String get categoryID => 'Category ID';

	/// en: 'Variable ID'
	String get variableID => 'Variable ID';
}

// Path: strategicIndicators.parameters
class TranslationsStrategicIndicatorsParametersEn {
	TranslationsStrategicIndicatorsParametersEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Parameters'
	String get title => 'Parameters';

	/// en: 'Domain *'
	String get domain => 'Domain *';

	/// en: 'e.g., 7200'
	String get domainHint => 'e.g., 7200';

	/// en: 'Variable ID (Optional)'
	String get variableID => 'Variable ID (Optional)';

	/// en: 'Filter by variable ID'
	String get variableIDHint => 'Filter by variable ID';

	/// en: 'Language'
	String get language => 'Language';

	/// en: 'Load Strategic Indicators'
	String get loadButton => 'Load Strategic Indicators';
}

// Path: strategicIndicators.results
class TranslationsStrategicIndicatorsResultsEn {
	TranslationsStrategicIndicatorsResultsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Strategic Indicators Results'
	String get title => 'Strategic Indicators Results';

	/// en: 'Search Parameters'
	String get searchParameters => 'Search Parameters';

	/// en: 'Found {count} strategic indicator{plural}'
	String get found => 'Found {count} strategic indicator{plural}';

	/// en: ''
	String get foundSingular => '';

	/// en: 's'
	String get foundPlural => 's';

	/// en: 'Initializing...'
	String get initializing => 'Initializing...';
}

// Path: censusTopics.fields
class TranslationsCensusTopicsFieldsEn {
	TranslationsCensusTopicsFieldsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'ID'
	String get id => 'ID';

	/// en: 'Topic'
	String get topic => 'Topic';

	/// en: 'Event ID'
	String get eventID => 'Event ID';

	/// en: 'Event Name'
	String get eventName => 'Event Name';
}

// Path: censusTopics.parameters
class TranslationsCensusTopicsParametersEn {
	TranslationsCensusTopicsParametersEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Parameters'
	String get title => 'Parameters';

	/// en: 'Census Event *'
	String get censusEvent => 'Census Event *';

	/// en: 'Select census event'
	String get censusEventHint => 'Select census event';

	/// en: 'Load Topics'
	String get loadButton => 'Load Topics';
}

// Path: censusTopics.results
class TranslationsCensusTopicsResultsEn {
	TranslationsCensusTopicsResultsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Census Topics Results'
	String get title => 'Census Topics Results';

	/// en: 'Search Parameters'
	String get searchParameters => 'Search Parameters';

	/// en: '(one) {Found $n topic} (other) {Found $n topics}'
	String found({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		one: 'Found ${n} topic',
		other: 'Found ${n} topics',
	);

	/// en: 'Initializing...'
	String get initializing => 'Initializing...';
}

// Path: censusDatasets.fields
class TranslationsCensusDatasetsFieldsEn {
	TranslationsCensusDatasetsFieldsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Dataset ID'
	String get id => 'Dataset ID';

	/// en: 'Topic ID'
	String get topicID => 'Topic ID';

	/// en: 'Topic'
	String get topic => 'Topic';

	/// en: 'Event ID'
	String get eventID => 'Event ID';

	/// en: 'Dataset Name'
	String get name => 'Dataset Name';

	/// en: 'Description'
	String get description => 'Description';
}

// Path: censusDatasets.parameters
class TranslationsCensusDatasetsParametersEn {
	TranslationsCensusDatasetsParametersEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Parameters'
	String get title => 'Parameters';

	/// en: 'Census Event *'
	String get censusEvent => 'Census Event *';

	/// en: 'Select census event'
	String get censusEventHint => 'Select census event';

	/// en: 'Census Topic *'
	String get censusTopic => 'Census Topic *';

	/// en: 'Select census topic'
	String get censusTopicHint => 'Select census topic';

	/// en: 'Load Datasets'
	String get loadButton => 'Load Datasets';
}

// Path: censusDatasets.results
class TranslationsCensusDatasetsResultsEn {
	TranslationsCensusDatasetsResultsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Census Datasets Results'
	String get title => 'Census Datasets Results';

	/// en: 'Search Parameters'
	String get searchParameters => 'Search Parameters';

	/// en: '(one) {Found $n dataset} (other) {Found $n datasets}'
	String found({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		one: 'Found ${n} dataset',
		other: 'Found ${n} datasets',
	);

	/// en: 'Initializing...'
	String get initializing => 'Initializing...';
}

// Path: censusData.fields
class TranslationsCensusDataFieldsEn {
	TranslationsCensusDataFieldsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Region ID'
	String get regionID => 'Region ID';

	/// en: 'Region Code'
	String get regionCode => 'Region Code';

	/// en: 'Region Name'
	String get regionName => 'Region Name';

	/// en: 'Region Level'
	String get regionLevel => 'Region Level';

	/// en: 'Indicator ID'
	String get indicatorID => 'Indicator ID';

	/// en: 'Indicator Name'
	String get indicatorName => 'Indicator Name';

	/// en: 'Categories'
	String get categories => 'Categories';

	/// en: 'Period'
	String get period => 'Period';

	/// en: 'Value'
	String get value => 'Value';
}

// Path: censusData.parameters
class TranslationsCensusDataParametersEn {
	TranslationsCensusDataParametersEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Parameters'
	String get title => 'Parameters';

	/// en: 'Census Event *'
	String get censusEvent => 'Census Event *';

	/// en: 'Select census event'
	String get censusEventHint => 'Select census event';

	/// en: 'Census Topic *'
	String get censusTopic => 'Census Topic *';

	/// en: 'Select census topic'
	String get censusTopicHint => 'Select census topic';

	/// en: 'Census Area'
	String get censusArea => 'Census Area';

	/// en: 'Select census area (optional)'
	String get censusAreaHint => 'Select census area (optional)';

	/// en: 'Dataset *'
	String get dataset => 'Dataset *';

	/// en: 'Select dataset'
	String get datasetHint => 'Select dataset';

	/// en: 'Load Census Data'
	String get loadButton => 'Load Census Data';
}

// Path: censusData.results
class TranslationsCensusDataResultsEn {
	TranslationsCensusDataResultsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Census Data Results'
	String get title => 'Census Data Results';

	/// en: 'Search Parameters'
	String get searchParameters => 'Search Parameters';

	/// en: '(one) {Found $n data entry} (other) {Found $n data entries}'
	String found({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		one: 'Found ${n} data entry',
		other: 'Found ${n} data entries',
	);

	/// en: 'Initializing...'
	String get initializing => 'Initializing...';
}

// Path: censusAreas.fields
class TranslationsCensusAreasFieldsEn {
	TranslationsCensusAreasFieldsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Area ID'
	String get id => 'Area ID';

	/// en: 'Area Name'
	String get name => 'Area Name';

	/// en: 'Slug'
	String get slug => 'Slug';

	/// en: 'MFD Code'
	String get mfdCode => 'MFD Code';
}

// Path: censusAreas.parameters
class TranslationsCensusAreasParametersEn {
	TranslationsCensusAreasParametersEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Parameters'
	String get title => 'Parameters';

	/// en: 'Census Event *'
	String get censusEvent => 'Census Event *';

	/// en: 'Select census event'
	String get censusEventHint => 'Select census event';

	/// en: 'Load Census Areas'
	String get loadButton => 'Load Census Areas';
}

// Path: censusAreas.results
class TranslationsCensusAreasResultsEn {
	TranslationsCensusAreasResultsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Census Areas Results'
	String get title => 'Census Areas Results';

	/// en: 'Search Parameters'
	String get searchParameters => 'Search Parameters';

	/// en: '(one) {Found $n area} (other) {Found $n areas}'
	String found({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		one: 'Found ${n} area',
		other: 'Found ${n} areas',
	);

	/// en: 'Initializing...'
	String get initializing => 'Initializing...';
}

// Path: subjectCategories.fields
class TranslationsSubjectCategoriesFieldsEn {
	TranslationsSubjectCategoriesFieldsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'ID'
	String get id => 'ID';

	/// en: 'Name'
	String get name => 'Name';
}

// Path: subjectCategories.parameters
class TranslationsSubjectCategoriesParametersEn {
	TranslationsSubjectCategoriesParametersEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Parameters'
	String get title => 'Parameters';

	/// en: 'Domain *'
	String get domain => 'Domain *';

	/// en: 'e.g., 7200'
	String get domainHint => 'e.g., 7200';

	/// en: 'Language'
	String get language => 'Language';

	/// en: 'Load Subject Categories'
	String get loadButton => 'Load Subject Categories';
}

// Path: subjectCategories.results
class TranslationsSubjectCategoriesResultsEn {
	TranslationsSubjectCategoriesResultsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Subject Categories Results'
	String get title => 'Subject Categories Results';

	/// en: 'Search Parameters'
	String get searchParameters => 'Search Parameters';

	/// en: 'Found {count} subject categor{plural}'
	String get found => 'Found {count} subject categor{plural}';

	/// en: 'y'
	String get foundSingular => 'y';

	/// en: 'ies'
	String get foundPlural => 'ies';

	/// en: 'Initializing...'
	String get initializing => 'Initializing...';
}

// Path: units.fields
class TranslationsUnitsFieldsEn {
	TranslationsUnitsFieldsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'ID'
	String get id => 'ID';

	/// en: 'Title'
	String get title => 'Title';
}

// Path: units.parameters
class TranslationsUnitsParametersEn {
	TranslationsUnitsParametersEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Parameters'
	String get title => 'Parameters';

	/// en: 'Domain *'
	String get domain => 'Domain *';

	/// en: 'e.g., 7200'
	String get domainHint => 'e.g., 7200';

	/// en: 'Language'
	String get language => 'Language';

	/// en: 'Variable (Optional)'
	String get variableID => 'Variable (Optional)';

	/// en: 'Select variable (optional)'
	String get variableIDHint => 'Select variable (optional)';

	/// en: 'Load Units'
	String get loadButton => 'Load Units';
}

// Path: variables.fields
class TranslationsVariablesFieldsEn {
	TranslationsVariablesFieldsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'ID'
	String get id => 'ID';

	/// en: 'Title'
	String get title => 'Title';

	/// en: 'Graph Name'
	String get graphName => 'Graph Name';

	/// en: 'Unit'
	String get unit => 'Unit';

	/// en: 'Subject ID'
	String get subjectID => 'Subject ID';

	/// en: 'Subject Name'
	String get subjectName => 'Subject Name';

	/// en: 'Notes'
	String get notes => 'Notes';

	/// en: 'Vertical Variable ID'
	String get verticalVariableID => 'Vertical Variable ID';
}

// Path: variables.parameters
class TranslationsVariablesParametersEn {
	TranslationsVariablesParametersEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Parameters'
	String get title => 'Parameters';

	/// en: 'Domain *'
	String get domain => 'Domain *';

	/// en: 'e.g., 7200'
	String get domainHint => 'e.g., 7200';

	/// en: 'Language'
	String get language => 'Language';

	/// en: 'Year'
	String get year => 'Year';

	/// en: 'e.g., 2024 (optional)'
	String get yearHint => 'e.g., 2024 (optional)';

	/// en: 'Subject'
	String get subject => 'Subject';

	/// en: 'Select subject (optional)'
	String get subjectHint => 'Select subject (optional)';

	/// en: 'All Subjects'
	String get allSubjects => 'All Subjects';

	/// en: 'Show Existing Variables'
	String get showExistingVariables => 'Show Existing Variables';

	/// en: 'Load Variables'
	String get loadButton => 'Load Variables';
}

// Path: verticalVariables.fields
class TranslationsVerticalVariablesFieldsEn {
	TranslationsVerticalVariablesFieldsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'ID'
	String get id => 'ID';

	/// en: 'Title'
	String get title => 'Title';

	/// en: 'Item ID'
	String get itemID => 'Item ID';

	/// en: 'Group ID'
	String get groupID => 'Group ID';

	/// en: 'Group Name'
	String get groupName => 'Group Name';
}

// Path: verticalVariables.parameters
class TranslationsVerticalVariablesParametersEn {
	TranslationsVerticalVariablesParametersEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Parameters'
	String get title => 'Parameters';

	/// en: 'Domain *'
	String get domain => 'Domain *';

	/// en: 'e.g., 7200'
	String get domainHint => 'e.g., 7200';

	/// en: 'Language'
	String get language => 'Language';

	/// en: 'Variable ID'
	String get variableID => 'Variable ID';

	/// en: 'e.g., 1234 (optional)'
	String get variableIDHint => 'e.g., 1234 (optional)';

	/// en: 'Load Vertical Variables'
	String get loadButton => 'Load Vertical Variables';
}

// Path: shared.pagination
class TranslationsSharedPaginationEn {
	TranslationsSharedPaginationEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Previous'
	String get previous => 'Previous';

	/// en: 'Next'
	String get next => 'Next';

	/// en: 'Load More'
	String get loadMore => 'Load More';

	/// en: 'Page'
	String get page => 'Page';

	/// en: 'Previous page'
	String get previousPage => 'Previous page';

	/// en: 'Next page'
	String get nextPage => 'Next page';

	/// en: 'Previous page'
	String get previousPageTooltip => 'Previous page';

	/// en: 'Next page'
	String get nextPageTooltip => 'Next page';
}

// Path: shared.codeSnippet
class TranslationsSharedCodeSnippetEn {
	TranslationsSharedCodeSnippetEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Copy to clipboard'
	String get copyToClipboard => 'Copy to clipboard';

	/// en: 'Code copied to clipboard'
	String get codeCopied => 'Code copied to clipboard';
}

// Path: shared.errorWidget
class TranslationsSharedErrorWidgetEn {
	TranslationsSharedErrorWidgetEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Try Again'
	String get tryAgain => 'Try Again';
}

// Path: shared.searchableDropdown
class TranslationsSharedSearchableDropdownEn {
	TranslationsSharedSearchableDropdownEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'No items found'
	String get noItemsFound => 'No items found';

	/// en: 'Select an item'
	String get selectItem => 'Select an item';
}

// Path: shared.requestDetails
class TranslationsSharedRequestDetailsEn {
	TranslationsSharedRequestDetailsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Request Details'
	String get title => 'Request Details';

	/// en: 'Method'
	String get method => 'Method';

	/// en: 'URL'
	String get url => 'URL';

	/// en: 'Parameters'
	String get parameters => 'Parameters';

	/// en: 'URL copied to clipboard'
	String get urlCopied => 'URL copied to clipboard';

	/// en: 'Parameters copied to clipboard'
	String get parametersCopied => 'Parameters copied to clipboard';
}

// Path: instructions.languageLabels
class TranslationsInstructionsLanguageLabelsEn {
	TranslationsInstructionsLanguageLabelsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Indonesian'
	String get indonesian => 'Indonesian';

	/// en: 'English'
	String get english => 'English';
}

// Path: statisticalClassifications.fields
class TranslationsStatisticalClassificationsFieldsEn {
	TranslationsStatisticalClassificationsFieldsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'ID'
	String get id => 'ID';

	/// en: 'Title'
	String get title => 'Title';

	/// en: 'Type'
	String get type => 'Type';

	/// en: 'Level'
	String get level => 'Level';

	/// en: 'Source'
	String get source => 'Source';

	/// en: 'Description'
	String get description => 'Description';

	/// en: 'Release Date'
	String get releaseDate => 'Release Date';
}

// Path: statisticalClassifications.levels
class TranslationsStatisticalClassificationsLevelsEn {
	TranslationsStatisticalClassificationsLevelsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Category'
	String get category => 'Category';

	/// en: 'Primary Group'
	String get primaryGroup => 'Primary Group';

	/// en: 'Group'
	String get group => 'Group';

	/// en: 'Sub-Group'
	String get subGroup => 'Sub-Group';

	/// en: 'Cluster'
	String get cluster => 'Cluster';
}

// Path: statisticalClassifications.kbkiLevels
class TranslationsStatisticalClassificationsKbkiLevelsEn {
	TranslationsStatisticalClassificationsKbkiLevelsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Section'
	String get section => 'Section';

	/// en: 'Division'
	String get division => 'Division';

	/// en: 'Group'
	String get group => 'Group';

	/// en: 'Classes'
	String get classes => 'Classes';

	/// en: 'Sub-Class'
	String get subClass => 'Sub-Class';

	/// en: 'Commodity Group'
	String get commodityGroup => 'Commodity Group';

	/// en: 'Commodity'
	String get commodity => 'Commodity';
}

// Path: statisticalClassifications.parameters
class TranslationsStatisticalClassificationsParametersEn {
	TranslationsStatisticalClassificationsParametersEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Parameters'
	String get title => 'Parameters';

	/// en: 'Classification Category *'
	String get category => 'Classification Category *';

	/// en: 'Select KBLI or KBKI'
	String get categoryHint => 'Select KBLI or KBKI';

	/// en: 'Classification Type *'
	String get type => 'Classification Type *';

	/// en: 'Select classification year'
	String get typeHint => 'Select classification year';

	/// en: 'Classification Level (Optional)'
	String get level => 'Classification Level (Optional)';

	/// en: 'Select level'
	String get levelHint => 'Select level';

	/// en: 'All Levels'
	String get allLevels => 'All Levels';

	/// en: 'Language'
	String get language => 'Language';

	/// en: 'Load Classifications'
	String get loadButton => 'Load Classifications';
}

// Path: statisticalClassifications.results
class TranslationsStatisticalClassificationsResultsEn {
	TranslationsStatisticalClassificationsResultsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Statistical Classifications Results'
	String get title => 'Statistical Classifications Results';

	/// en: 'Search Parameters'
	String get searchParameters => 'Search Parameters';

	/// en: 'Found {count} classification{plural}'
	String get found => 'Found {count} classification{plural}';

	/// en: ''
	String get foundSingular => '';

	/// en: 's'
	String get foundPlural => 's';

	/// en: 'Initializing...'
	String get initializing => 'Initializing...';
}

// Path: statisticalClassifications.detail
class TranslationsStatisticalClassificationsDetailEn {
	TranslationsStatisticalClassificationsDetailEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Classification Detail'
	String get title => 'Classification Detail';

	/// en: 'No sub-classifications available'
	String get noChildren => 'No sub-classifications available';

	/// en: 'Metadata'
	String get metadata => 'Metadata';

	/// en: 'Source'
	String get source => 'Source';

	/// en: 'Release Date'
	String get releaseDate => 'Release Date';

	/// en: 'Last Update'
	String get lastUpdate => 'Last Update';

	/// en: 'Level'
	String get level => 'Level';

	/// en: 'View Online'
	String get viewOnline => 'View Online';

	/// en: 'Tags'
	String get tags => 'Tags';

	/// en: 'Derived Classifications'
	String get derivedClassifications => 'Derived Classifications';
}

// Path: censusEvents.fields
class TranslationsCensusEventsFieldsEn {
	TranslationsCensusEventsFieldsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'ID'
	String get id => 'ID';

	/// en: 'Name'
	String get name => 'Name';

	/// en: 'Year'
	String get year => 'Year';
}

// Path: home.sections.listApi
class TranslationsHomeSectionsListApiEn {
	TranslationsHomeSectionsListApiEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'List API'
	String get title => 'List API';

	/// en: 'Browse collections of domains, publications, news, and more'
	String get description => 'Browse collections of domains, publications, news, and more';
}

// Path: home.sections.viewApi
class TranslationsHomeSectionsViewApiEn {
	TranslationsHomeSectionsViewApiEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'View API'
	String get title => 'View API';

	/// en: 'Get detailed information about specific publications, news, and press releases'
	String get description => 'Get detailed information about specific publications, news, and press releases';
}

// Path: home.sections.dynamicTables
class TranslationsHomeSectionsDynamicTablesEn {
	TranslationsHomeSectionsDynamicTablesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Dynamic Tables'
	String get title => 'Dynamic Tables';

	/// en: 'Explore dynamic statistical tables with customizable parameters'
	String get description => 'Explore dynamic statistical tables with customizable parameters';
}

// Path: home.sections.periods
class TranslationsHomeSectionsPeriodsEn {
	TranslationsHomeSectionsPeriodsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Periods'
	String get title => 'Periods';

	/// en: 'Browse available time periods for statistical data'
	String get description => 'Browse available time periods for statistical data';
}

// Path: listApi.sections.domains
class TranslationsListApiSectionsDomainsEn {
	TranslationsListApiSectionsDomainsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Domains'
	String get title => 'Domains';

	/// en: 'Statistical domains and regions'
	String get description => 'Statistical domains and regions';
}

// Path: listApi.sections.publications
class TranslationsListApiSectionsPublicationsEn {
	TranslationsListApiSectionsPublicationsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Publications'
	String get title => 'Publications';

	/// en: 'Statistical publications and reports'
	String get description => 'Statistical publications and reports';
}

// Path: listApi.sections.news
class TranslationsListApiSectionsNewsEn {
	TranslationsListApiSectionsNewsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'News'
	String get title => 'News';

	/// en: 'Latest statistical news and updates'
	String get description => 'Latest statistical news and updates';
}

// Path: listApi.sections.pressReleases
class TranslationsListApiSectionsPressReleasesEn {
	TranslationsListApiSectionsPressReleasesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Press Releases'
	String get title => 'Press Releases';

	/// en: 'Official press releases from BPS'
	String get description => 'Official press releases from BPS';
}

// Path: listApi.sections.infographics
class TranslationsListApiSectionsInfographicsEn {
	TranslationsListApiSectionsInfographicsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Infographics'
	String get title => 'Infographics';

	/// en: 'Visual statistical information'
	String get description => 'Visual statistical information';
}

// Path: listApi.sections.newsCategories
class TranslationsListApiSectionsNewsCategoriesEn {
	TranslationsListApiSectionsNewsCategoriesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'News Categories'
	String get title => 'News Categories';

	/// en: 'Browse news category classifications from BPS'
	String get description => 'Browse news category classifications from BPS';
}

// Path: listApi.sections.dynamicTables
class TranslationsListApiSectionsDynamicTablesEn {
	TranslationsListApiSectionsDynamicTablesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Dynamic Tables'
	String get title => 'Dynamic Tables';

	/// en: 'Explore multi-dimensional statistical data with periods integration'
	String get description => 'Explore multi-dimensional statistical data with periods integration';
}

// Path: listApi.sections.staticTables
class TranslationsListApiSectionsStaticTablesEn {
	TranslationsListApiSectionsStaticTablesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Static Tables'
	String get title => 'Static Tables';

	/// en: 'Pre-defined statistical tables'
	String get description => 'Pre-defined statistical tables';
}

// Path: listApi.sections.statisticalClassifications
class TranslationsListApiSectionsStatisticalClassificationsEn {
	TranslationsListApiSectionsStatisticalClassificationsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Statistical Classifications'
	String get title => 'Statistical Classifications';

	/// en: 'Browse KBLI and KBKI classifications'
	String get description => 'Browse KBLI and KBKI classifications';
}

// Path: listApi.sections.strategicIndicators
class TranslationsListApiSectionsStrategicIndicatorsEn {
	TranslationsListApiSectionsStrategicIndicatorsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Strategic Indicators'
	String get title => 'Strategic Indicators';

	/// en: 'Key statistical measures tracking national development'
	String get description => 'Key statistical measures tracking national development';
}

// Path: listApi.sections.subjectCategories
class TranslationsListApiSectionsSubjectCategoriesEn {
	TranslationsListApiSectionsSubjectCategoriesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Subject Categories'
	String get title => 'Subject Categories';

	/// en: 'Browse and explore subject categories'
	String get description => 'Browse and explore subject categories';
}

// Path: listApi.sections.subjects
class TranslationsListApiSectionsSubjectsEn {
	TranslationsListApiSectionsSubjectsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Subjects'
	String get title => 'Subjects';

	/// en: 'Statistical subject categories'
	String get description => 'Statistical subject categories';
}

// Path: listApi.sections.variables
class TranslationsListApiSectionsVariablesEn {
	TranslationsListApiSectionsVariablesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Variables'
	String get title => 'Variables';

	/// en: 'Statistical variables and measures'
	String get description => 'Statistical variables and measures';
}

// Path: listApi.sections.verticalVariables
class TranslationsListApiSectionsVerticalVariablesEn {
	TranslationsListApiSectionsVerticalVariablesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Vertical Variables'
	String get title => 'Vertical Variables';

	/// en: 'Categorical dimensions and classification systems'
	String get description => 'Categorical dimensions and classification systems';
}

// Path: listApi.sections.units
class TranslationsListApiSectionsUnitsEn {
	TranslationsListApiSectionsUnitsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Units'
	String get title => 'Units';

	/// en: 'Units of measurement for statistical data'
	String get description => 'Units of measurement for statistical data';
}

// Path: listApi.sections.periods
class TranslationsListApiSectionsPeriodsEn {
	TranslationsListApiSectionsPeriodsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Periods'
	String get title => 'Periods';

	/// en: 'Time periods for statistical data'
	String get description => 'Time periods for statistical data';
}

// Path: listApi.sections.derivedPeriods
class TranslationsListApiSectionsDerivedPeriodsEn {
	TranslationsListApiSectionsDerivedPeriodsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Derived Periods'
	String get title => 'Derived Periods';

	/// en: 'Grouped and aggregated time periods'
	String get description => 'Grouped and aggregated time periods';
}

// Path: listApi.sections.derivedVariables
class TranslationsListApiSectionsDerivedVariablesEn {
	TranslationsListApiSectionsDerivedVariablesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Derived Variables'
	String get title => 'Derived Variables';

	/// en: 'Calculated and transformed statistical variables'
	String get description => 'Calculated and transformed statistical variables';
}

// Path: listApi.sections.censusEvents
class TranslationsListApiSectionsCensusEventsEn {
	TranslationsListApiSectionsCensusEventsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Census Events'
	String get title => 'Census Events';

	/// en: 'List of major census activities'
	String get description => 'List of major census activities';
}

// Path: listApi.sections.censusTopics
class TranslationsListApiSectionsCensusTopicsEn {
	TranslationsListApiSectionsCensusTopicsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Census Topics'
	String get title => 'Census Topics';

	/// en: 'Topics within census events'
	String get description => 'Topics within census events';
}

// Path: listApi.sections.censusDatasets
class TranslationsListApiSectionsCensusDatasetsEn {
	TranslationsListApiSectionsCensusDatasetsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Census Datasets'
	String get title => 'Census Datasets';

	/// en: 'Datasets available for census topics'
	String get description => 'Datasets available for census topics';
}

// Path: listApi.sections.censusData
class TranslationsListApiSectionsCensusDataEn {
	TranslationsListApiSectionsCensusDataEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Census Data'
	String get title => 'Census Data';

	/// en: 'Actual census statistical data'
	String get description => 'Actual census statistical data';
}

// Path: listApi.sections.censusAreas
class TranslationsListApiSectionsCensusAreasEn {
	TranslationsListApiSectionsCensusAreasEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Census Areas'
	String get title => 'Census Areas';

	/// en: 'Geographical areas covered by census events'
	String get description => 'Geographical areas covered by census events';
}

// Path: viewApi.sections.publication
class TranslationsViewApiSectionsPublicationEn {
	TranslationsViewApiSectionsPublicationEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Publication Details'
	String get title => 'Publication Details';

	/// en: 'Detailed publication information'
	String get description => 'Detailed publication information';
}

// Path: viewApi.sections.news
class TranslationsViewApiSectionsNewsEn {
	TranslationsViewApiSectionsNewsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'News Details'
	String get title => 'News Details';

	/// en: 'Detailed news article'
	String get description => 'Detailed news article';
}

// Path: viewApi.sections.pressRelease
class TranslationsViewApiSectionsPressReleaseEn {
	TranslationsViewApiSectionsPressReleaseEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Press Release Details'
	String get title => 'Press Release Details';

	/// en: 'Detailed press release'
	String get description => 'Detailed press release';
}

// Path: viewApi.sections.staticTable
class TranslationsViewApiSectionsStaticTableEn {
	TranslationsViewApiSectionsStaticTableEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Static Table Details'
	String get title => 'Static Table Details';

	/// en: 'Detailed table information'
	String get description => 'Detailed table information';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'app.title' => 'STADATA Example',
			'app.description' => 'Showcase of STADATA Flutter SDK capabilities',
			'navigation.home' => 'Home',
			'navigation.listApi' => 'List API',
			'navigation.viewApi' => 'View API',
			'navigation.dynamicTables' => 'Dynamic Tables',
			'navigation.periods' => 'Periods',
			'navigation.pageNotFound' => 'Page Not Found',
			'navigation.pageNotFoundMessage' => 'The page you are looking for does not exist.',
			'common.loading' => 'Loading...',
			'common.error' => 'Error',
			'common.retry' => 'Retry',
			'common.noData' => 'No data available',
			'common.search' => 'Search',
			'common.refresh' => 'Refresh',
			'common.cancel' => 'Cancel',
			'common.save' => 'Save',
			'common.delete' => 'Delete',
			'common.edit' => 'Edit',
			'common.create' => 'Create',
			'common.update' => 'Update',
			'common.back' => 'Back',
			'common.next' => 'Next',
			'common.previous' => 'Previous',
			'common.page' => 'Page',
			'common.total' => 'Total',
			'common.items' => 'items',
			'common.of' => 'of',
			'common.language' => 'Language',
			'common.details' => 'Details',
			'common.unknownState' => 'Unknown state',
			'common.showMore' => 'Show more',
			'common.showLess' => 'Show less',
			'errors.generic' => 'Something went wrong. Please try again.',
			'errors.network' => 'Network error. Please check your connection.',
			'errors.notFound' => 'Data not found.',
			'errors.timeout' => 'Request timeout. Please try again.',
			'errors.unauthorized' => 'Unauthorized access.',
			'errors.serverError' => 'Server error. Please try again later.',
			'home.title' => 'Welcome to STADATA',
			'home.subtitle' => 'Explore Indonesian Statistical Data',
			'home.description' => 'Access comprehensive statistical data from Badan Pusat Statistik (BPS) Indonesia through this showcase application.',
			'home.features.title' => 'Features',
			'home.aboutDemo.title' => 'About This Demo',
			'home.aboutDemo.description' => 'This simplified example demonstrates the domains functionality of the STADATA Flutter SDK. Click on the domains card above to explore statistical domains from BPS Indonesia.',
			'home.sections.listApi.title' => 'List API',
			'home.sections.listApi.description' => 'Browse collections of domains, publications, news, and more',
			'home.sections.viewApi.title' => 'View API',
			'home.sections.viewApi.description' => 'Get detailed information about specific publications, news, and press releases',
			'home.sections.dynamicTables.title' => 'Dynamic Tables',
			'home.sections.dynamicTables.description' => 'Explore dynamic statistical tables with customizable parameters',
			'home.sections.periods.title' => 'Periods',
			'home.sections.periods.description' => 'Browse available time periods for statistical data',
			'listApi.title' => 'List API',
			'listApi.subtitle' => 'Explore statistical data collections from BPS',
			'listApi.sections.domains.title' => 'Domains',
			'listApi.sections.domains.description' => 'Statistical domains and regions',
			'listApi.sections.publications.title' => 'Publications',
			'listApi.sections.publications.description' => 'Statistical publications and reports',
			'listApi.sections.news.title' => 'News',
			'listApi.sections.news.description' => 'Latest statistical news and updates',
			'listApi.sections.pressReleases.title' => 'Press Releases',
			'listApi.sections.pressReleases.description' => 'Official press releases from BPS',
			'listApi.sections.infographics.title' => 'Infographics',
			'listApi.sections.infographics.description' => 'Visual statistical information',
			'listApi.sections.newsCategories.title' => 'News Categories',
			'listApi.sections.newsCategories.description' => 'Browse news category classifications from BPS',
			'listApi.sections.dynamicTables.title' => 'Dynamic Tables',
			'listApi.sections.dynamicTables.description' => 'Explore multi-dimensional statistical data with periods integration',
			'listApi.sections.staticTables.title' => 'Static Tables',
			'listApi.sections.staticTables.description' => 'Pre-defined statistical tables',
			'listApi.sections.statisticalClassifications.title' => 'Statistical Classifications',
			'listApi.sections.statisticalClassifications.description' => 'Browse KBLI and KBKI classifications',
			'listApi.sections.strategicIndicators.title' => 'Strategic Indicators',
			'listApi.sections.strategicIndicators.description' => 'Key statistical measures tracking national development',
			'listApi.sections.subjectCategories.title' => 'Subject Categories',
			'listApi.sections.subjectCategories.description' => 'Browse and explore subject categories',
			'listApi.sections.subjects.title' => 'Subjects',
			'listApi.sections.subjects.description' => 'Statistical subject categories',
			'listApi.sections.variables.title' => 'Variables',
			'listApi.sections.variables.description' => 'Statistical variables and measures',
			'listApi.sections.verticalVariables.title' => 'Vertical Variables',
			'listApi.sections.verticalVariables.description' => 'Categorical dimensions and classification systems',
			'listApi.sections.units.title' => 'Units',
			'listApi.sections.units.description' => 'Units of measurement for statistical data',
			'listApi.sections.periods.title' => 'Periods',
			'listApi.sections.periods.description' => 'Time periods for statistical data',
			'listApi.sections.derivedPeriods.title' => 'Derived Periods',
			'listApi.sections.derivedPeriods.description' => 'Grouped and aggregated time periods',
			'listApi.sections.derivedVariables.title' => 'Derived Variables',
			'listApi.sections.derivedVariables.description' => 'Calculated and transformed statistical variables',
			'listApi.sections.censusEvents.title' => 'Census Events',
			'listApi.sections.censusEvents.description' => 'List of major census activities',
			'listApi.sections.censusTopics.title' => 'Census Topics',
			'listApi.sections.censusTopics.description' => 'Topics within census events',
			'listApi.sections.censusDatasets.title' => 'Census Datasets',
			'listApi.sections.censusDatasets.description' => 'Datasets available for census topics',
			'listApi.sections.censusData.title' => 'Census Data',
			'listApi.sections.censusData.description' => 'Actual census statistical data',
			'listApi.sections.censusAreas.title' => 'Census Areas',
			'listApi.sections.censusAreas.description' => 'Geographical areas covered by census events',
			'viewApi.title' => 'View API',
			'viewApi.subtitle' => 'Detailed information views',
			'viewApi.sections.publication.title' => 'Publication Details',
			'viewApi.sections.publication.description' => 'Detailed publication information',
			'viewApi.sections.news.title' => 'News Details',
			'viewApi.sections.news.description' => 'Detailed news article',
			'viewApi.sections.pressRelease.title' => 'Press Release Details',
			'viewApi.sections.pressRelease.description' => 'Detailed press release',
			'viewApi.sections.staticTable.title' => 'Static Table Details',
			'viewApi.sections.staticTable.description' => 'Detailed table information',
			'domains.title' => 'Domains',
			'domains.types.province' => 'Province',
			'domains.types.regency' => 'Regency',
			'domains.types.regencyByProvince' => 'Regency by Province',
			'domains.types.all' => 'All Domains',
			'domains.fields.id' => 'ID',
			'domains.fields.name' => 'Name',
			'domains.fields.url' => 'URL',
			'domains.parameters.title' => 'API Parameters',
			'domains.parameters.domainType' => 'Domain Type',
			'domains.parameters.provinceCode' => 'Province Code',
			'domains.parameters.provinceCodeHint' => 'e.g., 32 for West Java',
			'domains.parameters.provinceCodeRequired' => 'Province code is required for Regency by Province type',
			'domains.parameters.language' => 'Language',
			'domains.parameters.languageNote' => 'Educational - not applied to domains endpoint',
			'domains.parameters.loadButton' => 'Load Domains',
			'domains.parameters.loading' => 'Loading...',
			'domains.parameters.searchDomains' => 'Search Domains',
			'domains.requestDetails.title' => 'Request Details',
			'domains.requestDetails.method' => 'Method',
			'domains.requestDetails.url' => 'URL',
			'domains.requestDetails.parameters' => 'Parameters',
			'domains.requestDetails.responseTime' => 'Response Time',
			'domains.requestDetails.copyUrl' => 'Copy URL',
			'domains.requestDetails.urlCopied' => 'URL copied to clipboard',
			'domains.requestDetails.noRequest' => 'No request made yet',
			'domains.requestDetails.showDetails' => 'Show Request Details',
			'domains.requestDetails.hideDetails' => 'Hide Request Details',
			'domains.results.title' => 'Domain Results',
			'domains.results.found' => 'Found {count} domain(s)',
			'domains.results.empty' => 'No domains found for the selected criteria',
			'domains.results.initial' => 'Select parameters and click "Load Domains" to start',
			'domains.results.searchParameters' => 'Search Parameters',
			'domains.education.title' => 'How to Use',
			'domains.education.description' => 'Learn how to search and explore domain data from BPS.',
			'domains.education.parameters' => 'Parameters',
			'domains.education.parametersDescription' => 'Configure domain type and region settings',
			'domains.education.results' => 'Results',
			'domains.education.resultsDescription' => 'View domains matching your criteria',
			'domains.education.detail' => 'Detail',
			'domains.education.detailDescription' => 'See domain information and access links',
			'infographics.title' => 'Infographics',
			'infographics.fields.id' => 'ID',
			'infographics.fields.title' => 'Title',
			'infographics.fields.image' => 'Image',
			'infographics.fields.description' => 'Description',
			'infographics.fields.category' => 'Category',
			'infographics.fields.downloadUrl' => 'Download URL',
			'infographics.parameters.title' => 'API Parameters',
			'infographics.parameters.domain' => 'Domain',
			'infographics.parameters.domainHint' => 'e.g., 7200 for national level',
			'infographics.parameters.keyword' => 'Keyword (Optional)',
			'infographics.parameters.keywordHint' => 'Filter by keyword',
			'infographics.parameters.page' => 'Page',
			'infographics.parameters.language' => 'Language',
			'infographics.parameters.languageNote' => 'Applied to infographics content language',
			'infographics.parameters.loadButton' => 'Load Infographics',
			'infographics.parameters.loading' => 'Loading...',
			'infographics.parameters.searchInfographics' => 'Search Infographics',
			'infographics.requestDetails.title' => 'Request Details',
			'infographics.requestDetails.method' => 'Method',
			'infographics.requestDetails.url' => 'URL',
			'infographics.requestDetails.parameters' => 'Parameters',
			'infographics.requestDetails.responseTime' => 'Response Time',
			'infographics.requestDetails.copyUrl' => 'Copy URL',
			'infographics.requestDetails.urlCopied' => 'URL copied to clipboard',
			'infographics.requestDetails.noRequest' => 'No request made yet',
			'infographics.requestDetails.showDetails' => 'Show Request Details',
			'infographics.requestDetails.hideDetails' => 'Hide Request Details',
			'infographics.results.title' => 'Results',
			'infographics.results.found' => 'Found {count} infographic(s)',
			'infographics.results.empty' => 'No infographics found for the selected criteria',
			'infographics.results.initial' => 'Configure parameters and click "Load Infographics" to start',
			'infographics.results.searchParameters' => 'Search Parameters',
			'infographics.education.title' => 'Tips',
			'infographics.education.description' => 'Learn how to use the infographics feature effectively.',
			'infographics.education.parameters' => 'Parameters',
			'infographics.education.parametersDescription' => 'Configure your search criteria here',
			'infographics.education.results' => 'Results',
			'infographics.education.resultsDescription' => 'View infographics matching your criteria',
			'infographics.education.detail' => 'Detail',
			'infographics.education.detailDescription' => 'See full content and download options',
			'publications.title' => 'Publications',
			'publications.comingSoon' => 'Publications Page - Coming Soon',
			'publications.detail.title' => 'Publication Detail',
			'publications.fields.id' => 'ID',
			'publications.fields.title' => 'Title',
			'publications.fields.issn' => 'ISSN',
			'publications.fields.cover' => 'Cover',
			'publications.fields.pdfUrl' => 'PDF URL',
			'publications.fields.size' => 'Size',
			'publications.fields.abstract' => 'Abstract',
			'publications.fields.catalogueNumber' => 'Catalogue Number',
			'publications.fields.publicationNumber' => 'Publication Number',
			'publications.fields.releaseDate' => 'Release Date',
			'publications.fields.updatedAt' => 'Updated At',
			'publications.parameters.title' => 'API Parameters',
			'publications.parameters.domain' => 'Domain',
			'publications.parameters.domainHint' => 'e.g., 7200 for national level',
			'publications.parameters.keyword' => 'Keyword (Optional)',
			'publications.parameters.keywordHint' => 'Filter by keyword',
			'publications.parameters.month' => 'Month (Optional)',
			'publications.parameters.monthHint' => 'Select month',
			'publications.parameters.year' => 'Year (Optional)',
			'publications.parameters.yearHint' => 'Select year',
			'publications.parameters.language' => 'Language',
			'publications.parameters.languageNote' => 'Applied to publications content language',
			'publications.parameters.loadButton' => 'Load Publications',
			'publications.parameters.loading' => 'Loading...',
			'publications.parameters.searchPublications' => 'Search Publications',
			'publications.parameters.clearButton' => 'Clear Filters',
			'publications.requestDetails.title' => 'Request Details',
			'publications.requestDetails.method' => 'Method',
			'publications.requestDetails.url' => 'URL',
			'publications.requestDetails.parameters' => 'Parameters',
			'publications.requestDetails.responseTime' => 'Response Time',
			'publications.requestDetails.copyUrl' => 'Copy URL',
			'publications.requestDetails.urlCopied' => 'URL copied to clipboard',
			'publications.requestDetails.noRequest' => 'No request made yet',
			'publications.requestDetails.showDetails' => 'Show Request Details',
			'publications.requestDetails.hideDetails' => 'Hide Request Details',
			'publications.results.title' => 'Publications Results',
			'publications.results.found' => 'Found {count} publication(s)',
			'publications.results.empty' => 'No publications found for the selected criteria',
			'publications.results.initial' => 'Configure parameters and click "Load Publications" to start',
			'publications.results.searchParameters' => 'Search Parameters',
			'publications.education.title' => 'How to Use',
			'publications.education.description' => 'Learn how to search and explore publication data from BPS.',
			'publications.education.parameters' => 'Parameters',
			'publications.education.parametersDescription' => 'Configure domain and search criteria',
			'publications.education.results' => 'Results',
			'publications.education.resultsDescription' => 'View publications matching your criteria',
			'publications.education.detail' => 'Detail',
			'publications.education.detailDescription' => 'See publication information and download options',
			'news.title' => 'News',
			'news.categories' => 'Categories',
			'news.fields.id' => 'ID',
			'news.fields.title' => 'Title',
			'news.fields.content' => 'Content',
			'news.fields.picture' => 'Picture',
			'news.fields.releaseDate' => 'Release Date',
			'news.fields.category' => 'Category',
			'news.fields.categoryID' => 'Category ID',
			'news.parameters.title' => 'API Parameters',
			'news.parameters.domain' => 'Domain',
			'news.parameters.domainHint' => 'e.g., 7200 for Central Sulawesi',
			'news.parameters.keyword' => 'Keyword (Optional)',
			'news.parameters.keywordHint' => 'Filter by keyword',
			'news.parameters.category' => 'Category ID (Optional)',
			'news.parameters.categoryHint' => 'Filter by news category ID',
			'news.parameters.month' => 'Month (Optional)',
			'news.parameters.monthHint' => 'Select month',
			'news.parameters.year' => 'Year (Optional)',
			'news.parameters.yearHint' => 'Select year',
			'news.parameters.page' => 'Page',
			'news.parameters.language' => 'Language',
			'news.parameters.languageNote' => 'Applied to news content language',
			'news.parameters.loadButton' => 'Load News',
			'news.parameters.searchNews' => 'Search News',
			'news.parameters.clearButton' => 'Clear Filters',
			'news.parameters.loading' => 'Loading...',
			'news.requestDetails.title' => 'Request Details',
			'news.requestDetails.method' => 'Method',
			'news.requestDetails.url' => 'URL',
			'news.requestDetails.parameters' => 'Parameters',
			'news.requestDetails.responseTime' => 'Response Time',
			'news.requestDetails.copyUrl' => 'Copy URL',
			'news.requestDetails.urlCopied' => 'URL copied to clipboard',
			'news.requestDetails.noRequest' => 'No request made yet',
			'news.requestDetails.showDetails' => 'Show Request Details',
			'news.requestDetails.hideDetails' => 'Hide Request Details',
			'news.results.title' => 'News Results',
			'news.results.found' => 'Found {count} news article(s)',
			'news.results.empty' => 'No news found for the selected criteria',
			'news.results.initial' => 'Configure parameters and click "Load News" to start',
			'news.results.searchParameters' => 'Search Parameters',
			'news.detail.title' => 'News Detail',
			'news.detail.metadata' => 'News Information',
			'news.detail.content' => 'Article Content',
			'news.education.title' => 'How this works',
			'news.education.description' => 'This demonstrates the news API workflow with separate pages for parameters, results, and detailed views.',
			'news.education.parameters' => 'Parameters',
			'news.education.parametersDescription' => 'Configure your search criteria here',
			'news.education.results' => 'Results',
			'news.education.resultsDescription' => 'View news articles matching your criteria',
			'news.education.detail' => 'Detail',
			'news.education.detailDescription' => 'See full content using the view API',
			'newsCategories.title' => 'News Categories',
			'newsCategories.fields.id' => 'ID',
			'newsCategories.fields.name' => 'Name',
			'newsCategories.parameters.title' => 'API Parameters',
			'newsCategories.parameters.domain' => 'Domain',
			'newsCategories.parameters.domainHint' => 'e.g., 7200 for national level',
			'newsCategories.parameters.domainDescription' => '4+ character domain code (required)',
			'newsCategories.parameters.language' => 'Language',
			'newsCategories.parameters.languageIndonesian' => 'Indonesian',
			'newsCategories.parameters.languageEnglish' => 'English',
			'newsCategories.parameters.languageDescription' => 'Content language for news categories',
			'newsCategories.parameters.searchNewsCategories' => 'Search News Categories',
			'newsCategories.requestDetails.title' => 'Request Details',
			'newsCategories.requestDetails.endpoint' => 'Endpoint',
			'newsCategories.requestDetails.method' => 'Method',
			'newsCategories.requestDetails.parameters' => 'Parameters',
			'newsCategories.requestDetails.curlExample' => 'cURL Example',
			'newsCategories.requestDetails.showDetails' => 'Show Request Details',
			'newsCategories.requestDetails.hideDetails' => 'Hide Request Details',
			'newsCategories.requestDetails.noRequestYet' => 'No request made yet',
			'newsCategories.results.title' => 'News Categories Results',
			'newsCategories.results.searchParameters' => 'Search Parameters',
			'newsCategories.results.categoriesFound' => 'categories found',
			'newsCategories.results.noDataFound' => 'No Categories Found',
			'newsCategories.results.noDataDescription' => 'Try adjusting your search parameters or check if the domain exists.',
			'newsCategories.categoryDetail.title' => 'Category Details',
			'newsCategories.categoryDetail.id' => 'Category ID',
			'newsCategories.categoryDetail.name' => 'Category Name',
			'newsCategories.education.title' => 'How this works',
			'newsCategories.education.description' => 'Browse news categories available for different domains and languages from BPS statistical data.',
			'newsCategories.education.parameters' => 'Parameters',
			'newsCategories.education.parametersDescription' => 'Configure domain and language settings',
			'newsCategories.education.results' => 'Results',
			'newsCategories.education.resultsDescription' => 'View news categories available for the domain',
			'newsCategories.education.categories' => 'Categories',
			'newsCategories.education.categoriesDescription' => 'Browse different news category classifications',
			'dynamicTables.title' => 'Dynamic Tables',
			'dynamicTables.parameters.title' => 'API Parameters',
			'dynamicTables.parameters.domain' => 'Domain',
			'dynamicTables.parameters.domainHint' => 'e.g., 7200 for national level',
			'dynamicTables.parameters.variable' => 'Variable',
			'dynamicTables.parameters.variableHint' => 'Select a statistical variable',
			'dynamicTables.parameters.selectYear' => 'Select Year',
			'dynamicTables.parameters.language' => 'Language',
			'dynamicTables.parameters.languageNote' => 'Applied to dynamic table content language',
			'dynamicTables.parameters.loadPeriods' => 'Load Available Periods',
			'dynamicTables.parameters.generateTable' => 'Generate Dynamic Table',
			'dynamicTables.parameters.loading' => 'Loading...',
			'dynamicTables.requestDetails.title' => 'Request Details',
			'dynamicTables.requestDetails.showDetails' => 'Show Request Details',
			'dynamicTables.requestDetails.hideDetails' => 'Hide Request Details',
			'dynamicTables.requestDetails.noRequest' => 'No request made yet',
			'dynamicTables.results.title' => 'Dynamic Table Results',
			'dynamicTables.results.periodsAvailable' => 'Available Periods',
			'dynamicTables.results.selectPeriod' => 'Select a period from above to generate table',
			'dynamicTables.results.tableGenerated' => 'Table generated successfully',
			'dynamicTables.results.empty' => 'No data available for selected criteria',
			'dynamicTables.results.initial' => 'Enter parameters above and click "Load Available Years" to get started',
			'dynamicTables.results.periodInitial' => 'Select a year from the dropdown above, then click "Load Dynamic Table" to view the data.',
			'dynamicTables.results.periodId' => 'Period ID',
			'dynamicTables.workflow.title' => 'Dynamic Table Workflow',
			'dynamicTables.workflow.description' => 'Follow these steps to generate a dynamic table from BPS data.',
			'dynamicTables.workflow.step1' => 'Step 1',
			'dynamicTables.workflow.step1Description' => 'Select domain and language, then choose a variable',
			'dynamicTables.workflow.step2' => 'Step 2',
			'dynamicTables.workflow.step2Description' => 'Load available periods for the selected variable',
			'dynamicTables.workflow.step3' => 'Step 3',
			'dynamicTables.workflow.step3Description' => 'Select a year/period and generate the table',
			'dynamicTables.states.initializing' => 'Initializing...',
			'dynamicTables.states.unknown' => 'Unknown state',
			'pressReleases.title' => 'Press Releases',
			'pressReleases.comingSoon' => 'Press Releases Page - Coming Soon',
			'pressReleases.detail.title' => 'Press Release Detail',
			'pressReleases.detail.forId' => 'Press Release Detail for ID: {id}',
			'pressReleases.fields.id' => 'ID',
			'pressReleases.fields.title' => 'Title',
			'pressReleases.fields.cover' => 'Cover',
			'pressReleases.fields.pdfUrl' => 'PDF URL',
			'pressReleases.fields.size' => 'Size',
			'pressReleases.fields.abstract' => 'Abstract',
			'pressReleases.fields.releaseDate' => 'Release Date',
			'pressReleases.parameters.title' => 'API Parameters',
			'pressReleases.parameters.domain' => 'Domain',
			'pressReleases.parameters.domainHint' => 'e.g., 7200 for national level',
			'pressReleases.parameters.keyword' => 'Keyword (Optional)',
			'pressReleases.parameters.keywordHint' => 'Filter by keyword',
			'pressReleases.parameters.month' => 'Month (Optional)',
			'pressReleases.parameters.monthHint' => 'Select month',
			'pressReleases.parameters.year' => 'Year (Optional)',
			'pressReleases.parameters.yearHint' => 'Select year',
			'pressReleases.parameters.language' => 'Language',
			'pressReleases.parameters.languageNote' => 'Applied to press releases content language',
			'pressReleases.parameters.clearFilters' => 'Clear Filters',
			'pressReleases.parameters.search' => 'Search',
			'pressReleases.parameters.load' => 'Load Press Releases',
			'pressReleases.results.title' => 'Press Releases Results',
			'pressReleases.results.count' => '{count} press releases found',
			'pressReleases.results.noData' => 'No press releases found',
			'pressReleases.results.searchParameters' => 'Search Parameters',
			'pressReleases.results.loading' => 'Loading press releases...',
			'pressReleases.results.pressSearchToLoad' => 'Press search button to load data',
			'pressReleases.actions.downloadPdf' => 'Download PDF',
			'pressReleases.actions.viewDetails' => 'View Details',
			'staticTables.title' => 'Static Tables',
			'staticTables.description' => 'Pre-defined statistical tables with data in HTML and Excel formats',
			'staticTables.noDataFound' => 'No static tables found',
			'staticTables.found' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n, one: 'Found ${n} static table', other: 'Found ${n} static tables', ), 
			'staticTables.fields.id' => 'ID',
			'staticTables.fields.title' => 'Title',
			'staticTables.fields.subject' => 'Subject',
			'staticTables.fields.size' => 'Size',
			'staticTables.fields.updatedAt' => 'Updated At',
			'staticTables.fields.createdAt' => 'Created At',
			'staticTables.parameters.title' => 'Parameters',
			'staticTables.parameters.domain' => 'Domain *',
			'staticTables.parameters.domainHint' => 'e.g., 7200',
			'staticTables.parameters.language' => 'Language',
			'staticTables.parameters.keyword' => 'Keyword (Optional)',
			'staticTables.parameters.keywordHint' => 'Filter by keyword',
			'staticTables.parameters.month' => 'Month (Optional)',
			'staticTables.parameters.monthHint' => 'Select month',
			'staticTables.parameters.year' => 'Year (Optional)',
			'staticTables.parameters.yearHint' => 'Select year',
			'staticTables.parameters.clearFilters' => 'Clear Filters',
			'staticTables.parameters.loadButton' => 'Load Static Tables',
			'staticTables.actions.viewTable' => 'View Table',
			'staticTables.actions.downloadExcel' => 'Download Excel',
			'staticTables.detail.title' => 'Static Table Detail',
			'staticTables.detail.loading' => 'Loading table...',
			'staticTables.detail.noTableData' => 'No table data available',
			'staticTables.detail.refresh' => 'Refresh',
			'staticTables.detail.downloadExcel' => 'Download Excel',
			'strategicIndicators.title' => 'Strategic Indicators',
			'strategicIndicators.fields.id' => 'ID',
			'strategicIndicators.fields.title' => 'Title',
			'strategicIndicators.fields.name' => 'Name',
			'strategicIndicators.fields.dataSource' => 'Data Source',
			'strategicIndicators.fields.value' => 'Value',
			'strategicIndicators.fields.unit' => 'Unit',
			'strategicIndicators.fields.period' => 'Period',
			'strategicIndicators.fields.categoryID' => 'Category ID',
			'strategicIndicators.fields.variableID' => 'Variable ID',
			'strategicIndicators.parameters.title' => 'Parameters',
			'strategicIndicators.parameters.domain' => 'Domain *',
			'strategicIndicators.parameters.domainHint' => 'e.g., 7200',
			'strategicIndicators.parameters.variableID' => 'Variable ID (Optional)',
			'strategicIndicators.parameters.variableIDHint' => 'Filter by variable ID',
			'strategicIndicators.parameters.language' => 'Language',
			'strategicIndicators.parameters.loadButton' => 'Load Strategic Indicators',
			'strategicIndicators.results.title' => 'Strategic Indicators Results',
			'strategicIndicators.results.searchParameters' => 'Search Parameters',
			'strategicIndicators.results.found' => 'Found {count} strategic indicator{plural}',
			'strategicIndicators.results.foundSingular' => '',
			'strategicIndicators.results.foundPlural' => 's',
			'strategicIndicators.results.initializing' => 'Initializing...',
			'censusTopics.title' => 'Census Topics',
			'censusTopics.fields.id' => 'ID',
			'censusTopics.fields.topic' => 'Topic',
			'censusTopics.fields.eventID' => 'Event ID',
			'censusTopics.fields.eventName' => 'Event Name',
			'censusTopics.parameters.title' => 'Parameters',
			'censusTopics.parameters.censusEvent' => 'Census Event *',
			'censusTopics.parameters.censusEventHint' => 'Select census event',
			'censusTopics.parameters.loadButton' => 'Load Topics',
			'censusTopics.results.title' => 'Census Topics Results',
			'censusTopics.results.searchParameters' => 'Search Parameters',
			'censusTopics.results.found' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n, one: 'Found ${n} topic', other: 'Found ${n} topics', ), 
			'censusTopics.results.initializing' => 'Initializing...',
			'censusDatasets.title' => 'Census Datasets',
			'censusDatasets.fields.id' => 'Dataset ID',
			'censusDatasets.fields.topicID' => 'Topic ID',
			'censusDatasets.fields.topic' => 'Topic',
			'censusDatasets.fields.eventID' => 'Event ID',
			'censusDatasets.fields.name' => 'Dataset Name',
			'censusDatasets.fields.description' => 'Description',
			'censusDatasets.parameters.title' => 'Parameters',
			'censusDatasets.parameters.censusEvent' => 'Census Event *',
			'censusDatasets.parameters.censusEventHint' => 'Select census event',
			'censusDatasets.parameters.censusTopic' => 'Census Topic *',
			'censusDatasets.parameters.censusTopicHint' => 'Select census topic',
			'censusDatasets.parameters.loadButton' => 'Load Datasets',
			'censusDatasets.results.title' => 'Census Datasets Results',
			'censusDatasets.results.searchParameters' => 'Search Parameters',
			'censusDatasets.results.found' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n, one: 'Found ${n} dataset', other: 'Found ${n} datasets', ), 
			'censusDatasets.results.initializing' => 'Initializing...',
			'censusData.title' => 'Census Data',
			'censusData.fields.regionID' => 'Region ID',
			'censusData.fields.regionCode' => 'Region Code',
			'censusData.fields.regionName' => 'Region Name',
			'censusData.fields.regionLevel' => 'Region Level',
			'censusData.fields.indicatorID' => 'Indicator ID',
			'censusData.fields.indicatorName' => 'Indicator Name',
			'censusData.fields.categories' => 'Categories',
			'censusData.fields.period' => 'Period',
			'censusData.fields.value' => 'Value',
			'censusData.parameters.title' => 'Parameters',
			'censusData.parameters.censusEvent' => 'Census Event *',
			'censusData.parameters.censusEventHint' => 'Select census event',
			'censusData.parameters.censusTopic' => 'Census Topic *',
			'censusData.parameters.censusTopicHint' => 'Select census topic',
			'censusData.parameters.censusArea' => 'Census Area',
			'censusData.parameters.censusAreaHint' => 'Select census area (optional)',
			'censusData.parameters.dataset' => 'Dataset *',
			'censusData.parameters.datasetHint' => 'Select dataset',
			'censusData.parameters.loadButton' => 'Load Census Data',
			'censusData.results.title' => 'Census Data Results',
			'censusData.results.searchParameters' => 'Search Parameters',
			'censusData.results.found' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n, one: 'Found ${n} data entry', other: 'Found ${n} data entries', ), 
			'censusData.results.initializing' => 'Initializing...',
			'censusAreas.title' => 'Census Areas',
			'censusAreas.description' => 'Geographical areas covered by census events',
			'censusAreas.fields.id' => 'Area ID',
			'censusAreas.fields.name' => 'Area Name',
			'censusAreas.fields.slug' => 'Slug',
			_ => null,
		} ?? switch (path) {
			'censusAreas.fields.mfdCode' => 'MFD Code',
			'censusAreas.parameters.title' => 'Parameters',
			'censusAreas.parameters.censusEvent' => 'Census Event *',
			'censusAreas.parameters.censusEventHint' => 'Select census event',
			'censusAreas.parameters.loadButton' => 'Load Census Areas',
			'censusAreas.results.title' => 'Census Areas Results',
			'censusAreas.results.searchParameters' => 'Search Parameters',
			'censusAreas.results.found' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n, one: 'Found ${n} area', other: 'Found ${n} areas', ), 
			'censusAreas.results.initializing' => 'Initializing...',
			'subjectCategories.title' => 'Subject Categories',
			'subjectCategories.fields.id' => 'ID',
			'subjectCategories.fields.name' => 'Name',
			'subjectCategories.parameters.title' => 'Parameters',
			'subjectCategories.parameters.domain' => 'Domain *',
			'subjectCategories.parameters.domainHint' => 'e.g., 7200',
			'subjectCategories.parameters.language' => 'Language',
			'subjectCategories.parameters.loadButton' => 'Load Subject Categories',
			'subjectCategories.results.title' => 'Subject Categories Results',
			'subjectCategories.results.searchParameters' => 'Search Parameters',
			'subjectCategories.results.found' => 'Found {count} subject categor{plural}',
			'subjectCategories.results.foundSingular' => 'y',
			'subjectCategories.results.foundPlural' => 'ies',
			'subjectCategories.results.initializing' => 'Initializing...',
			'subjects.title' => 'Subjects',
			'subjects.comingSoon' => 'Subjects Page - Coming Soon',
			'units.title' => 'Units',
			'units.description' => 'Units of measurement for statistical data',
			'units.noDataFound' => 'No units found',
			'units.found' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n, one: 'Found ${n} unit', other: 'Found ${n} units', ), 
			'units.fields.id' => 'ID',
			'units.fields.title' => 'Title',
			'units.parameters.title' => 'Parameters',
			'units.parameters.domain' => 'Domain *',
			'units.parameters.domainHint' => 'e.g., 7200',
			'units.parameters.language' => 'Language',
			'units.parameters.variableID' => 'Variable (Optional)',
			'units.parameters.variableIDHint' => 'Select variable (optional)',
			'units.parameters.loadButton' => 'Load Units',
			'variables.title' => 'Variables',
			'variables.description' => 'Statistical variables and measures',
			'variables.noDataFound' => 'No variables found',
			'variables.found' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n, one: 'Found ${n} variable', other: 'Found ${n} variables', ), 
			'variables.fields.id' => 'ID',
			'variables.fields.title' => 'Title',
			'variables.fields.graphName' => 'Graph Name',
			'variables.fields.unit' => 'Unit',
			'variables.fields.subjectID' => 'Subject ID',
			'variables.fields.subjectName' => 'Subject Name',
			'variables.fields.notes' => 'Notes',
			'variables.fields.verticalVariableID' => 'Vertical Variable ID',
			'variables.parameters.title' => 'Parameters',
			'variables.parameters.domain' => 'Domain *',
			'variables.parameters.domainHint' => 'e.g., 7200',
			'variables.parameters.language' => 'Language',
			'variables.parameters.year' => 'Year',
			'variables.parameters.yearHint' => 'e.g., 2024 (optional)',
			'variables.parameters.subject' => 'Subject',
			'variables.parameters.subjectHint' => 'Select subject (optional)',
			'variables.parameters.allSubjects' => 'All Subjects',
			'variables.parameters.showExistingVariables' => 'Show Existing Variables',
			'variables.parameters.loadButton' => 'Load Variables',
			'verticalVariables.title' => 'Vertical Variables',
			'verticalVariables.description' => 'Categorical dimensions and classification systems',
			'verticalVariables.noDataFound' => 'No vertical variables found',
			'verticalVariables.found' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n, one: 'Found ${n} vertical variable', other: 'Found ${n} vertical variables', ), 
			'verticalVariables.fields.id' => 'ID',
			'verticalVariables.fields.title' => 'Title',
			'verticalVariables.fields.itemID' => 'Item ID',
			'verticalVariables.fields.groupID' => 'Group ID',
			'verticalVariables.fields.groupName' => 'Group Name',
			'verticalVariables.parameters.title' => 'Parameters',
			'verticalVariables.parameters.domain' => 'Domain *',
			'verticalVariables.parameters.domainHint' => 'e.g., 7200',
			'verticalVariables.parameters.language' => 'Language',
			'verticalVariables.parameters.variableID' => 'Variable ID',
			'verticalVariables.parameters.variableIDHint' => 'e.g., 1234 (optional)',
			'verticalVariables.parameters.loadButton' => 'Load Vertical Variables',
			'shared.pagination.previous' => 'Previous',
			'shared.pagination.next' => 'Next',
			'shared.pagination.loadMore' => 'Load More',
			'shared.pagination.page' => 'Page',
			'shared.pagination.previousPage' => 'Previous page',
			'shared.pagination.nextPage' => 'Next page',
			'shared.pagination.previousPageTooltip' => 'Previous page',
			'shared.pagination.nextPageTooltip' => 'Next page',
			'shared.codeSnippet.copyToClipboard' => 'Copy to clipboard',
			'shared.codeSnippet.codeCopied' => 'Code copied to clipboard',
			'shared.errorWidget.tryAgain' => 'Try Again',
			'shared.searchableDropdown.noItemsFound' => 'No items found',
			'shared.searchableDropdown.selectItem' => 'Select an item',
			'shared.requestDetails.title' => 'Request Details',
			'shared.requestDetails.method' => 'Method',
			'shared.requestDetails.url' => 'URL',
			'shared.requestDetails.parameters' => 'Parameters',
			'shared.requestDetails.urlCopied' => 'URL copied to clipboard',
			'shared.requestDetails.parametersCopied' => 'Parameters copied to clipboard',
			'validation.domainRequired' => 'Domain is required',
			'categories.imageNotAvailable' => 'Image not available',
			'categories.categoryId' => 'Category ID',
			'categories.releaseDate' => 'Release Date',
			'categories.imageUrl' => 'Image URL',
			'categories.tapToReadMore' => 'Tap to read more',
			'instructions.requestDetailsWillShow' => 'Request details will be shown in the results page',
			'instructions.onlyHandlesParameters' => 'This page only handles parameter configuration. Click "Search Domains" to see request details in the results page.',
			'instructions.enterParametersAndLoad' => 'Enter parameters and click load to see data',
			'instructions.languageLabels.indonesian' => 'Indonesian',
			'instructions.languageLabels.english' => 'English',
			'settings.title' => 'Settings',
			'settings.language' => 'Language',
			'settings.theme' => 'Theme',
			'settings.darkMode' => 'Dark Mode',
			'settings.about' => 'About',
			'statisticalClassifications.title' => 'Statistical Classifications',
			'statisticalClassifications.fields.id' => 'ID',
			'statisticalClassifications.fields.title' => 'Title',
			'statisticalClassifications.fields.type' => 'Type',
			'statisticalClassifications.fields.level' => 'Level',
			'statisticalClassifications.fields.source' => 'Source',
			'statisticalClassifications.fields.description' => 'Description',
			'statisticalClassifications.fields.releaseDate' => 'Release Date',
			'statisticalClassifications.levels.category' => 'Category',
			'statisticalClassifications.levels.primaryGroup' => 'Primary Group',
			'statisticalClassifications.levels.group' => 'Group',
			'statisticalClassifications.levels.subGroup' => 'Sub-Group',
			'statisticalClassifications.levels.cluster' => 'Cluster',
			'statisticalClassifications.kbkiLevels.section' => 'Section',
			'statisticalClassifications.kbkiLevels.division' => 'Division',
			'statisticalClassifications.kbkiLevels.group' => 'Group',
			'statisticalClassifications.kbkiLevels.classes' => 'Classes',
			'statisticalClassifications.kbkiLevels.subClass' => 'Sub-Class',
			'statisticalClassifications.kbkiLevels.commodityGroup' => 'Commodity Group',
			'statisticalClassifications.kbkiLevels.commodity' => 'Commodity',
			'statisticalClassifications.parameters.title' => 'Parameters',
			'statisticalClassifications.parameters.category' => 'Classification Category *',
			'statisticalClassifications.parameters.categoryHint' => 'Select KBLI or KBKI',
			'statisticalClassifications.parameters.type' => 'Classification Type *',
			'statisticalClassifications.parameters.typeHint' => 'Select classification year',
			'statisticalClassifications.parameters.level' => 'Classification Level (Optional)',
			'statisticalClassifications.parameters.levelHint' => 'Select level',
			'statisticalClassifications.parameters.allLevels' => 'All Levels',
			'statisticalClassifications.parameters.language' => 'Language',
			'statisticalClassifications.parameters.loadButton' => 'Load Classifications',
			'statisticalClassifications.results.title' => 'Statistical Classifications Results',
			'statisticalClassifications.results.searchParameters' => 'Search Parameters',
			'statisticalClassifications.results.found' => 'Found {count} classification{plural}',
			'statisticalClassifications.results.foundSingular' => '',
			'statisticalClassifications.results.foundPlural' => 's',
			'statisticalClassifications.results.initializing' => 'Initializing...',
			'statisticalClassifications.detail.title' => 'Classification Detail',
			'statisticalClassifications.detail.noChildren' => 'No sub-classifications available',
			'statisticalClassifications.detail.metadata' => 'Metadata',
			'statisticalClassifications.detail.source' => 'Source',
			'statisticalClassifications.detail.releaseDate' => 'Release Date',
			'statisticalClassifications.detail.lastUpdate' => 'Last Update',
			'statisticalClassifications.detail.level' => 'Level',
			'statisticalClassifications.detail.viewOnline' => 'View Online',
			'statisticalClassifications.detail.tags' => 'Tags',
			'statisticalClassifications.detail.derivedClassifications' => 'Derived Classifications',
			'censusEvents.title' => 'Census Events',
			'censusEvents.fields.id' => 'ID',
			'censusEvents.fields.name' => 'Name',
			'censusEvents.fields.year' => 'Year',
			'censusEvents.found' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n, one: 'Found ${n} census event', other: 'Found ${n} census events', ), 
			'censusEvents.initializing' => 'Initializing...',
			_ => null,
		};
	}
}
