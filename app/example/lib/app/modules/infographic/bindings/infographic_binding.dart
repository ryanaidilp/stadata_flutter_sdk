import 'package:get/get.dart';

import '../controllers/infographic_controller.dart';

class InfographicBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InfographicController>(
      () => InfographicController(),
    );
  }
}
