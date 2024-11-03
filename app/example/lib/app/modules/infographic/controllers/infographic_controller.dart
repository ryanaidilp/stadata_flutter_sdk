import 'package:get/get.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class InfographicController extends GetxController
    with StateMixin<ListResult<Infographic>> {
  final domain = Rx('0000');
  final keyword = Rxn<String>();
  final selectedLang = Rx(DataLanguage.id);
  final currentPage = Rx(1);
  final totalPages = Rx(1);

  @override
  void onInit() {
    loadInfographics();
    super.onInit();
  }

  Future loadInfographics() async {
    try {
      change(null, status: RxStatus.loading());
      final result = await StadataFlutter.instance.list.infographics(
        domain: domain.value,
        page: currentPage.value,
        keyword: keyword.value,
        lang: selectedLang.value,
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
