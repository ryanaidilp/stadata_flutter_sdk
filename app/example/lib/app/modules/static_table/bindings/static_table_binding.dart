import 'package:get/get.dart';

import '../controllers/static_table_controller.dart';

class StaticTableBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StaticTableController>(
      () => StaticTableController(),
    );
  }
}
