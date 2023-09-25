import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class PublicationController extends GetxController
    with StateMixin<ListResult<Publication>> {
  final selectedLang = Rx(DataLanguage.id);
  final domain = Rx<String>('0000');
  final keyword = Rxn<String>();
  final page = Rx<String>('1');
  final date = Rxn<DateTime>();
  final TextEditingController dateCtl = TextEditingController();

  @override
  void onInit() {
    loadPublications();
    super.onInit();
  }

  @override
  void onClose() {
    dateCtl.dispose();
    super.onClose();
  }

  Future loadPublications() async {
    try {
      change(null, status: RxStatus.loading());
      final result = await StadataFlutter.instance.list.publications(
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
}
