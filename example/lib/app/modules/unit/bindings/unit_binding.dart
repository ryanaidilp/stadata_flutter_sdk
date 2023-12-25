import 'package:get/get.dart';

import '../controllers/unit_controller.dart';

class UnitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UnitController>(
      () => UnitController(),
    );
  }
}
