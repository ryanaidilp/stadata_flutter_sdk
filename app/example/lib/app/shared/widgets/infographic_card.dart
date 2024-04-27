import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:stadata_example/app/shared/widgets/network_image.dart';

class InfographicCard extends StatelessWidget {
  const InfographicCard({
    super.key,
    required this.title,
    required this.image,
    this.description,
  });

  final String title;

  final String image;

  final String? description;

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          AppNetworkImage(
            url: image,
            width: 1.sw,
            height: 0.6.sh,
          ),
          Positioned(
            bottom: 1,
            left: 0,
            right: 0,
            child: Container(
              height: 0.1.sh,
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(8.r),
                ),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black54,
                    Colors.black,
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    description == null || description!.isEmpty
                        ? '---'
                        : Bidi.stripHtmlIfNeeded(description!),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          )
        ],
      );
}
