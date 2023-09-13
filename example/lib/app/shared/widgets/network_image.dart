import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AppNetworkImage extends StatelessWidget {
  const AppNetworkImage({
    super.key,
    required this.url,
    required this.width,
    required this.height,
    this.borderRadius,
  });

  final String url;
  final double width;
  final double height;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(12),
      child: ExtendedImage.network(
        url,
        width: width,
        height: height,
        fit: BoxFit.fill,
        borderRadius: borderRadius ?? BorderRadius.circular(12),
        border: Border.all(
          color: theme.dividerColor,
        ),
        clearMemoryCacheWhenDispose: true,
        enableLoadState: true,
        loadStateChanged: (state) {
          switch (state.extendedImageLoadState) {
            case LoadState.loading:
              return Skeletonizer(
                child: SizedBox(
                  width: width,
                  height: height,
                ),
              );
            case LoadState.completed:
              return state.completedWidget;
            case LoadState.failed:
              return Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  color: theme.disabledColor.withOpacity(0.02),
                ),
                child: Center(
                  child: IconButton(
                    onPressed: state.reLoadImage,
                    icon: Icon(
                      Icons.refresh,
                      color: theme.colorScheme.primary,
                      size: 16,
                    ),
                  ),
                ),
              );
          }
        },
      ),
    );
  }
}
