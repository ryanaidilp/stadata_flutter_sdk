import 'package:get/get.dart';

import '../controllers/variable_controller.dart';

class VariableBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VariableController>(
      () => VariableController(),
    );
  }
}
