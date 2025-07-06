import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:stadata_example/generated/locales.g.dart';

class ErrorStateWidget extends StatelessWidget {
  const ErrorStateWidget({super.key, this.message, this.onRetry});

  final String? message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 64.r, color: Colors.red),
          16.verticalSpace,
          Text(
            LocaleKeys.label_census_error_occurred.tr,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: Colors.red),
          ),
          8.verticalSpace,
          Text(
            message ?? LocaleKeys.label_census_unknown_error.tr,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Colors.red),
            textAlign: TextAlign.center,
          ),
          if (onRetry != null) ...[
            16.verticalSpace,
            ElevatedButton(
              onPressed: onRetry,
              child: Text(LocaleKeys.button_submit.tr),
            ),
          ],
        ],
      ),
    );
  }
}
