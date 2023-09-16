import 'package:get/get.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class NewsCategoryController extends GetxController
    with StateMixin<ListResult<NewsCategory>> {
  final domain = Rx('7200');
  final selectedLang = Rx<DataLanguage>(DataLanguage.id);

  @override
  void onInit() {
    loadNewsCategories();
    super.onInit();
  }

  Future loadNewsCategories() async {
    try {
      change(null, status: RxStatus.loading());
      final result = await StadataFlutter.instance.list.newsCategories(
        domain: domain.value,
        lang: selectedLang.value,
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
}
