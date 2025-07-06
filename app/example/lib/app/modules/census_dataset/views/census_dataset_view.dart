import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stadata_example/app/shared/widgets/pagination_info.dart';
import 'package:stadata_example/app/shared/widgets/property_tile.dart';
import 'package:stadata_example/generated/locales.g.dart';

import '../controllers/census_dataset_controller.dart';

class CensusDatasetView extends GetView<CensusDatasetController> {
  const CensusDatasetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.page_census_datasets.tr),
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
              () => DropdownButtonFormField<String>(
                isDense: true,
                isExpanded: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  labelText: LocaleKeys.label_census_select_event.tr,
                ),
                value: controller.selectedEvent.value,
                items:
                    controller.censuses
                        .map(
                          (census) => DropdownMenuItem<String>(
                            value: census.id,
                            child: Text('${census.name} (${census.id})'),
                          ),
                        )
                        .toList(),
                onChanged: controller.onEventChanged,
              ),
            ),
            16.verticalSpace,
            Obx(
              () => DropdownButtonFormField<int>(
                isDense: true,
                isExpanded: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),

                  labelText: LocaleKeys.label_census_select_topic.tr,
                ),
                value: controller.selectedTopic.value,
                items:
                    controller.censusTopics
                        .map(
                          (topic) => DropdownMenuItem<int>(
                            value: topic.id,
                            child: Text('${topic.topic} (ID: ${topic.id})'),
                          ),
                        )
                        .toList(),
                onChanged: controller.onTopicChanged,
              ),
            ),
            16.verticalSpace,
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  controller.onSubmitPressed();
                },
                child: Text(LocaleKeys.button_submit.tr),
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
                  controller.onSubmitPressed();
                },
              ),
            ),
            16.verticalSpace,
            Text(
              LocaleKeys.label_pagination_main.tr,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            8.verticalSpace,
            controller.obx(
              (state) => PaginationInfo(
                page: state?.pagination?.page ?? 1,
                pages: state?.pagination?.pages ?? 1,
                perPage: state?.pagination?.perPage ?? 1,
                total: state?.pagination?.total ?? 1,
              ),
              onLoading: const Skeletonizer(child: PaginationInfo.skeleton()),
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
                  final dataset = state.data[index];

                  return Column(
                    spacing: 8.h,
                    children: [
                      Text(
                        dataset.name,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      PropertyTile(
                        label: LocaleKeys.properties_census_dataset_id.tr,
                        value: '${dataset.id}',
                      ),
                      PropertyTile(
                        label: LocaleKeys.properties_census_dataset_topic.tr,
                        value: dataset.topic,
                      ),
                      PropertyTile(
                        label: LocaleKeys.properties_census_dataset_event_id.tr,
                        value: '${dataset.eventID}',
                      ),
                      if (dataset.description != null)
                        PropertyTile(
                          label:
                              LocaleKeys
                                  .properties_census_dataset_description
                                  .tr,
                          value: dataset.description!,
                        ),
                    ],
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: state?.data.length ?? 0,
              ),
              onLoading: Skeletonizer(
                enabled: true,
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder:
                      (context, index) => Column(
                        spacing: 8.h,
                        children: [
                          const Text('Dataset Name Sample'),
                          const PropertyTile(
                            label: 'Dataset ID:',
                            value: '12345',
                          ),
                          const PropertyTile(
                            label: 'Topic:',
                            value: 'Sample Topic',
                          ),
                        ],
                      ),
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: 3,
                ),
              ),
              onEmpty: Center(child: Text(LocaleKeys.label_empty.tr)),
              onError: (error) => Center(child: Text(error.toString())),
            ),
          ],
        ),
      ),
    );
  }
}
