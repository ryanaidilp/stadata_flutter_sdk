import 'package:get/get.dart';

import '../controllers/census_events_controller.dart';

class CensusEventsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CensusEventsController>(() => CensusEventsController());
  }
}
