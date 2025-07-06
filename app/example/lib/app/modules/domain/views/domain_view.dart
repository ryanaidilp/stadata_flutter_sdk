import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stadata_example/app/shared/widgets/domain_card.dart';
import 'package:stadata_example/generated/locales.g.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

import '../controllers/domain_controller.dart';

class DomainView extends GetView<DomainController> {
  const DomainView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.page_domain.tr), centerTitle: true),
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
            Obx(
              () => DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  isDense: true,
                  labelText: LocaleKeys.label_type.tr,
                ),
                value: controller.selectedType.value,
                items:
                    DomainType.values
                        .map(
                          (e) => DropdownMenuItem<DomainType>(
                            value: e,
                            child: Text('${e.name} - ${e.value}'),
                          ),
                        )
                        .toList(),
                onChanged: (selectedType) {
                  if (selectedType == null) return;

                  controller.selectedType.value = selectedType;
                },
              ),
            ),
            16.verticalSpace,
            Obx(
              () => TextFormField(
                enabled:
                    controller.selectedType.value ==
                    DomainType.regencyByProvince,
                maxLength: 2,
                onChanged: (value) => controller.provinceCode.value = value,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: LocaleKeys.label_province_code.tr,
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  controller.loadDomains();
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
            controller.obx(
              (state) => Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    if (state == null) {
                      return const SizedBox();
                    }
                    final domain = state.data[index];
                    return DomainCard(
                      id: domain.id,
                      title: domain.name,
                      url: domain.url,
                    );
                  },
                  separatorBuilder: (_, _) => const Divider(),
                  itemCount: state?.data.length ?? 0,
                ),
              ),
              onLoading: Expanded(
                child: Skeletonizer(
                  enabled: true,
                  child: ListView.separated(
                    separatorBuilder: (_, _) => const Divider(),
                    itemBuilder:
                        (_, _) => const DomainCard(
                          id: '0000',
                          title: 'Provinsi Dummy',
                          url: 'https://provinsi.com',
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
