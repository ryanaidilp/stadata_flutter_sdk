import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
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
import 'package:stadata_example/features/publications/presentation/pages/publications_page.dart';
import 'package:stadata_example/features/publications/presentation/pages/publications_parameters_page.dart';
import 'package:stadata_example/features/publications/presentation/pages/publications_results_page.dart';
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

    // Dynamic Tables routes - temporarily disabled
    // AutoRoute(page: DynamicTablesRoute.page, path: '/dynamic-tables'),
    // AutoRoute(
    //   page: DynamicTablesResultsRoute.page,
    //   path: '/dynamic-tables/results',
    // ),
  ];
}
