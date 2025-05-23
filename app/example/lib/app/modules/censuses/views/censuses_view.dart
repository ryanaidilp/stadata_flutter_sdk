import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stadata_example/app/shared/widgets/pagination_info.dart';
import 'package:stadata_example/app/shared/widgets/property_tile.dart';
import 'package:stadata_example/generated/locales.g.dart';

import '../controllers/censuses_controller.dart';

class CensusesView extends GetView<CensusesController> {
  const CensusesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.page_censuses.tr),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            controller.obx(
              (state) => PaginationInfo(
                page: state?.pagination?.page ?? 0,
                pages: state?.pagination?.pages ?? 0,
                total: state?.pagination?.total ?? 0,
                perPage: state?.pagination?.perPage ?? 0,
              ),
              onLoading: const Skeletonizer(
                enabled: true,
                child: PaginationInfo.skeleton(),
              ),
            ),
            16.verticalSpace,
            Text(LocaleKeys.label_result.tr),
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
                            spacing: 16.h,
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
