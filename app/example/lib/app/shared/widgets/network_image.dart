import 'package:animate_do/animate_do.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AppNetworkImage extends StatelessWidget {
  const AppNetworkImage({
    super.key,
    required this.url,
    this.width,
    this.height,
    this.fit = BoxFit.fill,
    this.borderRadius,
  });

  final String url;
  final double? width;
  final double? height;
  final BoxFit fit;
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
        fit: fit,
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
                child: Container(
                  color: Colors.grey,
                  width: width,
                  height: height,
                ),
              );
            case LoadState.completed:
              return FadeIn(
                duration: const Duration(
                  milliseconds: 500,
                ),
                child: state.completedWidget,
              );
            case LoadState.failed:
              return Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  color: theme.disabledColor.withValues(alpha: 0.02),
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
