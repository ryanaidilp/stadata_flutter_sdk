import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stadata_example/generated/locales.g.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

import '../controllers/strategic_indicator_controller.dart';

class StrategicIndicatorView extends GetView<StrategicIndicatorController> {
  const StrategicIndicatorView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.page_strategic_indicator.tr),
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
            TextFormField(
              maxLength: 2,
              onChanged: (value) => controller.domain.value = value,
              keyboardType: TextInputType.number,
              initialValue: controller.domain.value,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: LocaleKeys.label_domain.tr,
              ),
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
                initialValue: controller.selectedLang.value,
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
                },
              ),
            ),
            8.verticalSpace,
            TextFormField(
              onChanged: (value) => controller.variableID.value = value,
              keyboardType: TextInputType.number,
              initialValue: controller.variableID.value,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: LocaleKeys.label_variable_id.tr,
              ),
            ),
            16.verticalSpace,
            Text(LocaleKeys.label_page.tr),
            8.verticalSpace,
            Obx(
              () => NumberPaginator(
                numberPages: controller.totalPages.value,
                initialPage: controller.currentPage.value - 1,
                onPageChange: (page) {
                  controller.currentPage.value = (page + 1);
                  controller.loadStrategicIndicators();
                },
              ),
            ),
            16.verticalSpace,
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  controller.loadStrategicIndicators();
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
                          'per_page': '${state?.pagination?.perPage ?? 0}',
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
            controller.obx(
              (state) => ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  if (state == null) {
                    return const SizedBox();
                  }
                  final strategicIndicator = state.data[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        strategicIndicator.title,
                        style: context.textTheme.titleMedium,
                      ),
                      Row(
                        children: [
                          Text(
                            LocaleKeys
                                .properties_strategic_indicator_indicator_id
                                .tr,
                            style: context.textTheme.bodySmall,
                          ),
                          4.horizontalSpace,
                          Flexible(
                            child: Text(
                              '${strategicIndicator.id}',
                              style: context.textTheme.bodySmall,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            LocaleKeys.properties_strategic_indicator_value.tr,
                            style: context.textTheme.bodySmall,
                          ),
                          4.horizontalSpace,
                          Flexible(
                            child: Text(
                              '${strategicIndicator.value}',
                              style: context.textTheme.bodySmall,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            LocaleKeys.properties_strategic_indicator_unit.tr,
                            style: context.textTheme.bodySmall,
                          ),
                          4.horizontalSpace,
                          Flexible(
                            child: Text(
                              strategicIndicator.unit,
                              style: context.textTheme.bodySmall,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            LocaleKeys.properties_strategic_indicator_period.tr,
                            style: context.textTheme.bodySmall,
                          ),
                          4.horizontalSpace,
                          Flexible(
                            child: Text(
                              strategicIndicator.period,
                              style: context.textTheme.bodySmall,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            LocaleKeys
                                .properties_strategic_indicator_data_source
                                .tr,
                            style: context.textTheme.bodySmall,
                          ),
                          4.horizontalSpace,
                          Flexible(
                            child: Text(
                              strategicIndicator.dataSource,
                              style: context.textTheme.bodySmall,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            LocaleKeys
                                .properties_strategic_indicator_hash_id
                                .tr,
                            style: context.textTheme.bodySmall,
                          ),
                          4.horizontalSpace,
                          Flexible(
                            child: Text(
                              strategicIndicator.hashID,
                              style: context.textTheme.bodySmall,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            LocaleKeys
                                .properties_strategic_indicator_category_id
                                .tr,
                            style: context.textTheme.bodySmall,
                          ),
                          4.horizontalSpace,
                          Flexible(
                            child: Text(
                              '${strategicIndicator.categoryID}',
                              style: context.textTheme.bodySmall,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            LocaleKeys.properties_variable_csa_subject_id.tr,
                            style: context.textTheme.bodySmall,
                          ),
                          4.horizontalSpace,
                          Flexible(
                            child: Text(
                              '${strategicIndicator.csaSubjectID}',
                              style: context.textTheme.bodySmall,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            LocaleKeys
                                .properties_strategic_indicator_variable_id
                                .tr,
                            style: context.textTheme.bodySmall,
                          ),
                          4.horizontalSpace,
                          Flexible(
                            child: Text(
                              '${strategicIndicator.variableID}',
                              style: context.textTheme.bodySmall,
                            ),
                          ),
                        ],
                      ),
                      8.verticalSpace,
                      if (strategicIndicator.name.isNotEmpty) ...[
                        Text(LocaleKeys.properties_strategic_indicator_name.tr),
                        4.verticalSpace,
                        Text(
                          strategicIndicator.name,
                          style: context.textTheme.bodySmall,
                        ),
                      ],
                    ],
                  );
                },
                separatorBuilder: (_, _) => const Divider(),
                itemCount: state?.data.length ?? 0,
              ),
              onLoading: Skeletonizer(
                enabled: true,
                child: ListView.separated(
                  separatorBuilder: (_, _) => const Divider(),
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder:
                      (_, _) => const ListTile(title: Text('Test data')),
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
