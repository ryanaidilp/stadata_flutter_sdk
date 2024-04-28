import 'package:get/get.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class PressReleaseDetailController extends GetxController
    with StateMixin<PressRelease> {
  final id = '0'.obs;
  final domain = '0000'.obs;
  final lang = Rx(DataLanguage.id);

  @override
  void onInit() {
    id.value = Get.arguments['id'];
    domain.value = Get.arguments['domain'];
    lang.value = Get.arguments['lang'];
    loadPressReleaseDetail();
    super.onInit();
  }

  Future loadPressReleaseDetail() async {
    try {
      change(null, status: RxStatus.loading());
      final result = await StadataFlutter.instance.view.pressRelease(
        lang: lang.value,
        id: int.parse(id.value),
        domain: domain.value,
      );

      if (result == null) {
        change(null, status: RxStatus.empty());
      } else {
        change(result, status: RxStatus.success());
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
