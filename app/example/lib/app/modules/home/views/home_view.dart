import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'package:get/get.dart';
import 'package:stadata_example/app/routes/app_pages.dart';
import 'package:stadata_example/generated/locales.g.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.stadata_example.tr),
        centerTitle: true,
        actions: [
          ValueBuilder<Locale?>(
            initialValue: Get.deviceLocale,
            builder:
                (snapshot, updater) => FlutterSwitch(
                  value: snapshot == const Locale('id', 'ID'),
                  showOnOff: true,
                  onToggle: (value) {
                    final locale =
                        value
                            ? const Locale('id', 'ID')
                            : const Locale('en', 'US');
                    Get.updateLocale(locale);
                    updater.call(locale);
                  },
                  activeText: 'ID',
                  inactiveText: 'EN',
                ),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(20.r),
        children: [
          Text(
            LocaleKeys.features_list.tr,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          8.verticalSpace,
          _Button(LocaleKeys.features_censuses.tr, Routes.CENSUSES),
          _Button(LocaleKeys.features_census_topics.tr, Routes.CENSUS_TOPIC),
          _Button(LocaleKeys.features_domains.tr, Routes.DOMAIN),
          _Button(LocaleKeys.features_infographics.tr, Routes.INFOGRAPHIC),
          _Button(LocaleKeys.features_news.tr, Routes.NEWS),
          _Button(LocaleKeys.features_news_categories.tr, Routes.NEWS_CATEGORY),
          _Button(LocaleKeys.features_press_releases.tr, Routes.PRESS_RELEASE),
          _Button(LocaleKeys.features_publications.tr, Routes.PUBLICATION),
          _Button(LocaleKeys.features_static_tables.tr, Routes.STATIC_TABLE),
          _Button(
            LocaleKeys.features_strategic_indicators.tr,
            Routes.STRATEGIC_INDICATOR,
          ),
          _Button(
            LocaleKeys.features_statistic_classifications.tr,
            Routes.STATISTIC_CLASSIFICATION,
          ),
          _Button(
            LocaleKeys.features_subject_categories.tr,
            Routes.SUBJECT_CATEGORY,
          ),
          _Button(LocaleKeys.features_subjects.tr, Routes.SUBJECT),
          _Button(LocaleKeys.features_units.tr, Routes.UNIT),
          _Button(LocaleKeys.features_variables.tr, Routes.VARIABLE),
          _Button(
            LocaleKeys.features_vertical_variables.tr,
            Routes.VERTICAL_VARIABLE,
          ),
        ],
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button(this.label, this.route);

  final String label;
  final String route;

  @override
  Widget build(BuildContext context) =>
      FilledButton(onPressed: () => Get.toNamed(route), child: Text(label));
}
