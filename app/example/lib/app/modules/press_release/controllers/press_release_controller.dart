import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class PressReleaseController extends GetxController
    with StateMixin<ListResult<PressRelease>> {
  final selectedLang = Rx(DataLanguage.id);
  final domain = '0000'.obs;
  final currentPage = 1.obs;
  final totalPages = 1.obs;
  final keyword = Rxn<String>();
  final date = Rxn<DateTime>();
  late final TextEditingController dateCtl;

  @override
  void onInit() {
    dateCtl = TextEditingController();
    loadPressReleases();
    super.onInit();
  }

  Future loadPressReleases() async {
    try {
      change(null, status: RxStatus.loading());
      final result = await StadataFlutter.instance.list.pressReleases(
        domain: domain.value,
        lang: selectedLang.value,
        keyword: keyword.value,
        page: currentPage.value,
        year: date.value?.year,
        month: date.value?.month,
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

  @override
  void onClose() {
    dateCtl.dispose();
    super.onClose();
  }
}
