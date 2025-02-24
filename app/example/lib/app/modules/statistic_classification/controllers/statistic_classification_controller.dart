import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class StatisticClassificationController extends GetxController
    with StateMixin<ListResult<StatisticClassification>> {
  final selectedLang = Rx(DataLanguage.id);
  final selectedType = Rx<ClassificationType>(KBLIType.y2020);
  final selectedLevel = Rxn<ClassificationLevel>(null);
  final currentPage = Rx(1);
  final perPage = Rx(10);
  final totalPages = Rx(1);

  @override
  void onInit() {
    super.onInit();
    selectedLang.value =
        Get.locale == const Locale('id', 'ID')
            ? DataLanguage.id
            : DataLanguage.en;
    loadStatisticClassifications();
  }

  void updateLocale() {
    if (selectedLang.value == DataLanguage.id) {
      Get.updateLocale(const Locale('id', 'ID'));
    } else {
      Get.updateLocale(const Locale('en', 'US'));
    }
    loadStatisticClassifications();
  }

  Future loadStatisticClassifications() async {
    try {
      change(null, status: RxStatus.loading());
      final result = await StadataFlutter.instance.list
          .statisticClassifications(
            type: selectedType.value,
            lang: selectedLang.value,
            page: currentPage.value,
            level: selectedLevel.value,
            perPage: perPage.value,
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
