import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:stadata_example/features/census_areas/presentation/pages/census_areas_parameters_page.dart';
import 'package:stadata_example/features/census_areas/presentation/pages/census_areas_results_page.dart';
import 'package:stadata_example/features/census_data/presentation/pages/census_data_parameters_page.dart';
import 'package:stadata_example/features/census_data/presentation/pages/census_data_results_page.dart';
import 'package:stadata_example/features/census_datasets/presentation/pages/census_datasets_parameters_page.dart';
import 'package:stadata_example/features/census_datasets/presentation/pages/census_datasets_results_page.dart';
import 'package:stadata_example/features/census_events/presentation/pages/census_events_page.dart';
import 'package:stadata_example/features/census_topics/presentation/pages/census_topics_parameters_page.dart';
import 'package:stadata_example/features/census_topics/presentation/pages/census_topics_results_page.dart';
import 'package:stadata_example/features/derived_periods/presentation/pages/derived_periods_page.dart';
import 'package:stadata_example/features/derived_periods/presentation/pages/derived_periods_parameters_page.dart';
import 'package:stadata_example/features/derived_periods/presentation/pages/derived_periods_results_page.dart';
import 'package:stadata_example/features/derived_variables/presentation/pages/derived_variables_page.dart';
import 'package:stadata_example/features/derived_variables/presentation/pages/derived_variables_parameters_page.dart';
import 'package:stadata_example/features/derived_variables/presentation/pages/derived_variables_results_page.dart';
import 'package:stadata_example/features/domains/presentation/pages/domains_page.dart';
import 'package:stadata_example/features/domains/presentation/pages/domains_results_page.dart';
// Dynamic tables feature temporarily disabled due to missing SDK implementation
// import 'package:stadata_example/features/dynamic_tables/presentation/pages/dynamic_tables_page.dart';
// import 'package:stadata_example/features/dynamic_tables/presentation/pages/dynamic_tables_results_page.dart';
import 'package:stadata_example/features/home/presentation/pages/home_page.dart';
import 'package:stadata_example/features/infographics/presentation/pages/infographics_page.dart';
import 'package:stadata_example/features/infographics/presentation/pages/infographics_results_page.dart';
import 'package:stadata_example/features/news/presentation/pages/news_detail_page.dart';
import 'package:stadata_example/features/news/presentation/pages/news_page.dart';
import 'package:stadata_example/features/news/presentation/pages/news_results_page.dart';
import 'package:stadata_example/features/news_categories/presentation/pages/news_categories_page.dart';
import 'package:stadata_example/features/news_categories/presentation/pages/news_categories_results_page.dart';
import 'package:stadata_example/features/periods/presentation/pages/periods_page.dart';
import 'package:stadata_example/features/periods/presentation/pages/periods_parameters_page.dart';
import 'package:stadata_example/features/periods/presentation/pages/periods_results_page.dart';
import 'package:stadata_example/features/press_releases/presentation/pages/press_releases_page.dart';
import 'package:stadata_example/features/press_releases/presentation/pages/press_releases_parameters_page.dart';
import 'package:stadata_example/features/press_releases/presentation/pages/press_releases_results_page.dart';
import 'package:stadata_example/features/publications/presentation/pages/publications_page.dart';
import 'package:stadata_example/features/publications/presentation/pages/publications_parameters_page.dart';
import 'package:stadata_example/features/publications/presentation/pages/publications_results_page.dart';
import 'package:stadata_example/features/static_tables/presentation/pages/static_table_detail_page.dart';
import 'package:stadata_example/features/static_tables/presentation/pages/static_tables_page.dart';
import 'package:stadata_example/features/static_tables/presentation/pages/static_tables_parameters_page.dart';
import 'package:stadata_example/features/static_tables/presentation/pages/static_tables_results_page.dart';
import 'package:stadata_example/features/statistical_classifications/presentation/pages/statistical_classification_detail_page.dart';
import 'package:stadata_example/features/statistical_classifications/presentation/pages/statistical_classifications_page.dart';
import 'package:stadata_example/features/statistical_classifications/presentation/pages/statistical_classifications_parameters_page.dart';
import 'package:stadata_example/features/statistical_classifications/presentation/pages/statistical_classifications_results_page.dart';
import 'package:stadata_example/features/strategic_indicators/presentation/pages/strategic_indicators_page.dart';
import 'package:stadata_example/features/strategic_indicators/presentation/pages/strategic_indicators_parameters_page.dart';
import 'package:stadata_example/features/strategic_indicators/presentation/pages/strategic_indicators_results_page.dart';
import 'package:stadata_example/features/subject_categories/presentation/pages/subject_categories_page.dart';
import 'package:stadata_example/features/subject_categories/presentation/pages/subject_categories_parameters_page.dart';
import 'package:stadata_example/features/subject_categories/presentation/pages/subject_categories_results_page.dart';
import 'package:stadata_example/features/subjects/presentation/pages/subjects_page.dart';
import 'package:stadata_example/features/subjects/presentation/pages/subjects_parameters_page.dart';
import 'package:stadata_example/features/subjects/presentation/pages/subjects_results_page.dart';
import 'package:stadata_example/features/units/presentation/pages/units_page.dart';
import 'package:stadata_example/features/units/presentation/pages/units_parameters_page.dart';
import 'package:stadata_example/features/units/presentation/pages/units_results_page.dart';
import 'package:stadata_example/features/variables/presentation/pages/variables_page.dart';
import 'package:stadata_example/features/variables/presentation/pages/variables_parameters_page.dart';
import 'package:stadata_example/features/variables/presentation/pages/variables_results_page.dart';
import 'package:stadata_example/features/vertical_variables/presentation/pages/vertical_variables_page.dart';
import 'package:stadata_example/features/vertical_variables/presentation/pages/vertical_variables_parameters_page.dart';
import 'package:stadata_example/features/vertical_variables/presentation/pages/vertical_variables_results_page.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

