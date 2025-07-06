import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stadata_example/app/shared/widgets/empty_state_widget.dart';
import 'package:stadata_example/app/shared/widgets/error_state_widget.dart';
import 'package:stadata_example/app/shared/widgets/initial_state_widget.dart';
import 'package:stadata_example/app/shared/widgets/pagination_info.dart';
import 'package:stadata_example/app/shared/widgets/property_tile.dart';
import 'package:stadata_example/generated/locales.g.dart';

import '../controllers/census_data_controller.dart';

class CensusDataView extends GetView<CensusDataController> {
  const CensusDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.page_census_data.tr),
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
                    borderRadius: BorderRadius.circular(8),
                  ),
                  isDense: true,
                  labelText:
                      controller.isCensusLoading.value
                          ? LocaleKeys.label_census_loading_events.tr
                          : controller.isCensusError.value
                          ? LocaleKeys.label_census_error_loading_events.tr
                          : LocaleKeys.label_census_select_event.tr,
                ),
                value: controller.selectedEvent.value,
                items:
                    controller.censuses.isEmpty
                        ? []
                        : controller.censuses
                            .map(
                              (census) => DropdownMenuItem<String>(
                                value: census.id,
                                child: FittedBox(
                                  child: Text(
                                    '${census.name} (${census.id})',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                onChanged:
                    controller.censuses.isEmpty
                        ? null
                        : controller.onEventChanged,
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
                  isDense: true,
                  labelText:
                      controller.isCensusTopicLoading.value
                          ? LocaleKeys.label_census_loading_topics.tr
                          : controller.isCensusTopicError.value
                          ? LocaleKeys.label_census_error_loading_topics.tr
                          : controller.censusTopics.isEmpty
                          ? LocaleKeys.label_census_select_event_first.tr
                          : LocaleKeys.label_census_select_topic.tr,
                ),
                value: controller.selectedTopic.value,
                items:
                    controller.censusTopics.isEmpty
                        ? []
                        : controller.censusTopics
                            .map(
                              (topic) => DropdownMenuItem<int>(
                                value: topic.id,
                                child: Text('${topic.topic} (ID: ${topic.id})'),
                              ),
                            )
                            .toList(),
                onChanged:
                    controller.censusTopics.isEmpty
                        ? null
                        : controller.onTopicChanged,
              ),
            ),
            16.verticalSpace,
            Obx(
              () => DropdownButtonFormField<String>(
                isDense: true,
                isExpanded: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),

                  labelText:
                      controller.isCensusAreaLoading.value
                          ? LocaleKeys.label_census_loading_areas.tr
                          : controller.isCensusAreaError.value
                          ? LocaleKeys.label_census_error_loading_areas.tr
                          : controller.censusAreas.isEmpty
                          ? LocaleKeys.label_census_select_event_first.tr
                          : LocaleKeys.label_census_select_area.tr,
                ),
                value: controller.selectedCensusArea.value,
                items:
                    controller.censusAreas.isEmpty
                        ? []
                        : controller.censusAreas
                            .map(
                              (area) => DropdownMenuItem<String>(
                                value: area.id.toString(),
                                child: Text('${area.name} (${area.id})'),
                              ),
                            )
                            .toList(),
                onChanged:
                    controller.censusAreas.isEmpty
                        ? null
                        : controller.onCensusAreaChanged,
              ),
            ),
            16.verticalSpace,
            Obx(
              () => DropdownButtonFormField<String>(
                isDense: true,
                isExpanded: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),

                  isDense: true,
                  labelText:
                      controller.isCensusDatasetLoading.value
                          ? LocaleKeys.label_census_loading_datasets.tr
                          : controller.isCensusDatasetError.value
                          ? LocaleKeys.label_census_error_loading_datasets.tr
                          : controller.censusDatasets.isEmpty
                          ? LocaleKeys.label_census_select_event_topic_first.tr
                          : LocaleKeys.label_census_select_dataset.tr,
                ),
                value: controller.selectedDataset.value,
                items:
                    controller.censusDatasets.isEmpty
                        ? []
                        : controller.censusDatasets
                            .map(
                              (dataset) => DropdownMenuItem<String>(
                                value: dataset.id.toString(),
                                child: Text(
                                  '${dataset.name} (ID: ${dataset.id})',
                                ),
                              ),
                            )
                            .toList(),
                onChanged:
                    controller.censusDatasets.isEmpty
                        ? null
                        : controller.onDatasetChanged,
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
            Text(
              LocaleKeys.label_pagination_main.tr,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            8.verticalSpace,
            controller.obx(
              (state) => PaginationInfo(
                page: state?.pagination?.page ?? 0,
                pages: state?.pagination?.pages ?? 0,
                perPage: state?.pagination?.perPage ?? 0,
                total: state?.pagination?.total ?? 0,
              ),
              onLoading: const Skeletonizer(
                enabled: true,
                child: PaginationInfo.skeleton(),
              ),
              onEmpty: const SizedBox.shrink(),
              onError: (error) => const SizedBox.shrink(),
            ),
            16.verticalSpace,
            Text(
              LocaleKeys.label_census_data_results.tr,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            16.verticalSpace,
            GetBuilder<CensusDataController>(
              builder: (controller) {
                // Check if controller has never been used (initial state)
                if (controller.status.isLoading == false &&
                    controller.status.isSuccess == false &&
                    controller.status.isError == false &&
                    controller.status.isEmpty == false) {
                  return const InitialStateWidget();
                }

                return controller.obx(
                  (state) => ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final censusData = state?.data[index];
                      if (censusData == null) return const SizedBox.shrink();

                      return Card(
                        child: Padding(
                          padding: EdgeInsets.all(12.r),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                censusData.indicatorName,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              8.verticalSpace,
                              PropertyTile(
                                label: '${LocaleKeys.label_census_region.tr}:',
                                value:
                                    '${censusData.regionName} (${censusData.regionCode})',
                              ),
                              PropertyTile(
                                label:
                                    '${LocaleKeys.label_census_indicator_id.tr}:',
                                value: censusData.indicatorID,
                              ),
                              PropertyTile(
                                label: '${LocaleKeys.label_census_period.tr}:',
                                value: censusData.period,
                              ),
                              PropertyTile(
                                label: '${LocaleKeys.label_census_value.tr}:',
                                value: censusData.value.toString(),
                              ),
                              if (censusData.regionLevel != null)
                                PropertyTile(
                                  label:
                                      '${LocaleKeys.label_census_region_level.tr}:',
                                  value: censusData.regionLevel!,
                                ),
                              if (censusData.categories.isNotEmpty) ...[
                                8.verticalSpace,
                                Text(
                                  LocaleKeys.label_census_categories.tr,
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                4.verticalSpace,
                                ...censusData.categories.map(
                                  (category) => Padding(
                                    padding: EdgeInsets.only(left: 8.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '• ${category.name}',
                                          style: context.textTheme.bodySmall
                                              ?.copyWith(
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 12.w),
                                          child: Text(
                                            '${category.itemName} (${category.itemCode})',
                                            style: context.textTheme.bodySmall,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => 8.verticalSpace,
                    itemCount: state?.data.length ?? 0,
                  ),
                  onLoading: Skeletonizer(
                    enabled: true,
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder:
                          (context, index) => Card(
                            child: Padding(
                              padding: EdgeInsets.all(12.r),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    LocaleKeys.label_census_indicator_name.tr,
                                  ),
                                  8.verticalSpace,
                                  PropertyTile(
                                    label:
                                        '${LocaleKeys.label_census_region.tr}:',
                                    value:
                                        LocaleKeys
                                            .label_census_sample_region
                                            .tr,
                                  ),
                                  PropertyTile(
                                    label:
                                        '${LocaleKeys.label_census_value.tr}:',
                                    value: '123456',
                                  ),
                                ],
                              ),
                            ),
                          ),
                      separatorBuilder: (context, index) => 8.verticalSpace,
                      itemCount: 3,
                    ),
                  ),
                  onError:
                      (error) => ErrorStateWidget(
                        message: error,
                        onRetry: () => controller.onSubmitPressed(),
                      ),
                  onEmpty: const EmptyStateWidget(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
