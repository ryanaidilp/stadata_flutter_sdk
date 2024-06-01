import 'package:get/get.dart';

import '../controllers/statistic_classification_controller.dart';

class StatisticClassificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StatisticClassificationController>(
      () => StatisticClassificationController(),
    );
  }
}
