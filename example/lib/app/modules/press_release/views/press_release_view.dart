import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stadata_example/app/routes/app_pages.dart';
import 'package:stadata_example/app/shared/widgets/press_release_card.dart';
import 'package:stadata_example/app/utils/date_formatter.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

import '../controllers/press_release_controller.dart';

class PressReleaseView extends GetView<PressReleaseController> {
  const PressReleaseView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Press Release Page'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Custom Param',
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
                labelText: 'Domain (domain) - required',
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
                  labelText: 'Language (lang) - required',
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
                labelText: 'Keyword (keyword) - optional',
              ),
            ),
            16.verticalSpace,
            TextFormField(
              onChanged: (value) => controller.page.value = value,
              keyboardType: TextInputType.number,
              initialValue: controller.page.value,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: 'Page (page) - optional',
              ),
            ),
            16.verticalSpace,
            TextFormField(
              controller: controller.dateCtl,
              onTap: () async {
                final result = await showMonthYearPicker(
                  context: context,
                  initialDate: controller.date.value ?? DateTime.now(),
                  firstDate: DateTime.now().subtract(
                    const Duration(
                      days: 365 * 5,
                    ),
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
                labelText: 'Month & Year (month & year) - optional',
              ),
            ),
            16.verticalSpace,
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  controller.loadPressReleases();
                },
                child: const Text('Submit'),
              ),
            ),
            16.verticalSpace,
            Text(
              'Pagination',
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
                        'Page : ${state?.pagination?.page ?? 0}',
                      ),
                      const VerticalDivider(
                        color: Colors.blueGrey,
                      ),
                      Text(
                        'Pages : ${state?.pagination?.pages ?? 0}',
                      ),
                      const VerticalDivider(
                        color: Colors.blueGrey,
                      ),
                      Text(
                        'Per Page : ${state?.pagination?.perPage ?? 0}',
                      ),
                      const VerticalDivider(
                        color: Colors.blueGrey,
                      ),
                      Text(
                        'Total : ${state?.pagination?.total ?? 0}',
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
            controller.obx(
              (state) => ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  if (state == null) {
                    return const SizedBox();
                  }
                  final pressRelease = state.data[index];
                  return PressReleaseCard(
                    cover: pressRelease.cover,
                    title: pressRelease.title,
                    onTap: () {
                      Get.toNamed(
                        Routes.PRESS_RELEASE_DETAIL,
                        arguments: {
                          'id': pressRelease.id.toString(),
                          'lang': controller.selectedLang.value,
                          'domain': controller.domain.value,
                        },
                      );
                    },
                  );
                },
                separatorBuilder: (_, __) => const Divider(),
                itemCount: state?.data.length ?? 0,
              ),
              onLoading: Skeletonizer(
                enabled: true,
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (_, __) => const Divider(),
                  itemBuilder: (_, __) => const PressReleaseCard(
                    cover:
                        'https://fikrirasyid.com/wp-content/uploads/2016/10/placeholder-portrait-9-16.jpg',
                    title: 'Press release Title Example',
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
