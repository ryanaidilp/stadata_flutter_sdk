import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stadata_example/app/shared/widgets/network_image.dart';

class PressReleaseCard extends StatelessWidget {
  const PressReleaseCard({
    super.key,
    required this.cover,
    required this.title,
    this.onTap,
  });

  final String cover;
  final String title;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Material(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10.r),
        child: Stack(
          children: [
            AppNetworkImage(
              url: cover,
              width: 1.sw,
              height: 0.25.sh,
              fit: BoxFit.cover,
            ),
            Positioned(
              left: 0,
              bottom: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                  color: Colors.blueGrey.withValues(alpha: 0.8),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(10.r),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
