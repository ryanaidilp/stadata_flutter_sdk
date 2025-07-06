import 'package:get/get.dart';

import '../controllers/census_data_controller.dart';

class CensusDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CensusDataController>(() => CensusDataController());
  }
}
