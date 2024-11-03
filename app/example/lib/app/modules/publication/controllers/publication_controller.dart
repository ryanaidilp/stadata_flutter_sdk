import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class PublicationController extends GetxController
    with StateMixin<ListResult<Publication>> {
  final selectedLang = Rx(DataLanguage.id);
  final domain = Rx<String>('0000');
  final keyword = Rxn<String>();
  final currentPage = 1.obs;
  final totalPages = 1.obs;
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
}
