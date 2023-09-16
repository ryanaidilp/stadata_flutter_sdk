import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class NewsController extends GetxController with StateMixin<ListResult<News>> {
  final selectedLang = Rx(DataLanguage.id);
  final domain = Rx<String>('7200');
  final keyword = Rxn<String>();
  final page = Rx<String>('1');
  final date = Rxn<DateTime>();
  late final TextEditingController dateCtl;

  @override
  void onInit() {
    dateCtl = TextEditingController();
    loadNews();
    super.onInit();
  }

  Future loadNews() async {
    try {
      change(null, status: RxStatus.loading());
      final result = await StadataFlutter.instance.list.news(
        domain: domain.value,
        lang: selectedLang.value,
        keyword: keyword.value,
        page: int.parse(page.value),
        year: date.value != null ? date.value!.year : null,
        month: date.value != null ? date.value!.month : null,
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
