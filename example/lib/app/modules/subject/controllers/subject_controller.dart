import 'package:get/get.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class SubjectController extends GetxController
    with StateMixin<ListResult<Subject>> {
  final domain = '0000'.obs;
  final page = '1'.obs;
  final selectedLang = Rx(DataLanguage.id);
  final selectedSubjectCategory = Rxn<SubjectCategory>();

  final isCategoryLoading = false.obs;
  final isCategoryError = false.obs;
  final categories = List<SubjectCategory>.empty(growable: true).obs;

  @override
  void onInit() {
    loadSubjectCategories();
    loadSubjects();
    super.onInit();
  }

  Future loadSubjects() async {
    try {
      change(null, status: RxStatus.loading());
      final result = await StadataFlutter.instance.list.subjects(
        domain: domain.value,
        lang: selectedLang.value,
        page: int.parse(page.value),
        subjectCategoryId: int.parse(
          selectedSubjectCategory.value?.id.toString() ?? '0',
        ),
      );

      if (result.data.isEmpty) {
        change(null, status: RxStatus.empty());
      } else {
        change(result, status: RxStatus.success());
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  Future loadSubjectCategories() async {
    try {
      isCategoryError.value = false;
      isCategoryLoading.value = true;
      final result = await StadataFlutter.instance.list.subjectCategories(
        domain: domain.value,
        lang: selectedLang.value,
      );

      if (result.data.isNotEmpty) {
        categories.value = result.data;
      }
    } catch (e) {
      isCategoryError.value = true;
    } finally {
      isCategoryLoading.value = false;
    }
  }
}
