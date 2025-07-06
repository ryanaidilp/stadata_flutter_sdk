import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stadata_example/app/shared/widgets/pagination_info.dart';
import 'package:stadata_example/app/shared/widgets/property_tile.dart';
import 'package:stadata_example/generated/locales.g.dart';

import '../controllers/census_events_controller.dart';

class CensusEventsView extends GetView<CensusEventsController> {
  const CensusEventsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.page_census_events.tr),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(LocaleKeys.label_page.tr),
            8.verticalSpace,
            Obx(
              () => NumberPaginator(
                numberPages: controller.totalPages.value,
                initialPage: controller.currentPage.value - 1,
                onPageChange: (page) {
                  controller.currentPage.value = (page + 1);
                  controller.loadCensusEvents();
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
                        separatorBuilder: (_, _) => const Divider(),
                        itemBuilder: (context, index) {
                          final census = state.data[index];

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 8.h,
                            children: [
                              PropertyTile(
                                label: LocaleKeys.properties_census_id.tr,
                                value: census.id,
                              ),
                              PropertyTile(
                                label: LocaleKeys.properties_census_name.tr,
                                value: census.name,
                              ),
                              PropertyTile(
                                label: LocaleKeys.properties_census_year.tr,
                                value: census.year.toString(),
                              ),
                            ],
                          );
                        },
                        itemCount: state.data.length,
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
