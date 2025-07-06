import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stadata_example/app/routes/app_pages.dart';
import 'package:stadata_example/app/shared/widgets/static_table_card.dart';
import 'package:stadata_example/app/utils/date_formatter.dart';
import 'package:stadata_example/generated/locales.g.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

import '../controllers/static_table_controller.dart';

class StaticTableView extends GetView<StaticTableController> {
  const StaticTableView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.page_static_table.tr),
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
                },
              ),
            ),
            8.verticalSpace,
            TextFormField(
              onChanged: (value) => controller.keyword.value = value,
              keyboardType: TextInputType.text,
              initialValue: controller.keyword.value,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: LocaleKeys.label_keyword_optional.tr,
              ),
            ),
            16.verticalSpace,
            TextFormField(
              controller: controller.dateCtl,
              onTap: () async {
                final result = await showDatePicker(
                  context: context,
                  initialDate: controller.date.value ?? DateTime.now(),
                  firstDate: DateTime.now().subtract(
                    const Duration(days: 365 * 5),
                  ),
                  lastDate: DateTime.now(),
                );
                controller.date.value = result;
                controller.dateCtl.text = DateFormatter.formatDate(
                  'MMMM y',
                  result,
                );
              },
              readOnly: true,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: LocaleKeys.label_month_year_optional.tr,
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
                  controller.loadStaticTables();
                },
              ),
            ),
            16.verticalSpace,
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  controller.loadStaticTables();
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
                  final staticTable = state.data[index];
                  return StaticTableCard(
                    title: staticTable.title,
                    size: staticTable.size,
                    updatedAt: staticTable.updatedAt,
                    onTap:
                        () => Get.toNamed(
                          Routes.STATIC_TABLE_DETAIL,
                          arguments: {
                            'id': staticTable.id.toString(),
                            'domain': controller.domain.value,
                            'lang': controller.selectedLang.value,
                          },
                        ),
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
                      (_, _) => StaticTableCard(
                        title: 'This is example table placeholder',
                        size: '1.1 MB',
                        updatedAt: DateTime.now(),
                        onTap: () {},
                      ),
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
