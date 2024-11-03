import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class NewsController extends GetxController with StateMixin<ListResult<News>> {
  final selectedLang = Rx(DataLanguage.id);
  final domain = Rx<String>('0000');
  final keyword = Rxn<String>();
  final currentPage = Rx<int>(1);
  final totalPages = Rx<int>(1);
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
        page: currentPage.value,
        year: date.value?.year,
        month: date.value?.month,
        newsCategoryID: newsCategory.value?.id,
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
