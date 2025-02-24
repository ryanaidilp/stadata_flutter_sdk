import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stadata_example/generated/locales.g.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

import '../controllers/news_category_controller.dart';

class NewsCategoryView extends GetView<NewsCategoryController> {
  const NewsCategoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.page_news_category.tr),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.r),
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
                onChanged: (selectedLang) {
                  if (selectedLang == null) return;

                  controller.selectedLang.value = selectedLang;
                },
              ),
            ),
            16.verticalSpace,
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  controller.loadNewsCategories();
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
                      Text('Page : ${state?.pagination?.page ?? 0}'),
                      const VerticalDivider(color: Colors.blueGrey),
                      Text('Pages : ${state?.pagination?.pages ?? 0}'),
                      const VerticalDivider(color: Colors.blueGrey),
                      Text('Per Page : ${state?.pagination?.perPage ?? 0}'),
                      const VerticalDivider(color: Colors.blueGrey),
                      Text('Total : ${state?.pagination?.total ?? 0}'),
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
              (state) => Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    if (state == null) {
                      return const SizedBox();
                    }
                    final newsCategory = state.data[index];
                    return ListTile(
                      title: Text(newsCategory.id),
                      subtitle: Text(newsCategory.name),
                    );
                  },
                  separatorBuilder: (_, __) => const Divider(),
                  itemCount: state?.data.length ?? 0,
                ),
              ),
              onLoading: Expanded(
                child: Skeletonizer(
                  enabled: true,
                  child: ListView.separated(
                    separatorBuilder: (_, __) => const Divider(),
                    itemBuilder:
                        (_, __) => const ListTile(
                          title: Text('News Category ID'),
                          subtitle: Text('News Category Name'),
                        ),
                    itemCount: 10,
                  ),
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
