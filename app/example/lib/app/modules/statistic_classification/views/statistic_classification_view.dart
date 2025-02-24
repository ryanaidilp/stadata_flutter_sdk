import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stadata_example/generated/locales.g.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

import '../controllers/statistic_classification_controller.dart';

class StatisticClassificationView
    extends GetView<StatisticClassificationController> {
  const StatisticClassificationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.features_statistic_classifications.tr),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.label_custom_param.tr,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            8.verticalSpace,
            Obx(
              () => DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  isDense: true,
                  labelText: LocaleKeys.label_language.tr,
                ),
                value: controller.selectedLang.value,
                items:
                    DataLanguage.values
                        .map(
                          (e) => DropdownMenuItem<DataLanguage>(
                            value: e,
                            child: Text('${e.name} - ${e.value}'),
                          ),
                        )
                        .toList(),
                onChanged: (selectedType) {
                  if (selectedType == null) return;

                  controller.selectedLang.value = selectedType;
                  controller.updateLocale();
                },
              ),
            ),
            16.verticalSpace,
            Obx(
              () => DropdownButtonFormField<ClassificationType>(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  isDense: true,
                  labelText: LocaleKeys.properties_classification_type.tr,
                ),
                value: controller.selectedType.value,
                items: const [
                  DropdownMenuItem(
                    value: KBLIType.y2009,
                    child: Text('KBLI 2009'),
                  ),
                  DropdownMenuItem(
                    value: KBLIType.y2015,
                    child: Text('KBLI 2015'),
                  ),
                  DropdownMenuItem(
                    value: KBLIType.y2017,
                    child: Text('KBLI 2017'),
                  ),
                  DropdownMenuItem(
                    value: KBLIType.y2020,
                    child: Text('KBLI 2020'),
                  ),
                  DropdownMenuItem(
                    value: KBKIType.y2015,
                    child: Text('KBKI 2015'),
                  ),
                ],
                onChanged: (selectedType) {
                  if (selectedType == null) return;
                  controller.selectedLevel.value = null;
                  controller.selectedType.value = selectedType;
                  controller.loadStatisticClassifications();
                },
              ),
            ),
            16.verticalSpace,
            Obx(() {
              return DropdownButtonFormField<ClassificationLevel?>(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  isDense: true,
                  labelText: LocaleKeys.properties_classification_category.tr,
                ),
                value: controller.selectedLevel.value,
                items:
                    controller.selectedType.value.runtimeType == KBLIType
                        ? const [
                          DropdownMenuItem<KBLILevel>(
                            value: KBLILevel.category,
                            child: Text('Kategori'),
                          ),
                          DropdownMenuItem<KBLILevel>(
                            value: KBLILevel.primaryGroup,
                            child: Text('Golongan Pokok'),
                          ),
                          DropdownMenuItem<KBLILevel>(
                            value: KBLILevel.group,
                            child: Text('Golongan'),
                          ),
                          DropdownMenuItem<KBLILevel>(
                            value: KBLILevel.subGroup,
                            child: Text('Sub Golongan'),
                          ),
                          DropdownMenuItem<KBLILevel>(
                            value: KBLILevel.cluster,
                            child: Text('Kelompok'),
                          ),
                        ]
                        : const [
                          DropdownMenuItem<KBKILevel>(
                            value: KBKILevel.section,
                            child: Text('Seksi'),
                          ),
                          DropdownMenuItem<KBKILevel>(
                            value: KBKILevel.division,
                            child: Text('Divisi'),
                          ),
                          DropdownMenuItem<KBKILevel>(
                            value: KBKILevel.group,
                            child: Text('Kelompok'),
                          ),
                          DropdownMenuItem<KBKILevel>(
                            value: KBKILevel.classes,
                            child: Text('Kelas'),
                          ),
                          DropdownMenuItem<KBKILevel>(
                            value: KBKILevel.subClass,
                            child: Text('Sub Kelas'),
                          ),
                          DropdownMenuItem<KBKILevel>(
                            value: KBKILevel.commodityGroup,
                            child: Text('Kelompok Komoditas'),
                          ),
                          DropdownMenuItem<KBKILevel>(
                            value: KBKILevel.commodity,
                            child: Text('Komoditas'),
                          ),
                        ],
                onChanged: (selectedLevel) {
                  if (selectedLevel == null) return;
                  controller.selectedLevel.value = selectedLevel;
                  controller.currentPage.value = 1;
                  controller.loadStatisticClassifications();
                },
              );
            }),
            8.verticalSpace,
            Obx(
              () => NumberPaginator(
                numberPages: controller.totalPages.value,
                initialPage: controller.currentPage.value - 1,
                onPageChange: (page) {
                  controller.currentPage.value = (page + 1);
                  controller.loadStatisticClassifications();
                },
              ),
            ),
            16.verticalSpace,
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  controller.loadStatisticClassifications();
                },
                child: Text(LocaleKeys.button_submit.tr),
              ),
            ),
            16.verticalSpace,
            Text(
              LocaleKeys.label_pagination_main.tr,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            8.verticalSpace,
            controller.obx(
              (state) => IntrinsicHeight(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Text(
                        LocaleKeys.label_pagination_page.trParams({
                          'page': '${state?.pagination?.page ?? 0}',
                        }),
                      ),
                      const VerticalDivider(color: Colors.blueGrey),
                      Text(
                        LocaleKeys.label_pagination_pages.trParams({
                          'pages': '${state?.pagination?.pages ?? 0}',
                        }),
                      ),
                      const VerticalDivider(color: Colors.blueGrey),
                      Text(
                        LocaleKeys.label_pagination_per_page.trParams({
                          'per_page': '${state?.pagination?.perPage}',
                        }),
                      ),
                      const VerticalDivider(color: Colors.blueGrey),
                      Text(
                        LocaleKeys.label_pagination_total.trParams({
                          'total': '${state?.pagination?.total ?? 0}',
                        }),
                      ),
                    ],
                  ),
                ),
              ),
              onLoading: const Skeletonizer(
                enabled: true,
                child: IntrinsicHeight(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text('Page : '),
                        VerticalDivider(color: Colors.blueGrey),
                        Text('Pages : '),
                        VerticalDivider(color: Colors.blueGrey),
                        Text('Per Page : '),
                        VerticalDivider(color: Colors.blueGrey),
                        Text('Total : '),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            16.verticalSpace,
            Text(
              LocaleKeys.label_result.tr,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            16.verticalSpace,
            controller.obx(
              (state) => ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  if (state == null) {
                    return const SizedBox();
                  }
                  final variable = state.data[index];

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(variable.title),
                      8.verticalSpace,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            LocaleKeys.properties_variable_id.tr,
                            style: context.textTheme.bodySmall?.copyWith(
                              color: Colors.blueGrey,
                            ),
                          ),
                          8.horizontalSpace,
                          Expanded(
                            child: Text(
                              variable.id.toString(),
                              style: context.textTheme.bodySmall,
                            ),
                          ),
                        ],
                      ),
                      8.verticalSpace,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ID',
                            style: context.textTheme.bodySmall?.copyWith(
                              color: Colors.blueGrey,
                            ),
                          ),
                          8.horizontalSpace,
                          Expanded(
                            child: Text(
                              variable.id,
                              style: context.textTheme.bodySmall,
                            ),
                          ),
                        ],
                      ),
                      8.verticalSpace,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Judul',
                            style: context.textTheme.bodySmall?.copyWith(
                              color: Colors.blueGrey,
                            ),
                          ),
                          8.horizontalSpace,
                          Expanded(
                            child: Text(
                              variable.title,
                              style: context.textTheme.bodySmall,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
                separatorBuilder: (_, __) => const Divider(),
                itemCount: state?.data.length ?? 0,
              ),
              onLoading: Skeletonizer(
                enabled: true,
                child: ListView.separated(
                  separatorBuilder: (_, __) => const Divider(),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder:
                      (_, __) => const ListTile(title: Text('Title example')),
                  itemCount: 10,
                ),
              ),
              onError: (error) => Center(child: Text(error.toString())),
              onEmpty: Center(child: Text(LocaleKeys.label_empty.tr)),
            ),
          ],
        ),
      ),
    );
  }
}
