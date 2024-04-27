import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

import '../controllers/strategic_indicator_controller.dart';

class StrategicIndicatorView extends GetView<StrategicIndicatorController> {
  const StrategicIndicatorView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Strategic Indicator Page'),
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
              maxLength: 2,
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
              onChanged: (value) => controller.variableID.value = value,
              keyboardType: TextInputType.number,
              initialValue: controller.variableID.value,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: 'Variable ID - optional',
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
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  controller.loadStrategicIndicators();
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
                            'Nilai: ',
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
                            'Satuan: ',
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
                            'Periode: ',
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
                            'Sumber: ',
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
                            'Hash ID: ',
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
                            'Category ID: ',
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
                            'CSA Subject ID: ',
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
                            'Variable ID: ',
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
                        const Text('Name: '),
                        4.verticalSpace,
                        Text(
                          strategicIndicator.name,
                          style: context.textTheme.bodySmall,
                        ),
                      ],
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
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (_, __) => const ListTile(
                    title: Text('Test data'),
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
