import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:stadata_example/generated/locales.g.dart';

class InitialStateWidget extends StatelessWidget {
  const InitialStateWidget({
    super.key,
    this.icon = Icons.analytics_outlined,
    this.title,
    this.subtitle,
  });

  final IconData icon;
  final String? title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 64.r, color: Colors.blueGrey),
          16.verticalSpace,
          Text(
            title ?? LocaleKeys.label_census_ready_to_explore.tr,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: Colors.blueGrey),
          ),
          8.verticalSpace,
          Text(
            subtitle ?? LocaleKeys.label_census_select_instructions.tr,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Colors.blueGrey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
