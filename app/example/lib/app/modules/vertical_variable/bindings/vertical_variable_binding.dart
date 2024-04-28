import 'package:get/get.dart';

import '../controllers/vertical_variable_controller.dart';

class VerticalVariableBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerticalVariableController>(
      () => VerticalVariableController(),
    );
  }
}
