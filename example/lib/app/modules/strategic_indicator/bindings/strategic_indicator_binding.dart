import 'package:get/get.dart';

import '../controllers/strategic_indicator_controller.dart';

class StrategicIndicatorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StrategicIndicatorController>(
      () => StrategicIndicatorController(),
    );
  }
}
