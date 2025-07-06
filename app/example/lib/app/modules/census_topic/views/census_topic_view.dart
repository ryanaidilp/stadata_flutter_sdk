import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stadata_example/app/shared/widgets/pagination_info.dart';
import 'package:stadata_example/app/shared/widgets/property_tile.dart';
import 'package:stadata_example/generated/locales.g.dart';

import '../controllers/census_topic_controller.dart';

class CensusTopicView extends GetView<CensusTopicController> {
  const CensusTopicView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.page_census_topics.tr),
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
              () => DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  isDense: true,
                  labelText: LocaleKeys.label_language.tr,
                ),
                value: controller.selectedEvent.value,
                items:
                    controller.censuses
                        .map(
                          (e) => DropdownMenuItem(
                            value: e.id,
                            child: Text(e.name),
                          ),
                        )
                        .toList(),
                onChanged: (String? value) {
                  controller.selectedEvent.value = value;
                  controller.loadCensusTopics();
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
                  controller.loadCensusTopics();
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
              (state) =>
                  state == null
                      ? const SizedBox.shrink()
                      : ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.data.length,
                        separatorBuilder: (_, _) => const Divider(),
                        itemBuilder: (context, index) {
                          final topic = state.data[index];

                          return Column(
                            spacing: 8.h,
                            children: [
                              PropertyTile(
                                label: LocaleKeys.properties_census_topic_id.tr,
                                value: '${topic.id}',
                              ),
                              PropertyTile(
                                label:
                                    LocaleKeys.properties_census_topic_topic.tr,
                                value: topic.topic,
                              ),
                              PropertyTile(
                                label:
                                    LocaleKeys
                                        .properties_census_topic_event_id
                                        .tr,
                                value: topic.eventID,
                              ),
                              PropertyTile(
                                label:
                                    LocaleKeys.properties_census_topic_event.tr,
                                value: topic.eventName,
                              ),
                            ],
                          );
                        },
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
