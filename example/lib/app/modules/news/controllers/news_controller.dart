import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class NewsController extends GetxController with StateMixin<ListResult<News>> {
  final selectedLang = Rx(DataLanguage.id);
  final domain = Rx<String>('0000');
  final keyword = Rxn<String>();
  final page = Rx<String>('1');
  final date = Rxn<DateTime>();
  final isNewsCategoryError = false.obs;
  final isNewsCategoryLoading = false.obs;
  final newsCategory = Rxn<NewsCategory>();
  final newsCategories = List<NewsCategory>.empty(growable: true).obs;
  late final TextEditingController dateCtl;

  @override
  void onInit() {
    dateCtl = TextEditingController();
    loadNewsCategories();
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
        newsCategoryId: newsCategory.value?.id,
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

  Future loadNewsCategories() async {
    try {
      isNewsCategoryError.value = false;
      isNewsCategoryLoading.value = true;
      final result = await StadataFlutter.instance.list.newsCategories(
        domain: domain.value,
        lang: selectedLang.value,
      );
      newsCategories.value = result.data;
    } catch (e) {
      isNewsCategoryError.value = true;
    } finally {
      isNewsCategoryLoading.value = false;
    }
  }

  @override
  void onClose() {
    dateCtl.dispose();
    super.onClose();
  }
}
