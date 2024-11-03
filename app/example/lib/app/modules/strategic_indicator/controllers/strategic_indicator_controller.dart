import 'package:get/get.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class StrategicIndicatorController extends GetxController
    with StateMixin<ListResult<StrategicIndicator>> {
  final selectedLang = Rx(DataLanguage.id);
  final domain = RxString('00');
  final variableID = RxString('0');
  final currentPage = 1.obs;
  final totalPages = 1.obs;

  @override
  void onInit() {
    loadStrategicIndicators();
    super.onInit();
  }

  Future loadStrategicIndicators() async {
    try {
      change(null, status: RxStatus.loading());
      final result = await StadataFlutter.instance.list.strategicIndicators(
        domain: '${domain.value}00',
        lang: selectedLang.value,
        variableID: int.tryParse(variableID.value),
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
