import 'package:get/get.dart';

import '../controllers/static_table_detail_controller.dart';

class StaticTableDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StaticTableDetailController>(
      () => StaticTableDetailController(),
    );
  }
}
