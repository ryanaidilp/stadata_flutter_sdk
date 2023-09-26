import 'package:get/get.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class InfographicController extends GetxController
    with StateMixin<ListResult<Infographic>> {
  final domain = Rx('0000');
  final page = Rx('1');
  final keyword = Rxn<String>();
  final selectedLang = Rx(DataLanguage.id);

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
        page: int.parse(page.value),
        keyword: keyword.value,
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
