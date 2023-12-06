import 'package:get/get.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class StrategicIndicatorController extends GetxController
    with StateMixin<ListResult<StrategicIndicator>> {
  final selectedLang = Rx(DataLanguage.id);
  final domain = RxString('00');
  final variableID = RxString('0');
  final page = RxString('1');

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
        page: int.tryParse(page.value) ?? 1,
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
