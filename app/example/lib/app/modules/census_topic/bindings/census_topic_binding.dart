import 'package:get/get.dart';

import '../controllers/census_topic_controller.dart';

class CensusTopicBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CensusTopicController>(() => CensusTopicController());
  }
}
