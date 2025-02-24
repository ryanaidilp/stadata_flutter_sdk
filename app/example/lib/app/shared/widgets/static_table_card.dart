import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stadata_example/app/utils/date_formatter.dart';

class StaticTableCard extends StatelessWidget {
  const StaticTableCard({
    super.key,
    required this.onTap,
    required this.title,
    required this.updatedAt,
    required this.size,
  });

  final GestureTapCallback onTap;
  final String title;
  final String size;
  final DateTime updatedAt;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            8.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormatter.formatDate('EEEE, dd MMMM yyyy', updatedAt),
                  style: textTheme.bodySmall,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Skeleton.shade(child: Icon(Icons.file_download)),
                      4.horizontalSpace,
                      Text(size),
                    ],
                  ),
                ),
              ],
            ),
            16.verticalSpace,
            Skeleton.keep(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onTap,
                  child: const Text('Detail'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
