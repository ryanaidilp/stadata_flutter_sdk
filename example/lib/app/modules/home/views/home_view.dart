import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:stadata_example/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stadata Example'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20.r),
        children: [
          Text(
            'List',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          8.verticalSpace,
          const _Button('Domains', Routes.DOMAIN),
          const _Button('Infographics', Routes.INFOGRAPHIC),
          const _Button('News', Routes.NEWS),
          const _Button('News Categories', Routes.NEWS_CATEGORY),
          const _Button('Press Releases', Routes.PRESS_RELEASE),
          const _Button('Publications', Routes.PUBLICATION),
          const _Button('Static Tables', Routes.STATIC_TABLE),
          const _Button('Strategic Indicators', Routes.STRATEGIC_INDICATOR),
          const _Button('Subject Categories', Routes.SUBJECT_CATEGORY),
          const _Button('Subjects', Routes.SUBJECT),
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
  Widget build(BuildContext context) => FilledButton(
        onPressed: () => Get.toNamed(route),
        child: Text(label),
      );
}
