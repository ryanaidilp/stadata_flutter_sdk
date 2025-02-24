import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stadata_example/generated/locales.g.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

import '../controllers/subject_category_controller.dart';

class SubjectCategoryView extends GetView<SubjectCategoryController> {
  const SubjectCategoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.page_subject_category.tr),
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
            16.verticalSpace,
            Text(LocaleKeys.label_page.tr),
            8.verticalSpace,
            Obx(
              () => NumberPaginator(
                numberPages: controller.totalPages.value,
                initialPage: controller.currentPage.value - 1,
                onPageChange: (page) {
                  controller.currentPage.value = (page + 1);
                  controller.loadSubjectCategories();
                },
              ),
            ),
            16.verticalSpace,
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  controller.loadSubjectCategories();
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
            16.verticalSpace,
            controller.obx(
              (state) => ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  if (state == null) {
                    return const SizedBox();
                  }
                  final subjectCategory = state.data[index];
                  return ListTile(
                    title: Text(
                      '${subjectCategory.id} - ${subjectCategory.name}',
                    ),
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
                      (_, __) => const ListTile(
                        title: Text('Title of Subject Category'),
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
