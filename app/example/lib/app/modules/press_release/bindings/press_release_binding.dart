import 'package:get/get.dart';

import '../controllers/press_release_controller.dart';

class PressReleaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PressReleaseController>(() => PressReleaseController());
  }
}
