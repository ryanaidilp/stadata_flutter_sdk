import 'package:get/get.dart';

import '../modules/census_topic/bindings/census_topic_binding.dart';
import '../modules/census_topic/views/census_topic_view.dart';
import '../modules/censuses/bindings/censuses_binding.dart';
import '../modules/censuses/views/censuses_view.dart';
import '../modules/domain/bindings/domain_binding.dart';
import '../modules/domain/views/domain_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/infographic/bindings/infographic_binding.dart';
import '../modules/infographic/views/infographic_view.dart';
import '../modules/news/bindings/news_binding.dart';
import '../modules/news/views/news_view.dart';
import '../modules/news_category/bindings/news_category_binding.dart';
import '../modules/news_category/views/news_category_view.dart';
import '../modules/news_detail/bindings/news_detail_binding.dart';
import '../modules/news_detail/views/news_detail_view.dart';
import '../modules/press_release/bindings/press_release_binding.dart';
import '../modules/press_release/views/press_release_view.dart';
import '../modules/press_release_detail/bindings/press_release_detail_binding.dart';
import '../modules/press_release_detail/views/press_release_detail_view.dart';
import '../modules/publication/bindings/publication_binding.dart';
import '../modules/publication/views/publication_view.dart';
import '../modules/publication_detail/bindings/publication_detail_binding.dart';
import '../modules/publication_detail/views/publication_detail_view.dart';
import '../modules/static_table/bindings/static_table_binding.dart';
import '../modules/static_table/views/static_table_view.dart';
import '../modules/static_table_detail/bindings/static_table_detail_binding.dart';
import '../modules/static_table_detail/views/static_table_detail_view.dart';
import '../modules/statistic_classification/bindings/statistic_classification_binding.dart';
import '../modules/statistic_classification/views/statistic_classification_view.dart';
import '../modules/strategic_indicator/bindings/strategic_indicator_binding.dart';
import '../modules/strategic_indicator/views/strategic_indicator_view.dart';
import '../modules/subject/bindings/subject_binding.dart';
import '../modules/subject/views/subject_view.dart';
import '../modules/subject_category/bindings/subject_category_binding.dart';
import '../modules/subject_category/views/subject_category_view.dart';
import '../modules/unit/bindings/unit_binding.dart';
import '../modules/unit/views/unit_view.dart';
import '../modules/variable/bindings/variable_binding.dart';
import '../modules/variable/views/variable_view.dart';
import '../modules/vertical_variable/bindings/vertical_variable_binding.dart';
import '../modules/vertical_variable/views/vertical_variable_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DOMAIN,
      page: () => const DomainView(),
      binding: DomainBinding(),
    ),
    GetPage(
      name: _Paths.PUBLICATION,
      page: () => const PublicationView(),
      binding: PublicationBinding(),
    ),
    GetPage(
      name: _Paths.PUBLICATION_DETAIL,
      page: () => const PublicationDetailView(),
      binding: PublicationDetailBinding(),
    ),
    GetPage(
      name: _Paths.INFOGRAPHIC,
      page: () => const InfographicView(),
      binding: InfographicBinding(),
    ),
    GetPage(
      name: _Paths.STATIC_TABLE,
      page: () => const StaticTableView(),
      binding: StaticTableBinding(),
    ),
    GetPage(
      name: _Paths.STATIC_TABLE_DETAIL,
      page: () => const StaticTableDetailView(),
      binding: StaticTableDetailBinding(),
    ),
    GetPage(
      name: _Paths.NEWS,
      page: () => const NewsView(),
      binding: NewsBinding(),
    ),
    GetPage(
      name: _Paths.NEWS_DETAIL,
      page: () => const NewsDetailView(),
      binding: NewsDetailBinding(),
    ),
    GetPage(
      name: _Paths.NEWS_CATEGORY,
      page: () => const NewsCategoryView(),
      binding: NewsCategoryBinding(),
    ),
    GetPage(
      name: _Paths.SUBJECT_CATEGORY,
      page: () => const SubjectCategoryView(),
      binding: SubjectCategoryBinding(),
    ),
    GetPage(
      name: _Paths.SUBJECT,
      page: () => const SubjectView(),
      binding: SubjectBinding(),
    ),
    GetPage(
      name: _Paths.PRESS_RELEASE,
      page: () => const PressReleaseView(),
      binding: PressReleaseBinding(),
    ),
    GetPage(
      name: _Paths.PRESS_RELEASE_DETAIL,
      page: () => const PressReleaseDetailView(),
      binding: PressReleaseDetailBinding(),
    ),
    GetPage(
      name: _Paths.STRATEGIC_INDICATOR,
      page: () => const StrategicIndicatorView(),
      binding: StrategicIndicatorBinding(),
    ),
    GetPage(
      name: _Paths.VARIABLE,
      page: () => const VariableView(),
      binding: VariableBinding(),
    ),
    GetPage(
      name: _Paths.VERTICAL_VARIABLE,
      page: () => const VerticalVariableView(),
      binding: VerticalVariableBinding(),
    ),
    GetPage(
      name: _Paths.UNIT,
      page: () => const UnitView(),
      binding: UnitBinding(),
    ),
    GetPage(
      name: _Paths.STATISTIC_CLASSIFICATION,
      page: () => const StatisticClassificationView(),
      binding: StatisticClassificationBinding(),
    ),
    GetPage(
      name: _Paths.CENSUSES,
      page: () => const CensusesView(),
      binding: CensusesBinding(),
    ),
    GetPage(
      name: _Paths.CENSUS_TOPIC,
      page: () => const CensusTopicView(),
      binding: CensusTopicBinding(),
    ),
  ];
}
