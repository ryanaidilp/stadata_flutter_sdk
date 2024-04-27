import 'package:get/get.dart';

import '../controllers/news_detail_controller.dart';

class NewsDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewsDetailController>(
      () => NewsDetailController(),
    );
  }
}
