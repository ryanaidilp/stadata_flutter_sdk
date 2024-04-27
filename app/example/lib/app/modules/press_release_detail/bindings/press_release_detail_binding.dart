import 'package:get/get.dart';

import '../controllers/press_release_detail_controller.dart';

class PressReleaseDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PressReleaseDetailController>(
      () => PressReleaseDetailController(),
    );
  }
}
