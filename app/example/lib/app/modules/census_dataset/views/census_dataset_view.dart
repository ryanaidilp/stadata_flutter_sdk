import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
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
              LocaleKeys.label_census_event_selection.tr,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            8.verticalSpace,
            Obx(
              () => DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  isDense: true,
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
            Text(
              LocaleKeys.label_census_topic_selection.tr,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            8.verticalSpace,
            Obx(
              () => DropdownButtonFormField<int>(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  isDense: true,
                  labelText: 'Select Census Topic',
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
              LocaleKeys.label_census_dataset_results.tr,
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
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        dataset.name,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      8.verticalSpace,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            LocaleKeys.properties_census_dataset_id.tr,
                            style: context.textTheme.bodySmall?.copyWith(
                              color: Colors.blueGrey,
                            ),
                          ),
                          8.horizontalSpace,
                          Expanded(
                            child: Text(
                              '${dataset.id}',
                              style: context.textTheme.bodySmall,
                            ),
                          ),
                        ],
                      ),
                      4.verticalSpace,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            LocaleKeys.properties_census_dataset_topic.tr,
                            style: context.textTheme.bodySmall?.copyWith(
                              color: Colors.blueGrey,
                            ),
                          ),
                          8.horizontalSpace,
                          Expanded(
                            child: Text(
                              dataset.topic,
                              style: context.textTheme.bodySmall,
                            ),
                          ),
                        ],
                      ),
                      4.verticalSpace,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            LocaleKeys.properties_census_dataset_event_id.tr,
                            style: context.textTheme.bodySmall?.copyWith(
                              color: Colors.blueGrey,
                            ),
                          ),
                          8.horizontalSpace,
                          Expanded(
                            child: Text(
                              '${dataset.eventID}',
                              style: context.textTheme.bodySmall,
                            ),
                          ),
                        ],
                      ),
                      if (dataset.description != null) ...[
                        4.verticalSpace,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              LocaleKeys
                                  .properties_census_dataset_description
                                  .tr,
                              style: context.textTheme.bodySmall?.copyWith(
                                color: Colors.blueGrey,
                              ),
                            ),
                            8.horizontalSpace,
                            Expanded(
                              child: Text(
                                dataset.description!,
                                style: context.textTheme.bodySmall,
                              ),
                            ),
                          ],
                        ),
                      ],
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
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Dataset Name Sample'),
                          8.verticalSpace,
                          const Row(
                            children: [
                              Text('Dataset ID: '),
                              Expanded(child: Text('12345')),
                            ],
                          ),
                          4.verticalSpace,
                          const Row(
                            children: [
                              Text('Topic: '),
                              Expanded(child: Text('Sample Topic')),
                            ],
                          ),
                        ],
                      ),
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: 3,
                ),
              ),
              onEmpty: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.folder_open, size: 64.r, color: Colors.grey),
                    16.verticalSpace,
                    Text(
                      LocaleKeys.label_census_no_datasets_found.tr,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyLarge?.copyWith(color: Colors.grey),
                    ),
                    8.verticalSpace,
                    Text(
                      LocaleKeys.label_census_please_select_event_topic.tr,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              onError:
                  (error) => Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error_outline,
                          size: 64.r,
                          color: Colors.red,
                        ),
                        16.verticalSpace,
                        Text(
                          LocaleKeys.label_census_error_occurred.tr,
                          style: Theme.of(
                            context,
                          ).textTheme.bodyLarge?.copyWith(color: Colors.red),
                        ),
                        8.verticalSpace,
                        Text(
                          error.toString(),
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(color: Colors.red),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
