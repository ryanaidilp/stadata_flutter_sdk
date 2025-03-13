import 'package:get/get.dart';

import '../controllers/censuses_controller.dart';

class CensusesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CensusesController>(() => CensusesController());
  }
}
