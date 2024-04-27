import 'package:get/get.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class PublicationDetailController extends GetxController
    with StateMixin<Publication> {
  final id = ''.obs;
  final domain = ''.obs;
  final lang = Rx(DataLanguage.id);

  @override
  void onInit() {
    id.value = Get.arguments['id'];
    domain.value = Get.arguments['domain'];
    lang.value = Get.arguments['lang'];
    loadPublication();
    super.onInit();
  }

  Future loadPublication() async {
    try {
      change(null, status: RxStatus.loading());
      final result = await StadataFlutter.instance.view.publication(
        id: id.value,
        domain: domain.value,
        lang: lang.value,
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
