import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class StaticTableController extends GetxController
    with StateMixin<ListResult<StaticTable>> {
  final selectedLang = Rx(DataLanguage.id);
  final domain = Rx<String>('0000');
  final keyword = Rxn<String>();
  final currentPage = 1.obs;
  final totalPages = 1.obs;
  final date = Rxn<DateTime>();
  final TextEditingController dateCtl = TextEditingController();

  @override
  void onInit() {
    loadStaticTables();
    super.onInit();
  }

  Future loadStaticTables() async {
    try {
      change(null, status: RxStatus.loading());
      final result = await StadataFlutter.instance.list.staticTables(
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
