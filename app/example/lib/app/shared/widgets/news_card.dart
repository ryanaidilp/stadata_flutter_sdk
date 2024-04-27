import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stadata_example/app/utils/date_formatter.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
    required this.onPressed,
    required this.title,
    required this.readTime,
    this.releaseDate,
    required this.content,
    this.category,
  });

  final String title;
  final String content;
  final String readTime;
  final String? category;
  final DateTime? releaseDate;
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withOpacity(Get.isDarkMode ? 0.6 : 0.1),
            blurRadius: 12,
          )
        ],
      ),
      child: Material(
        elevation: 0,
        color: theme.canvasColor,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(12.r),
          child: Padding(
            padding: EdgeInsets.all(16.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                4.verticalSpace,
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        DateFormatter.formatDate(
                          'EEEE, dd MMMM yyyy',
                          releaseDate,
                        ),
                        style: textTheme.bodySmall,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '#${category?.toLowerCase().replaceAll(' ', '')}',
                        style: textTheme.bodySmall,
                        textAlign: TextAlign.end,
                      ),
                    )
                  ],
                ),
                const Divider(),
                8.verticalSpace,
                HtmlWidget(
                  content,
                  textStyle: textTheme.bodySmall,
                ),
                8.verticalSpace,
                const Divider(),
                Row(
                  children: [
                    Skeleton.keep(
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: theme.colorScheme.primaryContainer,
                      ),
                    ),
                    4.horizontalSpace,
                    Skeleton.keep(
                      child: Text(
                        'Penulis',
                        style: textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        readTime,
                        style: textTheme.bodySmall,
                        textAlign: TextAlign.end,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
