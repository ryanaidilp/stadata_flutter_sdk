import 'package:get/get.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class DomainController extends GetxController
    with StateMixin<ListResult<DomainEntity>> {
  final selectedType = Rx(DomainType.all);
  final provinceCode = Rxn<String>(null);

  @override
  void onInit() {
    loadDomains();
    super.onInit();
  }

  Future loadDomains() async {
    try {
      change(null, status: RxStatus.loading());
      final result = await StadataFlutter.instance.list.domains(
        type: selectedType.value,
        provinceCode: provinceCode.value,
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
