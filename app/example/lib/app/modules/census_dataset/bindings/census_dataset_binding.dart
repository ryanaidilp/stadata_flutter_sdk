import 'package:get/get.dart';

import '../controllers/census_dataset_controller.dart';

class CensusDatasetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CensusDatasetController>(() => CensusDatasetController());
  }
}
