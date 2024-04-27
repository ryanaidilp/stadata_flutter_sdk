import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stadata_example/generated/locales.g.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

import '../controllers/variable_controller.dart';

class VariableView extends GetView<VariableController> {
  const VariableView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.page_variables.tr,
        ),
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
              maxLength: 4,
              onChanged: (value) {
                controller.domain.value = value;
              },
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
                value: controller.selectedLang.value,
                items: DataLanguage.values
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
            8.verticalSpace,
            Row(
              children: [
                Text(
                  LocaleKeys.label_area_variable.tr,
                ),
                Obx(
                  () => FlutterSwitch(
                    value: controller.showExistingVariables.value,
                    onToggle: (value) {
                      controller.showExistingVariables.value = value;
                    },
                  ),
                ),
              ],
            ),
            8.verticalSpace,
            TextFormField(
              onChanged: (value) {
                controller.subjectID.value = value;
              },
              keyboardType: TextInputType.number,
              initialValue: controller.subjectID.value,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: LocaleKeys.label_subject_id.tr,
              ),
            ),
            16.verticalSpace,
            TextFormField(
              onChanged: (value) {
                controller.year.value = value;
              },
              maxLength: 4,
              keyboardType: TextInputType.number,
              initialValue: controller.year.value,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: LocaleKeys.label_year.tr,
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
                  controller.loadVariables();
                },
              ),
            ),
            16.verticalSpace,
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  controller.loadVariables();
                },
                child: Text(
                  LocaleKeys.button_submit.tr,
                ),
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
                        LocaleKeys.label_pagination_page.trParams(
                          {
                            'page': '${state?.pagination?.page ?? 0}',
                          },
                        ),
                      ),
                      const VerticalDivider(
                        color: Colors.blueGrey,
                      ),
                      Text(
                        LocaleKeys.label_pagination_pages.trParams(
                          {
                            'pages': '${state?.pagination?.pages ?? 0}',
                          },
                        ),
                      ),
                      const VerticalDivider(
                        color: Colors.blueGrey,
                      ),
                      Text(
                        LocaleKeys.label_pagination_per_page.trParams(
                          {
                            'per_page': '${state?.pagination?.perPage}',
                          },
                        ),
                      ),
                      const VerticalDivider(
                        color: Colors.blueGrey,
                      ),
                      Text(
                        LocaleKeys.label_pagination_total.trParams(
                          {
                            'total': '${state?.pagination?.total ?? 0}',
                          },
                        ),
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
                        Text(
                          'Page : ',
                        ),
                        VerticalDivider(
                          color: Colors.blueGrey,
                        ),
                        Text(
                          'Pages : ',
                        ),
                        VerticalDivider(
                          color: Colors.blueGrey,
                        ),
                        Text(
                          'Per Page : ',
                        ),
                        VerticalDivider(
                          color: Colors.blueGrey,
                        ),
                        Text(
                          'Total : ',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            16.verticalSpace,
            Text(
              'Result',
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
                      Text(
                        variable.title,
                      ),
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
                            LocaleKeys.properties_variable_subject_id.tr,
                            style: context.textTheme.bodySmall?.copyWith(
                              color: Colors.blueGrey,
                            ),
                          ),
                          8.horizontalSpace,
                          Expanded(
                            child: Text(
                              variable.subjectID.toString(),
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
                            LocaleKeys.properties_variable_subject_name.tr,
                            style: context.textTheme.bodySmall?.copyWith(
                              color: Colors.blueGrey,
                            ),
                          ),
                          8.horizontalSpace,
                          Expanded(
                            child: Text(
                              variable.subjectName,
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
                            LocaleKeys.properties_variable_vertical.tr,
                            style: context.textTheme.bodySmall?.copyWith(
                              color: Colors.blueGrey,
                            ),
                          ),
                          8.horizontalSpace,
                          Expanded(
                            child: Text(
                              variable.verticalVariableID.toString(),
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
                            LocaleKeys.properties_variable_type.tr,
                            style: context.textTheme.bodySmall?.copyWith(
                              color: Colors.blueGrey,
                            ),
                          ),
                          8.horizontalSpace,
                          Expanded(
                            child: Text(
                              variable.type.toString(),
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
                            LocaleKeys.properties_variable_unit.tr,
                            style: context.textTheme.bodySmall?.copyWith(
                              color: Colors.blueGrey,
                            ),
                          ),
                          8.horizontalSpace,
                          Expanded(
                            child: Text(
                              variable.unit,
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
                            LocaleKeys.properties_variable_notes.tr,
                            style: context.textTheme.bodySmall?.copyWith(
                              color: Colors.blueGrey,
                            ),
                          ),
                          8.horizontalSpace,
                          Expanded(
                            child: HtmlWidget(
                              variable.notes,
                              renderMode: RenderMode.column,
                              textStyle: Theme.of(context).textTheme.bodySmall,
                              onTapUrl: (url) async {
                                return true;
                              },
                            ),
                          ),
                        ],
                      ),
                      8.verticalSpace,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            LocaleKeys.properties_variable_graph_name.tr,
                            style: context.textTheme.bodySmall?.copyWith(
                              color: Colors.blueGrey,
                            ),
                          ),
                          8.horizontalSpace,
                          Expanded(
                            child: Text(
                              variable.graphName,
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
                            LocaleKeys.properties_variable_csa_subject_id.tr,
                            style: context.textTheme.bodySmall?.copyWith(
                              color: Colors.blueGrey,
                            ),
                          ),
                          8.horizontalSpace,
                          Expanded(
                            child: Text(
                              variable.csaSubjectID.toString(),
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
                            LocaleKeys.properties_variable_csa_subject_name.tr,
                            style: context.textTheme.bodySmall?.copyWith(
                              color: Colors.blueGrey,
                            ),
                          ),
                          8.horizontalSpace,
                          Expanded(
                            child: Text(
                              variable.csaSubjectName.toString(),
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
                            LocaleKeys.properties_variable_derived_period_id.tr,
                            style: context.textTheme.bodySmall?.copyWith(
                              color: Colors.blueGrey,
                            ),
                          ),
                          8.horizontalSpace,
                          Expanded(
                            child: Text(
                              variable.derivedPeriodID.toString(),
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
                            LocaleKeys
                                .properties_variable_derived_variable_id.tr,
                            style: context.textTheme.bodySmall?.copyWith(
                              color: Colors.blueGrey,
                            ),
                          ),
                          8.horizontalSpace,
                          Expanded(
                            child: Text(
                              variable.derivedVariableID.toString(),
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
                  itemBuilder: (_, __) => const ListTile(
                    title: Text('Title example'),
                  ),
                  itemCount: 10,
                ),
              ),
              onError: (error) => Center(
                child: Text(
                  error.toString(),
                ),
              ),
              onEmpty: const Center(
                child: Text('Empty'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
