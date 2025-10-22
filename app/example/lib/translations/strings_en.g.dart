///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element

class Translations implements BaseTranslations<AppLocale, Translations> {
  /// Returns the current translations of the given [context].
  ///
  /// Usage:
  /// final t = Translations.of(context);
  static Translations of(BuildContext context) =>
      InheritedLocaleData.of<AppLocale, Translations>(context).translations;

  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  Translations({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : assert(
         overrides == null,
         'Set "translation_overrides: true" in order to enable this feature.',
       ),
       $meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.en,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           ) {
    $meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <en>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  /// Access flat map
  dynamic operator [](String key) => $meta.getTranslation(key);

  late final Translations _root = this; // ignore: unused_field

  Translations $copyWith({
    TranslationMetadata<AppLocale, Translations>? meta,
  }) => Translations(meta: meta ?? this.$meta);

  // Translations
  late final TranslationsAppEn app = TranslationsAppEn._(_root);
  late final TranslationsNavigationEn navigation = TranslationsNavigationEn._(
    _root,
  );
  late final TranslationsCommonEn common = TranslationsCommonEn._(_root);
  late final TranslationsErrorsEn errors = TranslationsErrorsEn._(_root);
  late final TranslationsHomeEn home = TranslationsHomeEn._(_root);
  late final TranslationsListApiEn listApi = TranslationsListApiEn._(_root);
  late final TranslationsViewApiEn viewApi = TranslationsViewApiEn._(_root);
  late final TranslationsDomainsEn domains = TranslationsDomainsEn._(_root);
  late final TranslationsInfographicsEn infographics =
      TranslationsInfographicsEn._(_root);
  late final TranslationsPublicationsEn publications =
      TranslationsPublicationsEn._(_root);
  late final TranslationsNewsEn news = TranslationsNewsEn._(_root);
  late final TranslationsNewsCategoriesEn newsCategories =
      TranslationsNewsCategoriesEn._(_root);
  late final TranslationsDynamicTablesEn dynamicTables =
      TranslationsDynamicTablesEn._(_root);
  late final TranslationsPressReleasesEn pressReleases =
      TranslationsPressReleasesEn._(_root);
  late final TranslationsStaticTablesEn staticTables =
      TranslationsStaticTablesEn._(_root);
  late final TranslationsStrategicIndicatorsEn strategicIndicators =
      TranslationsStrategicIndicatorsEn._(_root);
  late final TranslationsSubjectsEn subjects = TranslationsSubjectsEn._(_root);
  late final TranslationsUnitsEn units = TranslationsUnitsEn._(_root);
  late final TranslationsVariablesEn variables = TranslationsVariablesEn._(
    _root,
  );
  late final TranslationsSharedEn shared = TranslationsSharedEn._(_root);
  late final TranslationsValidationEn validation = TranslationsValidationEn._(
    _root,
  );
  late final TranslationsCategoriesEn categories = TranslationsCategoriesEn._(
    _root,
  );
  late final TranslationsInstructionsEn instructions =
      TranslationsInstructionsEn._(_root);
  late final TranslationsSettingsEn settings = TranslationsSettingsEn._(_root);
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
  String get pageNotFoundMessage =>
      'The page you are looking for does not exist.';
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
  String get description =>
      'Access comprehensive statistical data from Badan Pusat Statistik (BPS) Indonesia through this showcase application.';

  late final TranslationsHomeFeaturesEn features = TranslationsHomeFeaturesEn._(
    _root,
  );
  late final TranslationsHomeAboutDemoEn aboutDemo =
      TranslationsHomeAboutDemoEn._(_root);
  late final TranslationsHomeSectionsEn sections = TranslationsHomeSectionsEn._(
    _root,
  );
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

  late final TranslationsListApiSectionsEn sections =
      TranslationsListApiSectionsEn._(_root);
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

  late final TranslationsViewApiSectionsEn sections =
      TranslationsViewApiSectionsEn._(_root);
}

// Path: domains
class TranslationsDomainsEn {
  TranslationsDomainsEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Domains'
  String get title => 'Domains';

  late final TranslationsDomainsTypesEn types = TranslationsDomainsTypesEn._(
    _root,
  );
  late final TranslationsDomainsFieldsEn fields = TranslationsDomainsFieldsEn._(
    _root,
  );
  late final TranslationsDomainsParametersEn parameters =
      TranslationsDomainsParametersEn._(_root);
  late final TranslationsDomainsRequestDetailsEn requestDetails =
      TranslationsDomainsRequestDetailsEn._(_root);
  late final TranslationsDomainsResultsEn results =
      TranslationsDomainsResultsEn._(_root);
  late final TranslationsDomainsEducationEn education =
      TranslationsDomainsEducationEn._(_root);
}

// Path: infographics
class TranslationsInfographicsEn {
  TranslationsInfographicsEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Infographics'
  String get title => 'Infographics';

  late final TranslationsInfographicsFieldsEn fields =
      TranslationsInfographicsFieldsEn._(_root);
  late final TranslationsInfographicsParametersEn parameters =
      TranslationsInfographicsParametersEn._(_root);
  late final TranslationsInfographicsRequestDetailsEn requestDetails =
      TranslationsInfographicsRequestDetailsEn._(_root);
  late final TranslationsInfographicsResultsEn results =
      TranslationsInfographicsResultsEn._(_root);
  late final TranslationsInfographicsEducationEn education =
      TranslationsInfographicsEducationEn._(_root);
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

  late final TranslationsPublicationsDetailEn detail =
      TranslationsPublicationsDetailEn._(_root);
  late final TranslationsPublicationsFieldsEn fields =
      TranslationsPublicationsFieldsEn._(_root);
  late final TranslationsPublicationsParametersEn parameters =
      TranslationsPublicationsParametersEn._(_root);
  late final TranslationsPublicationsRequestDetailsEn requestDetails =
      TranslationsPublicationsRequestDetailsEn._(_root);
  late final TranslationsPublicationsResultsEn results =
      TranslationsPublicationsResultsEn._(_root);
  late final TranslationsPublicationsEducationEn education =
      TranslationsPublicationsEducationEn._(_root);
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

  late final TranslationsNewsFieldsEn fields = TranslationsNewsFieldsEn._(
    _root,
  );
  late final TranslationsNewsParametersEn parameters =
      TranslationsNewsParametersEn._(_root);
  late final TranslationsNewsRequestDetailsEn requestDetails =
      TranslationsNewsRequestDetailsEn._(_root);
  late final TranslationsNewsResultsEn results = TranslationsNewsResultsEn._(
    _root,
  );
  late final TranslationsNewsDetailEn detail = TranslationsNewsDetailEn._(
    _root,
  );
  late final TranslationsNewsEducationEn education =
      TranslationsNewsEducationEn._(_root);
}

// Path: newsCategories
class TranslationsNewsCategoriesEn {
  TranslationsNewsCategoriesEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'News Categories'
  String get title => 'News Categories';

  late final TranslationsNewsCategoriesFieldsEn fields =
      TranslationsNewsCategoriesFieldsEn._(_root);
  late final TranslationsNewsCategoriesParametersEn parameters =
      TranslationsNewsCategoriesParametersEn._(_root);
  late final TranslationsNewsCategoriesRequestDetailsEn requestDetails =
      TranslationsNewsCategoriesRequestDetailsEn._(_root);
  late final TranslationsNewsCategoriesResultsEn results =
      TranslationsNewsCategoriesResultsEn._(_root);
  late final TranslationsNewsCategoriesCategoryDetailEn categoryDetail =
      TranslationsNewsCategoriesCategoryDetailEn._(_root);
  late final TranslationsNewsCategoriesEducationEn education =
      TranslationsNewsCategoriesEducationEn._(_root);
}

// Path: dynamicTables
class TranslationsDynamicTablesEn {
  TranslationsDynamicTablesEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Dynamic Tables'
  String get title => 'Dynamic Tables';

  late final TranslationsDynamicTablesParametersEn parameters =
      TranslationsDynamicTablesParametersEn._(_root);
  late final TranslationsDynamicTablesRequestDetailsEn requestDetails =
      TranslationsDynamicTablesRequestDetailsEn._(_root);
  late final TranslationsDynamicTablesResultsEn results =
      TranslationsDynamicTablesResultsEn._(_root);
  late final TranslationsDynamicTablesWorkflowEn workflow =
      TranslationsDynamicTablesWorkflowEn._(_root);
  late final TranslationsDynamicTablesStatesEn states =
      TranslationsDynamicTablesStatesEn._(_root);
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

  late final TranslationsPressReleasesDetailEn detail =
      TranslationsPressReleasesDetailEn._(_root);
}

// Path: staticTables
class TranslationsStaticTablesEn {
  TranslationsStaticTablesEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Static Tables'
  String get title => 'Static Tables';

  /// en: 'Static Tables Page - Coming Soon'
  String get comingSoon => 'Static Tables Page - Coming Soon';

  late final TranslationsStaticTablesDetailEn detail =
      TranslationsStaticTablesDetailEn._(_root);
}

// Path: strategicIndicators
class TranslationsStrategicIndicatorsEn {
  TranslationsStrategicIndicatorsEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Strategic Indicators'
  String get title => 'Strategic Indicators';

  /// en: 'Strategic Indicators Page - Coming Soon'
  String get comingSoon => 'Strategic Indicators Page - Coming Soon';
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

  /// en: 'Units Page - Coming Soon'
  String get comingSoon => 'Units Page - Coming Soon';
}

// Path: variables
class TranslationsVariablesEn {
  TranslationsVariablesEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Variables'
  String get title => 'Variables';

  /// en: 'Variables Page - Coming Soon'
  String get comingSoon => 'Variables Page - Coming Soon';
}

// Path: shared
class TranslationsSharedEn {
  TranslationsSharedEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final TranslationsSharedPaginationEn pagination =
      TranslationsSharedPaginationEn._(_root);
  late final TranslationsSharedCodeSnippetEn codeSnippet =
      TranslationsSharedCodeSnippetEn._(_root);
  late final TranslationsSharedErrorWidgetEn errorWidget =
      TranslationsSharedErrorWidgetEn._(_root);
  late final TranslationsSharedSearchableDropdownEn searchableDropdown =
      TranslationsSharedSearchableDropdownEn._(_root);
  late final TranslationsSharedRequestDetailsEn requestDetails =
      TranslationsSharedRequestDetailsEn._(_root);
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
  String get requestDetailsWillShow =>
      'Request details will be shown in the results page';

  /// en: 'This page only handles parameter configuration. Click "Search Domains" to see request details in the results page.'
  String get onlyHandlesParameters =>
      'This page only handles parameter configuration. Click "Search Domains" to see request details in the results page.';

  late final TranslationsInstructionsLanguageLabelsEn languageLabels =
      TranslationsInstructionsLanguageLabelsEn._(_root);
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
  String get description =>
      'This simplified example demonstrates the domains functionality of the STADATA Flutter SDK. Click on the domains card above to explore statistical domains from BPS Indonesia.';
}

// Path: home.sections
class TranslationsHomeSectionsEn {
  TranslationsHomeSectionsEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final TranslationsHomeSectionsListApiEn listApi =
      TranslationsHomeSectionsListApiEn._(_root);
  late final TranslationsHomeSectionsViewApiEn viewApi =
      TranslationsHomeSectionsViewApiEn._(_root);
  late final TranslationsHomeSectionsDynamicTablesEn dynamicTables =
      TranslationsHomeSectionsDynamicTablesEn._(_root);
  late final TranslationsHomeSectionsPeriodsEn periods =
      TranslationsHomeSectionsPeriodsEn._(_root);
}

// Path: listApi.sections
class TranslationsListApiSectionsEn {
  TranslationsListApiSectionsEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final TranslationsListApiSectionsDomainsEn domains =
      TranslationsListApiSectionsDomainsEn._(_root);
  late final TranslationsListApiSectionsPublicationsEn publications =
      TranslationsListApiSectionsPublicationsEn._(_root);
  late final TranslationsListApiSectionsNewsEn news =
      TranslationsListApiSectionsNewsEn._(_root);
  late final TranslationsListApiSectionsPressReleasesEn pressReleases =
      TranslationsListApiSectionsPressReleasesEn._(_root);
  late final TranslationsListApiSectionsInfographicsEn infographics =
      TranslationsListApiSectionsInfographicsEn._(_root);
  late final TranslationsListApiSectionsNewsCategoriesEn newsCategories =
      TranslationsListApiSectionsNewsCategoriesEn._(_root);
  late final TranslationsListApiSectionsDynamicTablesEn dynamicTables =
      TranslationsListApiSectionsDynamicTablesEn._(_root);
  late final TranslationsListApiSectionsStaticTablesEn staticTables =
      TranslationsListApiSectionsStaticTablesEn._(_root);
  late final TranslationsListApiSectionsStrategicIndicatorsEn
  strategicIndicators = TranslationsListApiSectionsStrategicIndicatorsEn._(
    _root,
  );
  late final TranslationsListApiSectionsSubjectsEn subjects =
      TranslationsListApiSectionsSubjectsEn._(_root);
  late final TranslationsListApiSectionsVariablesEn variables =
      TranslationsListApiSectionsVariablesEn._(_root);
  late final TranslationsListApiSectionsUnitsEn units =
      TranslationsListApiSectionsUnitsEn._(_root);
}

// Path: viewApi.sections
class TranslationsViewApiSectionsEn {
  TranslationsViewApiSectionsEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final TranslationsViewApiSectionsPublicationEn publication =
      TranslationsViewApiSectionsPublicationEn._(_root);
  late final TranslationsViewApiSectionsNewsEn news =
      TranslationsViewApiSectionsNewsEn._(_root);
  late final TranslationsViewApiSectionsPressReleaseEn pressRelease =
      TranslationsViewApiSectionsPressReleaseEn._(_root);
  late final TranslationsViewApiSectionsStaticTableEn staticTable =
      TranslationsViewApiSectionsStaticTableEn._(_root);
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
  String get provinceCodeRequired =>
      'Province code is required for Regency by Province type';

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
  String get description =>
      'Learn how to search and explore domain data from BPS.';

  /// en: 'Parameters'
  String get parameters => 'Parameters';

  /// en: 'Configure domain type and region settings'
  String get parametersDescription =>
      'Configure domain type and region settings';

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
  String get initial =>
      'Configure parameters and click "Load Infographics" to start';

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
  String get description =>
      'Learn how to use the infographics feature effectively.';

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
  String get initial =>
      'Configure parameters and click "Load Publications" to start';

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
  String get description =>
      'Learn how to search and explore publication data from BPS.';

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
  String get detailDescription =>
      'See publication information and download options';
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
  String get description =>
      'This demonstrates the news API workflow with separate pages for parameters, results, and detailed views.';

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
  String get noDataDescription =>
      'Try adjusting your search parameters or check if the domain exists.';
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
  String get description =>
      'Browse news categories available for different domains and languages from BPS statistical data.';

  /// en: 'Parameters'
  String get parameters => 'Parameters';

  /// en: 'Configure domain and language settings'
  String get parametersDescription => 'Configure domain and language settings';

  /// en: 'Results'
  String get results => 'Results';

  /// en: 'View news categories available for the domain'
  String get resultsDescription =>
      'View news categories available for the domain';

  /// en: 'Categories'
  String get categories => 'Categories';

  /// en: 'Browse different news category classifications'
  String get categoriesDescription =>
      'Browse different news category classifications';
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
  String get initial =>
      'Enter parameters above and click "Load Available Years" to get started';

  /// en: 'Select a year from the dropdown above, then click "Load Dynamic Table" to view the data.'
  String get periodInitial =>
      'Select a year from the dropdown above, then click "Load Dynamic Table" to view the data.';

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
  String get description =>
      'Follow these steps to generate a dynamic table from BPS data.';

  /// en: 'Step 1'
  String get step1 => 'Step 1';

  /// en: 'Select domain and language, then choose a variable'
  String get step1Description =>
      'Select domain and language, then choose a variable';

  /// en: 'Step 2'
  String get step2 => 'Step 2';

  /// en: 'Load available periods for the selected variable'
  String get step2Description =>
      'Load available periods for the selected variable';

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

// Path: staticTables.detail
class TranslationsStaticTablesDetailEn {
  TranslationsStaticTablesDetailEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Static Table Detail'
  String get title => 'Static Table Detail';

  /// en: 'Static Table Detail for ID: {id}'
  String get forId => 'Static Table Detail for ID: {id}';
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

// Path: home.sections.listApi
class TranslationsHomeSectionsListApiEn {
  TranslationsHomeSectionsListApiEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'List API'
  String get title => 'List API';

  /// en: 'Browse collections of domains, publications, news, and more'
  String get description =>
      'Browse collections of domains, publications, news, and more';
}

// Path: home.sections.viewApi
class TranslationsHomeSectionsViewApiEn {
  TranslationsHomeSectionsViewApiEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'View API'
  String get title => 'View API';

  /// en: 'Get detailed information about specific publications, news, and press releases'
  String get description =>
      'Get detailed information about specific publications, news, and press releases';
}

// Path: home.sections.dynamicTables
class TranslationsHomeSectionsDynamicTablesEn {
  TranslationsHomeSectionsDynamicTablesEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Dynamic Tables'
  String get title => 'Dynamic Tables';

  /// en: 'Explore dynamic statistical tables with customizable parameters'
  String get description =>
      'Explore dynamic statistical tables with customizable parameters';
}

// Path: home.sections.periods
class TranslationsHomeSectionsPeriodsEn {
  TranslationsHomeSectionsPeriodsEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Periods'
  String get title => 'Periods';

  /// en: 'Browse available time periods for statistical data'
  String get description =>
      'Browse available time periods for statistical data';
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
  String get description =>
      'Explore multi-dimensional statistical data with periods integration';
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

// Path: listApi.sections.strategicIndicators
class TranslationsListApiSectionsStrategicIndicatorsEn {
  TranslationsListApiSectionsStrategicIndicatorsEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Strategic Indicators'
  String get title => 'Strategic Indicators';

  /// en: 'Key performance indicators'
  String get description => 'Key performance indicators';
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

// Path: listApi.sections.units
class TranslationsListApiSectionsUnitsEn {
  TranslationsListApiSectionsUnitsEn._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// en: 'Units'
  String get title => 'Units';

  /// en: 'Units of measurement'
  String get description => 'Units of measurement';
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

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
  dynamic _flatMapFunction(String path) {
    switch (path) {
      case 'app.title':
        return 'STADATA Example';
      case 'app.description':
        return 'Showcase of STADATA Flutter SDK capabilities';
      case 'navigation.home':
        return 'Home';
      case 'navigation.listApi':
        return 'List API';
      case 'navigation.viewApi':
        return 'View API';
      case 'navigation.dynamicTables':
        return 'Dynamic Tables';
      case 'navigation.periods':
        return 'Periods';
      case 'navigation.pageNotFound':
        return 'Page Not Found';
      case 'navigation.pageNotFoundMessage':
        return 'The page you are looking for does not exist.';
      case 'common.loading':
        return 'Loading...';
      case 'common.error':
        return 'Error';
      case 'common.retry':
        return 'Retry';
      case 'common.noData':
        return 'No data available';
      case 'common.search':
        return 'Search';
      case 'common.refresh':
        return 'Refresh';
      case 'common.cancel':
        return 'Cancel';
      case 'common.save':
        return 'Save';
      case 'common.delete':
        return 'Delete';
      case 'common.edit':
        return 'Edit';
      case 'common.create':
        return 'Create';
      case 'common.update':
        return 'Update';
      case 'common.back':
        return 'Back';
      case 'common.next':
        return 'Next';
      case 'common.previous':
        return 'Previous';
      case 'common.page':
        return 'Page';
      case 'common.total':
        return 'Total';
      case 'common.items':
        return 'items';
      case 'common.of':
        return 'of';
      case 'common.language':
        return 'Language';
      case 'common.details':
        return 'Details';
      case 'common.unknownState':
        return 'Unknown state';
      case 'errors.generic':
        return 'Something went wrong. Please try again.';
      case 'errors.network':
        return 'Network error. Please check your connection.';
      case 'errors.notFound':
        return 'Data not found.';
      case 'errors.timeout':
        return 'Request timeout. Please try again.';
      case 'errors.unauthorized':
        return 'Unauthorized access.';
      case 'errors.serverError':
        return 'Server error. Please try again later.';
      case 'home.title':
        return 'Welcome to STADATA';
      case 'home.subtitle':
        return 'Explore Indonesian Statistical Data';
      case 'home.description':
        return 'Access comprehensive statistical data from Badan Pusat Statistik (BPS) Indonesia through this showcase application.';
      case 'home.features.title':
        return 'Features';
      case 'home.aboutDemo.title':
        return 'About This Demo';
      case 'home.aboutDemo.description':
        return 'This simplified example demonstrates the domains functionality of the STADATA Flutter SDK. Click on the domains card above to explore statistical domains from BPS Indonesia.';
      case 'home.sections.listApi.title':
        return 'List API';
      case 'home.sections.listApi.description':
        return 'Browse collections of domains, publications, news, and more';
      case 'home.sections.viewApi.title':
        return 'View API';
      case 'home.sections.viewApi.description':
        return 'Get detailed information about specific publications, news, and press releases';
      case 'home.sections.dynamicTables.title':
        return 'Dynamic Tables';
      case 'home.sections.dynamicTables.description':
        return 'Explore dynamic statistical tables with customizable parameters';
      case 'home.sections.periods.title':
        return 'Periods';
      case 'home.sections.periods.description':
        return 'Browse available time periods for statistical data';
      case 'listApi.title':
        return 'List API';
      case 'listApi.subtitle':
        return 'Explore statistical data collections from BPS';
      case 'listApi.sections.domains.title':
        return 'Domains';
      case 'listApi.sections.domains.description':
        return 'Statistical domains and regions';
      case 'listApi.sections.publications.title':
        return 'Publications';
      case 'listApi.sections.publications.description':
        return 'Statistical publications and reports';
      case 'listApi.sections.news.title':
        return 'News';
      case 'listApi.sections.news.description':
        return 'Latest statistical news and updates';
      case 'listApi.sections.pressReleases.title':
        return 'Press Releases';
      case 'listApi.sections.pressReleases.description':
        return 'Official press releases from BPS';
      case 'listApi.sections.infographics.title':
        return 'Infographics';
      case 'listApi.sections.infographics.description':
        return 'Visual statistical information';
      case 'listApi.sections.newsCategories.title':
        return 'News Categories';
      case 'listApi.sections.newsCategories.description':
        return 'Browse news category classifications from BPS';
      case 'listApi.sections.dynamicTables.title':
        return 'Dynamic Tables';
      case 'listApi.sections.dynamicTables.description':
        return 'Explore multi-dimensional statistical data with periods integration';
      case 'listApi.sections.staticTables.title':
        return 'Static Tables';
      case 'listApi.sections.staticTables.description':
        return 'Pre-defined statistical tables';
      case 'listApi.sections.strategicIndicators.title':
        return 'Strategic Indicators';
      case 'listApi.sections.strategicIndicators.description':
        return 'Key performance indicators';
      case 'listApi.sections.subjects.title':
        return 'Subjects';
      case 'listApi.sections.subjects.description':
        return 'Statistical subject categories';
      case 'listApi.sections.variables.title':
        return 'Variables';
      case 'listApi.sections.variables.description':
        return 'Statistical variables and measures';
      case 'listApi.sections.units.title':
        return 'Units';
      case 'listApi.sections.units.description':
        return 'Units of measurement';
      case 'viewApi.title':
        return 'View API';
      case 'viewApi.subtitle':
        return 'Detailed information views';
      case 'viewApi.sections.publication.title':
        return 'Publication Details';
      case 'viewApi.sections.publication.description':
        return 'Detailed publication information';
      case 'viewApi.sections.news.title':
        return 'News Details';
      case 'viewApi.sections.news.description':
        return 'Detailed news article';
      case 'viewApi.sections.pressRelease.title':
        return 'Press Release Details';
      case 'viewApi.sections.pressRelease.description':
        return 'Detailed press release';
      case 'viewApi.sections.staticTable.title':
        return 'Static Table Details';
      case 'viewApi.sections.staticTable.description':
        return 'Detailed table information';
      case 'domains.title':
        return 'Domains';
      case 'domains.types.province':
        return 'Province';
      case 'domains.types.regency':
        return 'Regency';
      case 'domains.types.regencyByProvince':
        return 'Regency by Province';
      case 'domains.types.all':
        return 'All Domains';
      case 'domains.fields.id':
        return 'ID';
      case 'domains.fields.name':
        return 'Name';
      case 'domains.fields.url':
        return 'URL';
      case 'domains.parameters.title':
        return 'API Parameters';
      case 'domains.parameters.domainType':
        return 'Domain Type';
      case 'domains.parameters.provinceCode':
        return 'Province Code';
      case 'domains.parameters.provinceCodeHint':
        return 'e.g., 32 for West Java';
      case 'domains.parameters.provinceCodeRequired':
        return 'Province code is required for Regency by Province type';
      case 'domains.parameters.language':
        return 'Language';
      case 'domains.parameters.languageNote':
        return 'Educational - not applied to domains endpoint';
      case 'domains.parameters.loadButton':
        return 'Load Domains';
      case 'domains.parameters.loading':
        return 'Loading...';
      case 'domains.parameters.searchDomains':
        return 'Search Domains';
      case 'domains.requestDetails.title':
        return 'Request Details';
      case 'domains.requestDetails.method':
        return 'Method';
      case 'domains.requestDetails.url':
        return 'URL';
      case 'domains.requestDetails.parameters':
        return 'Parameters';
      case 'domains.requestDetails.responseTime':
        return 'Response Time';
      case 'domains.requestDetails.copyUrl':
        return 'Copy URL';
      case 'domains.requestDetails.urlCopied':
        return 'URL copied to clipboard';
      case 'domains.requestDetails.noRequest':
        return 'No request made yet';
      case 'domains.requestDetails.showDetails':
        return 'Show Request Details';
      case 'domains.requestDetails.hideDetails':
        return 'Hide Request Details';
      case 'domains.results.title':
        return 'Domain Results';
      case 'domains.results.found':
        return 'Found {count} domain(s)';
      case 'domains.results.empty':
        return 'No domains found for the selected criteria';
      case 'domains.results.initial':
        return 'Select parameters and click "Load Domains" to start';
      case 'domains.results.searchParameters':
        return 'Search Parameters';
      case 'domains.education.title':
        return 'How to Use';
      case 'domains.education.description':
        return 'Learn how to search and explore domain data from BPS.';
      case 'domains.education.parameters':
        return 'Parameters';
      case 'domains.education.parametersDescription':
        return 'Configure domain type and region settings';
      case 'domains.education.results':
        return 'Results';
      case 'domains.education.resultsDescription':
        return 'View domains matching your criteria';
      case 'domains.education.detail':
        return 'Detail';
      case 'domains.education.detailDescription':
        return 'See domain information and access links';
      case 'infographics.title':
        return 'Infographics';
      case 'infographics.fields.id':
        return 'ID';
      case 'infographics.fields.title':
        return 'Title';
      case 'infographics.fields.image':
        return 'Image';
      case 'infographics.fields.description':
        return 'Description';
      case 'infographics.fields.category':
        return 'Category';
      case 'infographics.fields.downloadUrl':
        return 'Download URL';
      case 'infographics.parameters.title':
        return 'API Parameters';
      case 'infographics.parameters.domain':
        return 'Domain';
      case 'infographics.parameters.domainHint':
        return 'e.g., 7200 for national level';
      case 'infographics.parameters.keyword':
        return 'Keyword (Optional)';
      case 'infographics.parameters.keywordHint':
        return 'Filter by keyword';
      case 'infographics.parameters.page':
        return 'Page';
      case 'infographics.parameters.language':
        return 'Language';
      case 'infographics.parameters.languageNote':
        return 'Applied to infographics content language';
      case 'infographics.parameters.loadButton':
        return 'Load Infographics';
      case 'infographics.parameters.loading':
        return 'Loading...';
      case 'infographics.parameters.searchInfographics':
        return 'Search Infographics';
      case 'infographics.requestDetails.title':
        return 'Request Details';
      case 'infographics.requestDetails.method':
        return 'Method';
      case 'infographics.requestDetails.url':
        return 'URL';
      case 'infographics.requestDetails.parameters':
        return 'Parameters';
      case 'infographics.requestDetails.responseTime':
        return 'Response Time';
      case 'infographics.requestDetails.copyUrl':
        return 'Copy URL';
      case 'infographics.requestDetails.urlCopied':
        return 'URL copied to clipboard';
      case 'infographics.requestDetails.noRequest':
        return 'No request made yet';
      case 'infographics.requestDetails.showDetails':
        return 'Show Request Details';
      case 'infographics.requestDetails.hideDetails':
        return 'Hide Request Details';
      case 'infographics.results.title':
        return 'Results';
      case 'infographics.results.found':
        return 'Found {count} infographic(s)';
      case 'infographics.results.empty':
        return 'No infographics found for the selected criteria';
      case 'infographics.results.initial':
        return 'Configure parameters and click "Load Infographics" to start';
      case 'infographics.results.searchParameters':
        return 'Search Parameters';
      case 'infographics.education.title':
        return 'Tips';
      case 'infographics.education.description':
        return 'Learn how to use the infographics feature effectively.';
      case 'infographics.education.parameters':
        return 'Parameters';
      case 'infographics.education.parametersDescription':
        return 'Configure your search criteria here';
      case 'infographics.education.results':
        return 'Results';
      case 'infographics.education.resultsDescription':
        return 'View infographics matching your criteria';
      case 'infographics.education.detail':
        return 'Detail';
      case 'infographics.education.detailDescription':
        return 'See full content and download options';
      case 'publications.title':
        return 'Publications';
      case 'publications.comingSoon':
        return 'Publications Page - Coming Soon';
      case 'publications.detail.title':
        return 'Publication Detail';
      case 'publications.fields.id':
        return 'ID';
      case 'publications.fields.title':
        return 'Title';
      case 'publications.fields.issn':
        return 'ISSN';
      case 'publications.fields.cover':
        return 'Cover';
      case 'publications.fields.pdfUrl':
        return 'PDF URL';
      case 'publications.fields.size':
        return 'Size';
      case 'publications.fields.abstract':
        return 'Abstract';
      case 'publications.fields.catalogueNumber':
        return 'Catalogue Number';
      case 'publications.fields.publicationNumber':
        return 'Publication Number';
      case 'publications.fields.releaseDate':
        return 'Release Date';
      case 'publications.fields.updatedAt':
        return 'Updated At';
      case 'publications.parameters.title':
        return 'API Parameters';
      case 'publications.parameters.domain':
        return 'Domain';
      case 'publications.parameters.domainHint':
        return 'e.g., 7200 for national level';
      case 'publications.parameters.keyword':
        return 'Keyword (Optional)';
      case 'publications.parameters.keywordHint':
        return 'Filter by keyword';
      case 'publications.parameters.month':
        return 'Month (Optional)';
      case 'publications.parameters.monthHint':
        return 'Select month';
      case 'publications.parameters.year':
        return 'Year (Optional)';
      case 'publications.parameters.yearHint':
        return 'Select year';
      case 'publications.parameters.language':
        return 'Language';
      case 'publications.parameters.languageNote':
        return 'Applied to publications content language';
      case 'publications.parameters.loadButton':
        return 'Load Publications';
      case 'publications.parameters.loading':
        return 'Loading...';
      case 'publications.parameters.searchPublications':
        return 'Search Publications';
      case 'publications.parameters.clearButton':
        return 'Clear Filters';
      case 'publications.requestDetails.title':
        return 'Request Details';
      case 'publications.requestDetails.method':
        return 'Method';
      case 'publications.requestDetails.url':
        return 'URL';
      case 'publications.requestDetails.parameters':
        return 'Parameters';
      case 'publications.requestDetails.responseTime':
        return 'Response Time';
      case 'publications.requestDetails.copyUrl':
        return 'Copy URL';
      case 'publications.requestDetails.urlCopied':
        return 'URL copied to clipboard';
      case 'publications.requestDetails.noRequest':
        return 'No request made yet';
      case 'publications.requestDetails.showDetails':
        return 'Show Request Details';
      case 'publications.requestDetails.hideDetails':
        return 'Hide Request Details';
      case 'publications.results.title':
        return 'Publications Results';
      case 'publications.results.found':
        return 'Found {count} publication(s)';
      case 'publications.results.empty':
        return 'No publications found for the selected criteria';
      case 'publications.results.initial':
        return 'Configure parameters and click "Load Publications" to start';
      case 'publications.results.searchParameters':
        return 'Search Parameters';
      case 'publications.education.title':
        return 'How to Use';
      case 'publications.education.description':
        return 'Learn how to search and explore publication data from BPS.';
      case 'publications.education.parameters':
        return 'Parameters';
      case 'publications.education.parametersDescription':
        return 'Configure domain and search criteria';
      case 'publications.education.results':
        return 'Results';
      case 'publications.education.resultsDescription':
        return 'View publications matching your criteria';
      case 'publications.education.detail':
        return 'Detail';
      case 'publications.education.detailDescription':
        return 'See publication information and download options';
      case 'news.title':
        return 'News';
      case 'news.categories':
        return 'Categories';
      case 'news.fields.id':
        return 'ID';
      case 'news.fields.title':
        return 'Title';
      case 'news.fields.content':
        return 'Content';
      case 'news.fields.picture':
        return 'Picture';
      case 'news.fields.releaseDate':
        return 'Release Date';
      case 'news.fields.category':
        return 'Category';
      case 'news.fields.categoryID':
        return 'Category ID';
      case 'news.parameters.title':
        return 'API Parameters';
      case 'news.parameters.domain':
        return 'Domain';
      case 'news.parameters.domainHint':
        return 'e.g., 7200 for Central Sulawesi';
      case 'news.parameters.keyword':
        return 'Keyword (Optional)';
      case 'news.parameters.keywordHint':
        return 'Filter by keyword';
      case 'news.parameters.category':
        return 'Category ID (Optional)';
      case 'news.parameters.categoryHint':
        return 'Filter by news category ID';
      case 'news.parameters.month':
        return 'Month (Optional)';
      case 'news.parameters.monthHint':
        return 'Select month';
      case 'news.parameters.year':
        return 'Year (Optional)';
      case 'news.parameters.yearHint':
        return 'Select year';
      case 'news.parameters.page':
        return 'Page';
      case 'news.parameters.language':
        return 'Language';
      case 'news.parameters.languageNote':
        return 'Applied to news content language';
      case 'news.parameters.loadButton':
        return 'Load News';
      case 'news.parameters.searchNews':
        return 'Search News';
      case 'news.parameters.clearButton':
        return 'Clear Filters';
      case 'news.parameters.loading':
        return 'Loading...';
      case 'news.requestDetails.title':
        return 'Request Details';
      case 'news.requestDetails.method':
        return 'Method';
      case 'news.requestDetails.url':
        return 'URL';
      case 'news.requestDetails.parameters':
        return 'Parameters';
      case 'news.requestDetails.responseTime':
        return 'Response Time';
      case 'news.requestDetails.copyUrl':
        return 'Copy URL';
      case 'news.requestDetails.urlCopied':
        return 'URL copied to clipboard';
      case 'news.requestDetails.noRequest':
        return 'No request made yet';
      case 'news.requestDetails.showDetails':
        return 'Show Request Details';
      case 'news.requestDetails.hideDetails':
        return 'Hide Request Details';
      case 'news.results.title':
        return 'News Results';
      case 'news.results.found':
        return 'Found {count} news article(s)';
      case 'news.results.empty':
        return 'No news found for the selected criteria';
      case 'news.results.initial':
        return 'Configure parameters and click "Load News" to start';
      case 'news.results.searchParameters':
        return 'Search Parameters';
      case 'news.detail.title':
        return 'News Detail';
      case 'news.detail.metadata':
        return 'News Information';
      case 'news.detail.content':
        return 'Article Content';
      case 'news.education.title':
        return 'How this works';
      case 'news.education.description':
        return 'This demonstrates the news API workflow with separate pages for parameters, results, and detailed views.';
      case 'news.education.parameters':
        return 'Parameters';
      case 'news.education.parametersDescription':
        return 'Configure your search criteria here';
      case 'news.education.results':
        return 'Results';
      case 'news.education.resultsDescription':
        return 'View news articles matching your criteria';
      case 'news.education.detail':
        return 'Detail';
      case 'news.education.detailDescription':
        return 'See full content using the view API';
      case 'newsCategories.title':
        return 'News Categories';
      case 'newsCategories.fields.id':
        return 'ID';
      case 'newsCategories.fields.name':
        return 'Name';
      case 'newsCategories.parameters.title':
        return 'API Parameters';
      case 'newsCategories.parameters.domain':
        return 'Domain';
      case 'newsCategories.parameters.domainHint':
        return 'e.g., 7200 for national level';
      case 'newsCategories.parameters.domainDescription':
        return '4+ character domain code (required)';
      case 'newsCategories.parameters.language':
        return 'Language';
      case 'newsCategories.parameters.languageIndonesian':
        return 'Indonesian';
      case 'newsCategories.parameters.languageEnglish':
        return 'English';
      case 'newsCategories.parameters.languageDescription':
        return 'Content language for news categories';
      case 'newsCategories.parameters.searchNewsCategories':
        return 'Search News Categories';
      case 'newsCategories.requestDetails.title':
        return 'Request Details';
      case 'newsCategories.requestDetails.endpoint':
        return 'Endpoint';
      case 'newsCategories.requestDetails.method':
        return 'Method';
      case 'newsCategories.requestDetails.parameters':
        return 'Parameters';
      case 'newsCategories.requestDetails.curlExample':
        return 'cURL Example';
      case 'newsCategories.requestDetails.showDetails':
        return 'Show Request Details';
      case 'newsCategories.requestDetails.hideDetails':
        return 'Hide Request Details';
      case 'newsCategories.requestDetails.noRequestYet':
        return 'No request made yet';
      case 'newsCategories.results.title':
        return 'News Categories Results';
      case 'newsCategories.results.searchParameters':
        return 'Search Parameters';
      case 'newsCategories.results.categoriesFound':
        return 'categories found';
      case 'newsCategories.results.noDataFound':
        return 'No Categories Found';
      case 'newsCategories.results.noDataDescription':
        return 'Try adjusting your search parameters or check if the domain exists.';
      case 'newsCategories.categoryDetail.title':
        return 'Category Details';
      case 'newsCategories.categoryDetail.id':
        return 'Category ID';
      case 'newsCategories.categoryDetail.name':
        return 'Category Name';
      case 'newsCategories.education.title':
        return 'How this works';
      case 'newsCategories.education.description':
        return 'Browse news categories available for different domains and languages from BPS statistical data.';
      case 'newsCategories.education.parameters':
        return 'Parameters';
      case 'newsCategories.education.parametersDescription':
        return 'Configure domain and language settings';
      case 'newsCategories.education.results':
        return 'Results';
      case 'newsCategories.education.resultsDescription':
        return 'View news categories available for the domain';
      case 'newsCategories.education.categories':
        return 'Categories';
      case 'newsCategories.education.categoriesDescription':
        return 'Browse different news category classifications';
      case 'dynamicTables.title':
        return 'Dynamic Tables';
      case 'dynamicTables.parameters.title':
        return 'API Parameters';
      case 'dynamicTables.parameters.domain':
        return 'Domain';
      case 'dynamicTables.parameters.domainHint':
        return 'e.g., 7200 for national level';
      case 'dynamicTables.parameters.variable':
        return 'Variable';
      case 'dynamicTables.parameters.variableHint':
        return 'Select a statistical variable';
      case 'dynamicTables.parameters.selectYear':
        return 'Select Year';
      case 'dynamicTables.parameters.language':
        return 'Language';
      case 'dynamicTables.parameters.languageNote':
        return 'Applied to dynamic table content language';
      case 'dynamicTables.parameters.loadPeriods':
        return 'Load Available Periods';
      case 'dynamicTables.parameters.generateTable':
        return 'Generate Dynamic Table';
      case 'dynamicTables.parameters.loading':
        return 'Loading...';
      case 'dynamicTables.requestDetails.title':
        return 'Request Details';
      case 'dynamicTables.requestDetails.showDetails':
        return 'Show Request Details';
      case 'dynamicTables.requestDetails.hideDetails':
        return 'Hide Request Details';
      case 'dynamicTables.requestDetails.noRequest':
        return 'No request made yet';
      case 'dynamicTables.results.title':
        return 'Dynamic Table Results';
      case 'dynamicTables.results.periodsAvailable':
        return 'Available Periods';
      case 'dynamicTables.results.selectPeriod':
        return 'Select a period from above to generate table';
      case 'dynamicTables.results.tableGenerated':
        return 'Table generated successfully';
      case 'dynamicTables.results.empty':
        return 'No data available for selected criteria';
      case 'dynamicTables.results.initial':
        return 'Enter parameters above and click "Load Available Years" to get started';
      case 'dynamicTables.results.periodInitial':
        return 'Select a year from the dropdown above, then click "Load Dynamic Table" to view the data.';
      case 'dynamicTables.results.periodId':
        return 'Period ID';
      case 'dynamicTables.workflow.title':
        return 'Dynamic Table Workflow';
      case 'dynamicTables.workflow.description':
        return 'Follow these steps to generate a dynamic table from BPS data.';
      case 'dynamicTables.workflow.step1':
        return 'Step 1';
      case 'dynamicTables.workflow.step1Description':
        return 'Select domain and language, then choose a variable';
      case 'dynamicTables.workflow.step2':
        return 'Step 2';
      case 'dynamicTables.workflow.step2Description':
        return 'Load available periods for the selected variable';
      case 'dynamicTables.workflow.step3':
        return 'Step 3';
      case 'dynamicTables.workflow.step3Description':
        return 'Select a year/period and generate the table';
      case 'dynamicTables.states.initializing':
        return 'Initializing...';
      case 'dynamicTables.states.unknown':
        return 'Unknown state';
      case 'pressReleases.title':
        return 'Press Releases';
      case 'pressReleases.comingSoon':
        return 'Press Releases Page - Coming Soon';
      case 'pressReleases.detail.title':
        return 'Press Release Detail';
      case 'pressReleases.detail.forId':
        return 'Press Release Detail for ID: {id}';
      case 'staticTables.title':
        return 'Static Tables';
      case 'staticTables.comingSoon':
        return 'Static Tables Page - Coming Soon';
      case 'staticTables.detail.title':
        return 'Static Table Detail';
      case 'staticTables.detail.forId':
        return 'Static Table Detail for ID: {id}';
      case 'strategicIndicators.title':
        return 'Strategic Indicators';
      case 'strategicIndicators.comingSoon':
        return 'Strategic Indicators Page - Coming Soon';
      case 'subjects.title':
        return 'Subjects';
      case 'subjects.comingSoon':
        return 'Subjects Page - Coming Soon';
      case 'units.title':
        return 'Units';
      case 'units.comingSoon':
        return 'Units Page - Coming Soon';
      case 'variables.title':
        return 'Variables';
      case 'variables.comingSoon':
        return 'Variables Page - Coming Soon';
      case 'shared.pagination.previous':
        return 'Previous';
      case 'shared.pagination.next':
        return 'Next';
      case 'shared.pagination.loadMore':
        return 'Load More';
      case 'shared.pagination.page':
        return 'Page';
      case 'shared.pagination.previousPage':
        return 'Previous page';
      case 'shared.pagination.nextPage':
        return 'Next page';
      case 'shared.pagination.previousPageTooltip':
        return 'Previous page';
      case 'shared.pagination.nextPageTooltip':
        return 'Next page';
      case 'shared.codeSnippet.copyToClipboard':
        return 'Copy to clipboard';
      case 'shared.codeSnippet.codeCopied':
        return 'Code copied to clipboard';
      case 'shared.errorWidget.tryAgain':
        return 'Try Again';
      case 'shared.searchableDropdown.noItemsFound':
        return 'No items found';
      case 'shared.searchableDropdown.selectItem':
        return 'Select an item';
      case 'shared.requestDetails.title':
        return 'Request Details';
      case 'shared.requestDetails.method':
        return 'Method';
      case 'shared.requestDetails.url':
        return 'URL';
      case 'shared.requestDetails.parameters':
        return 'Parameters';
      case 'shared.requestDetails.urlCopied':
        return 'URL copied to clipboard';
      case 'shared.requestDetails.parametersCopied':
        return 'Parameters copied to clipboard';
      case 'validation.domainRequired':
        return 'Domain is required';
      case 'categories.imageNotAvailable':
        return 'Image not available';
      case 'categories.categoryId':
        return 'Category ID';
      case 'categories.releaseDate':
        return 'Release Date';
      case 'categories.imageUrl':
        return 'Image URL';
      case 'categories.tapToReadMore':
        return 'Tap to read more';
      case 'instructions.requestDetailsWillShow':
        return 'Request details will be shown in the results page';
      case 'instructions.onlyHandlesParameters':
        return 'This page only handles parameter configuration. Click "Search Domains" to see request details in the results page.';
      case 'instructions.languageLabels.indonesian':
        return 'Indonesian';
      case 'instructions.languageLabels.english':
        return 'English';
      case 'settings.title':
        return 'Settings';
      case 'settings.language':
        return 'Language';
      case 'settings.theme':
        return 'Theme';
      case 'settings.darkMode':
        return 'Dark Mode';
      case 'settings.about':
        return 'About';
      default:
        return null;
    }
  }
}
