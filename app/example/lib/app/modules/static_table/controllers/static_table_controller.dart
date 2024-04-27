import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class StaticTableController extends GetxController
    with StateMixin<ListResult<StaticTable>> {
  final selectedLang = Rx(DataLanguage.id);
  final domain = Rx<String>('0000');
  final keyword = Rxn<String>();
  final page = Rx<String>('1');
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
        page: int.parse(page.value),
        year: date.value?.year,
        month: date.value?.month,
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

  @override
  void onClose() {
    dateCtl.dispose();
    super.onClose();
  }
}
