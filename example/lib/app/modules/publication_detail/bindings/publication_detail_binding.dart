import 'package:get/get.dart';

import '../controllers/publication_detail_controller.dart';

class PublicationDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PublicationDetailController>(
      () => PublicationDetailController(),
    );
  }
}
