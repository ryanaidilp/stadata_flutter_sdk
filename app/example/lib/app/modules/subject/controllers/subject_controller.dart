import 'package:get/get.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class SubjectController extends GetxController
    with StateMixin<ListResult<Subject>> {
  final domain = '0000'.obs;
  final currentPage = 1.obs;
  final totalPages = 1.obs;
  final selectedLang = Rx(DataLanguage.id);
  final selectedSubjectCategory = Rxn<SubjectCategory>(null);

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
        page: currentPage.value,
        subjectCategoryID: selectedSubjectCategory.value?.id,
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
