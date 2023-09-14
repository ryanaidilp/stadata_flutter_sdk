import 'package:get/get.dart';

import '../modules/domain/bindings/domain_binding.dart';
import '../modules/domain/views/domain_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/infographic/bindings/infographic_binding.dart';
import '../modules/infographic/views/infographic_view.dart';
import '../modules/publication/bindings/publication_binding.dart';
import '../modules/publication/views/publication_view.dart';
import '../modules/publication_detail/bindings/publication_detail_binding.dart';
import '../modules/publication_detail/views/publication_detail_view.dart';

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
  ];
}
