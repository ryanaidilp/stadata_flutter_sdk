import 'package:get/get.dart';

import '../controllers/domain_controller.dart';

class DomainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DomainController>(
      () => DomainController(),
    );
  }
}
