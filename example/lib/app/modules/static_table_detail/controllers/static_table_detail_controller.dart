import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class StaticTableDetailController extends GetxController
    with StateMixin<StaticTable> {
  final id = ''.obs;
  final domain = ''.obs;
  final lang = Rx(DataLanguage.id);

  final ScrollController horizontalCtl = ScrollController();
  final ScrollController verticalCtl = ScrollController();

  @override
  void onInit() {
    id.value = Get.arguments['id'];
    domain.value = Get.arguments['domain'];
    lang.value = Get.arguments['lang'];
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    log('Change orientation');
    loadStaticTable();
    super.onInit();
  }

  Future loadStaticTable() async {
    try {
      change(null, status: RxStatus.loading());
      final result = await StadataFlutter.instance.view.staticTable(
        id: int.parse(id.value),
        domain: domain.value,
        lang: lang.value,
      );
      if (result == null) {
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
    horizontalCtl.dispose();
    verticalCtl.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.onClose();
  }
}