part 'app_router.gr.dart';

@LazySingleton()
@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    // Home route
    AutoRoute(page: HomeRoute.page, path: '/', initial: true),

    // Domain routes
    AutoRoute(page: DomainsRoute.page, path: '/domains'),
    AutoRoute(page: DomainsResultsRoute.page, path: '/domains/results'),

    // Infographics routes
    AutoRoute(page: InfographicsRoute.page, path: '/infographics'),
    AutoRoute(
      page: InfographicsResultsRoute.page,
      path: '/infographics/results',
    ),

    // News routes
    AutoRoute(page: NewsRoute.page, path: '/news'),
    AutoRoute(page: NewsResultsRoute.page, path: '/news/results'),
    AutoRoute(page: NewsDetailRoute.page, path: '/news/detail/:newsId'),

    // News Categories routes
    AutoRoute(page: NewsCategoriesRoute.page, path: '/news-categories'),
    AutoRoute(
      page: NewsCategoriesResultsRoute.page,
      path: '/news-categories/results',
    ),

    // Publications routes
    AutoRoute(page: PublicationsRoute.page, path: '/publications'),
    AutoRoute(
      page: PublicationsParametersRoute.page,
      path: '/publications/parameters',
    ),
    AutoRoute(
      page: PublicationsResultsRoute.page,
      path: '/publications/results',
    ),
    AutoRoute(
      page: PublicationDetailRoute.page,
      path: '/publications/detail/:id',
    ),

    // Press Releases routes
    AutoRoute(page: PressReleasesRoute.page, path: '/press-releases'),
    AutoRoute(
      page: PressReleasesParametersRoute.page,
      path: '/press-releases/parameters',
    ),
    AutoRoute(
      page: PressReleasesResultsRoute.page,
      path: '/press-releases/results',
    ),
    AutoRoute(
      page: PressReleaseDetailRoute.page,
      path: '/press-releases/detail/:pressReleaseId',
    ),

    // Static Tables routes
    AutoRoute(page: StaticTablesRoute.page, path: '/static-tables'),
    AutoRoute(
      page: StaticTablesParametersRoute.page,
      path: '/static-tables/parameters',
    ),
    AutoRoute(
      page: StaticTablesResultsRoute.page,
      path: '/static-tables/results',
    ),
    AutoRoute(
      page: StaticTableDetailRoute.page,
      path: '/static-tables/detail/:id',
    ),

    // Statistical Classifications routes
    AutoRoute(
      page: StatisticalClassificationsRoute.page,
      path: '/statistical-classifications',
    ),
    AutoRoute(
      page: StatisticalClassificationsParametersRoute.page,
      path: '/statistical-classifications/parameters',
    ),
    AutoRoute(
      page: StatisticalClassificationsResultsRoute.page,
      path: '/statistical-classifications/results',
    ),
    AutoRoute(
      page: StatisticalClassificationDetailRoute.page,
      path: '/statistical-classifications/detail',
    ),

    // Strategic Indicators routes
    AutoRoute(
      page: StrategicIndicatorsRoute.page,
      path: '/strategic-indicators',
    ),
    AutoRoute(
      page: StrategicIndicatorsParametersRoute.page,
      path: '/strategic-indicators/parameters',
    ),
    AutoRoute(
      page: StrategicIndicatorsResultsRoute.page,
      path: '/strategic-indicators/results',
    ),

    // Subject Categories routes
    AutoRoute(page: SubjectCategoriesRoute.page, path: '/subject-categories'),
    AutoRoute(
      page: SubjectCategoriesParametersRoute.page,
      path: '/subject-categories/parameters',
    ),
    AutoRoute(
      page: SubjectCategoriesResultsRoute.page,
      path: '/subject-categories/results',
    ),

    // Subjects routes
    AutoRoute(page: SubjectsRoute.page, path: '/subjects'),
    AutoRoute(page: SubjectsParametersRoute.page, path: '/subjects/parameters'),
    AutoRoute(page: SubjectsResultsRoute.page, path: '/subjects/results'),

    // Variables routes
    AutoRoute(page: VariablesRoute.page, path: '/variables'),
    AutoRoute(
      page: VariablesParametersRoute.page,
      path: '/variables/parameters',
    ),
    AutoRoute(page: VariablesResultsRoute.page, path: '/variables/results'),

    // Vertical Variables routes
    AutoRoute(page: VerticalVariablesRoute.page, path: '/vertical-variables'),
    AutoRoute(
      page: VerticalVariablesParametersRoute.page,
      path: '/vertical-variables/parameters',
    ),
    AutoRoute(
      page: VerticalVariablesResultsRoute.page,
      path: '/vertical-variables/results',
    ),

    // Units routes
    AutoRoute(page: UnitsRoute.page, path: '/units'),
    AutoRoute(page: UnitsParametersRoute.page, path: '/units/parameters'),
    AutoRoute(page: UnitsResultsRoute.page, path: '/units/results'),

    // Periods routes
    AutoRoute(page: PeriodsRoute.page, path: '/periods'),
    AutoRoute(page: PeriodsParametersRoute.page, path: '/periods/parameters'),
    AutoRoute(page: PeriodsResultsRoute.page, path: '/periods/results'),

    // Derived Periods routes
    AutoRoute(page: DerivedPeriodsRoute.page, path: '/derived-periods'),
    AutoRoute(
      page: DerivedPeriodsParametersRoute.page,
      path: '/derived-periods/parameters',
    ),
    AutoRoute(
      page: DerivedPeriodsResultsRoute.page,
      path: '/derived-periods/results',
    ),

    // Derived Variables routes
    AutoRoute(page: DerivedVariablesRoute.page, path: '/derived-variables'),
    AutoRoute(
      page: DerivedVariablesParametersRoute.page,
      path: '/derived-variables/parameters',
    ),
    AutoRoute(
      page: DerivedVariablesResultsRoute.page,
      path: '/derived-variables/results',
    ),

    // Census Events route
    AutoRoute(page: CensusEventsRoute.page, path: '/census-events'),

    // Census Topics routes
    AutoRoute(
      page: CensusTopicsParametersRoute.page,
      path: '/census-topics/parameters',
    ),
    AutoRoute(
      page: CensusTopicsResultsRoute.page,
      path: '/census-topics/results',
    ),

    // Census Datasets routes
    AutoRoute(
      page: CensusDatasetsParametersRoute.page,
      path: '/census-datasets/parameters',
    ),
    AutoRoute(
      page: CensusDatasetsResultsRoute.page,
      path: '/census-datasets/results',
    ),

    // Census Data routes
    AutoRoute(
      page: CensusDataParametersRoute.page,
      path: '/census-data/parameters',
    ),
    AutoRoute(page: CensusDataResultsRoute.page, path: '/census-data/results'),

    // Census Areas routes
    AutoRoute(
      page: CensusAreasParametersRoute.page,
      path: '/census-areas/parameters',
    ),
    AutoRoute(
      page: CensusAreasResultsRoute.page,
      path: '/census-areas/results',
    ),

    // Dynamic Tables routes - temporarily disabled
    // AutoRoute(page: DynamicTablesRoute.page, path: '/dynamic-tables'),
    // AutoRoute(
    //   page: DynamicTablesResultsRoute.page,
    //   path: '/dynamic-tables/results',
    // ),
  ];
}
