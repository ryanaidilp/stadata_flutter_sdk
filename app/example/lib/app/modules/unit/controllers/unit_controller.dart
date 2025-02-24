import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class UnitController extends GetxController
    with StateMixin<ListResult<UnitData>> {
  final domain = '0000'.obs;
  final selectedLang = Rx(DataLanguage.id);
  final variableID = Rxn<String>();
  final currentPage = Rx(1);
  final totalPages = Rx(1);

  @override
  void onInit() {
    super.onInit();
    selectedLang.value =
        Get.locale == const Locale('id', 'ID')
            ? DataLanguage.id
            : DataLanguage.en;
    loadUnits();
  }

  void updateLocale() {
    if (selectedLang.value == DataLanguage.id) {
      Get.updateLocale(const Locale('id', 'ID'));
    } else {
      Get.updateLocale(const Locale('en', 'US'));
    }
    loadUnits();
  }

  Future loadUnits() async {
    try {
      change(null, status: RxStatus.loading());
      var domainValue = domain.value;

      if (domainValue.length < 4) {
        domainValue = '${domainValue}00';
      }

      final result = await StadataFlutter.instance.list.units(
        domain: domainValue,
        lang: selectedLang.value,
        page: currentPage.value,
        variableID: int.tryParse(variableID.value ?? ''),
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
