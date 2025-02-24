import 'package:get/get.dart';

import '../controllers/subject_category_controller.dart';

class SubjectCategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SubjectCategoryController>(() => SubjectCategoryController());
  }
}
