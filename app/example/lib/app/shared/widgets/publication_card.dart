import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stadata_example/app/shared/widgets/network_image.dart';
import 'package:stadata_example/app/utils/date_formatter.dart';

class PublicationCard extends StatelessWidget {
  const PublicationCard({
    super.key,
    this.onDetail,
    required this.cover,
    required this.title,
    required this.issn,
    this.releaseDate,
    required this.size,
  });

  final String cover;
  final String title;
  final String issn;
  final DateTime? releaseDate;
  final String size;
  final GestureTapCallback? onDetail;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Container(
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: theme.canvasColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Skeleton.shade(
            child: AppNetworkImage(url: cover, width: 0.3.sw, height: 0.2.sh),
          ),
          16.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                  ),
                ),
                16.verticalSpace,
                Text(
                  'ISSN : $issn',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.labelSmall,
                ),
                16.verticalSpace,
                Row(
                  children: [
                    Skeleton.shade(
                      child: Icon(
                        Icons.calendar_month,
                        color: theme.hintColor,
                        size: 16,
                      ),
                    ),
                    4.horizontalSpace,
                    Expanded(
                      child: Text(
                        DateFormatter.formatDate(
                          'EEEE, dd MMM y',
                          releaseDate,
                          placeholder: 'Friday, 02 May 2022',
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.labelSmall,
                      ),
                    ),
                  ],
                ),
                8.verticalSpace,
                Row(
                  children: [
                    Skeleton.shade(
                      child: Icon(
                        Icons.file_download,
                        color: theme.hintColor,
                        size: 16,
                      ),
                    ),
                    4.horizontalSpace,
                    Expanded(
                      child: Text(
                        size,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.labelSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                8.verticalSpace,
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: onDetail,
                    child: const Skeleton.keep(child: Text('Details')),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
