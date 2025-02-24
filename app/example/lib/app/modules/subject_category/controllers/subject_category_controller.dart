import 'package:get/get.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class SubjectCategoryController extends GetxController
    with StateMixin<ListResult<SubjectCategory>> {
  final domain = '0000'.obs;
  final currentPage = 1.obs;
  final totalPages = 1.obs;
  final selectedLang = Rx(DataLanguage.id);

  @override
  void onInit() {
    loadSubjectCategories();
    super.onInit();
  }

  Future loadSubjectCategories() async {
    try {
      change(null, status: RxStatus.loading());
      final result = await StadataFlutter.instance.list.subjectCategories(
        domain: domain.value,
        lang: selectedLang.value,
        page: currentPage.value,
      );
      if (result.data.isEmpty) {
        change(null, status: RxStatus.empty());
      } else {
        currentPage.value = result.pagination?.page ?? 1;
        totalPages.value = result.pagination?.pages ?? 1;
        change(result, status: RxStatus.success());
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
