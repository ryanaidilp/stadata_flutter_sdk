import 'package:get/get.dart';

import '../controllers/publication_controller.dart';

class PublicationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PublicationController>(
      () => PublicationController(),
    );
  }
}
