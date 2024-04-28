import 'package:get/get.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class SubjectCategoryController extends GetxController
    with StateMixin<ListResult<SubjectCategory>> {
  final domain = '0000'.obs;
  final page = '1'.obs;
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
        page: int.parse(page.value),
      );
      if (result.data.isEmpty) {
        change(null, status: RxStatus.empty());
      } else {
        change(result, status: RxStatus.success());
      }
    } catch (e) {
      change(
        null,
        status: RxStatus.error(
          e.toString(),
        ),
      );
    }
  }
}
