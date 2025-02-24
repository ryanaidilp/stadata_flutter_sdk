import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class VariableController extends GetxController
    with StateMixin<ListResult<Variable>> {
  final domain = '0000'.obs;
  final selectedLang = Rx(DataLanguage.id);
  final year = Rxn<String>();
  final showExistingVariables = RxBool(false);
  final subjectID = Rxn<String>();
  final currentPage = Rx(1);
  final totalPages = Rx(1);

  @override
  void onInit() {
    super.onInit();
    selectedLang.value =
        Get.locale == const Locale('id', 'ID')
            ? DataLanguage.id
            : DataLanguage.en;
    loadVariables();
  }

  void updateLocale() {
    if (selectedLang.value == DataLanguage.id) {
      Get.updateLocale(const Locale('id', 'ID'));
    } else {
      Get.updateLocale(const Locale('en', 'US'));
    }
    loadVariables();
  }

  Future loadVariables() async {
    try {
      change(null, status: RxStatus.loading());
      var domainValue = domain.value;

      if (domainValue.length < 4) {
        domainValue = '${domainValue}00';
      }

      final result = await StadataFlutter.instance.list.variables(
        domain: domainValue,
        lang: selectedLang.value,
        page: currentPage.value,
        year: int.tryParse(year.value ?? ''),
        subjectID: int.tryParse(subjectID.value ?? ''),
        showExistingVariables: showExistingVariables.value,
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
