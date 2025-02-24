// ignore_for_file: unused_element

import 'package:animate_do/animate_do.dart';
import 'package:drop_shadow/drop_shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stadata_example/app/shared/widgets/network_image.dart';
import 'package:stadata_example/app/utils/date_formatter.dart';
import 'package:stadata_example/generated/locales.g.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

import '../controllers/publication_detail_controller.dart';

class PublicationDetailView extends GetView<PublicationDetailController> {
  const PublicationDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            title: Text(LocaleKeys.page_publication_detail.tr),
            surfaceTintColor: theme.canvasColor,
            foregroundColor: Colors.black,
            centerTitle: true,
            pinned: true,
            floating: true,
            expandedHeight: 0.45.sh,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: controller.obx(
                (state) => Stack(
                  fit: StackFit.expand,
                  children: [
                    AppNetworkImage(
                      url: state?.cover ?? '',
                      width: 1.sw,
                      height: 1.sh,
                      fit: BoxFit.cover,
                      borderRadius: BorderRadius.zero,
                    ),
                    AnimatedContainer(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: theme.canvasColor.withValues(alpha: 0.8),
                      ),
                      duration: 500.milliseconds,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          32.verticalSpace,
                          DropShadow(
                            opacity: 0.8,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: _PublicationCoverWidget(
                                title: state?.title ?? '',
                                cover: state?.cover,
                              ),
                            ),
                          ),
                          16.verticalSpace,
                          FadeInDown(
                            from: 10,
                            child: _PublicationTitleWidget(title: state?.title),
                          ),
                          8.verticalSpace,
                          FadeInDown(
                            from: 10,
                            child: _PublicationReleaseDateWidget(
                              releaseDate: state?.releaseDate,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                onLoading: Skeletonizer(
                  enabled: true,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Skeleton.shade(
                        child: AppNetworkImage(
                          url:
                              'https://fikrirasyid.com/wp-content/uploads/2016/10/placeholder-portrait-9-16.jpg',
                          width: 1.sw,
                          height: 1.sh,
                          fit: BoxFit.cover,
                        ),
                      ),
                      AnimatedContainer(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: theme.canvasColor.withValues(alpha: 0.8),
                        ),
                        duration: 500.milliseconds,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            32.verticalSpace,
                            Skeleton.shade(
                              child: DropShadow(
                                opacity: 0.8,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: const _PublicationCoverWidget(
                                    title: 'Publication Title',
                                  ),
                                ),
                              ),
                            ),
                            16.verticalSpace,
                            SizedBox(
                              width: 0.9.sw,
                              child: const _PublicationTitleWidget(),
                            ),
                            8.verticalSpace,
                            SizedBox(
                              width: 0.25.sw,
                              child: const _PublicationReleaseDateWidget(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              constraints: BoxConstraints(minHeight: 0.5.sh),
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                color: theme.canvasColor,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: controller.obx(
                (state) => _PublicationDetailSection(
                  theme: theme,
                  textTheme: theme.textTheme,
                  publication: state,
                ),
                onLoading: Skeletonizer(
                  enabled: true,
                  child: _PublicationDetailSection(
                    theme: theme,
                    textTheme: theme.textTheme,
                    publication: null,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PublicationDetailSection extends StatelessWidget {
  const _PublicationDetailSection({
    required this.theme,
    required this.textTheme,
    this.publication,
  });

  final ThemeData theme;
  final TextTheme textTheme;
  final Publication? publication;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Flexible(
            child: SizedBox(
              width: 0.3.sw,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Skeleton.keep(
                    child: Text(
                      LocaleKeys.properties_publication_latest_update.tr,
                      style: textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  4.verticalSpace,
                  Row(
                    children: [
                      const Skeleton.shade(
                        child: Icon(Icons.edit_calendar_rounded),
                      ),
                      8.horizontalSpace,
                      Flexible(
                        child: FadeInUp(
                          from: 10,
                          child: _LastUpdateWidget(publication: publication),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          8.horizontalSpace,
          SizedBox(
            height: 40,
            child: VerticalDivider(
              width: 1,
              thickness: 2,
              color: theme.dividerColor,
            ),
          ),
          8.horizontalSpace,
          Flexible(
            child: SizedBox(
              width: 0.3.sw,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Skeleton.keep(
                    child: Text(
                      LocaleKeys.properties_publication_publication_number.tr,
                      style: textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  4.verticalSpace,
                  Row(
                    children: [
                      const Skeleton.shade(child: Icon(Icons.book_outlined)),
                      8.horizontalSpace,
                      Flexible(
                        child: FadeInUp(
                          from: 10,
                          child: _PublicationNumberWidget(
                            publication: publication,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          8.horizontalSpace,
          SizedBox(
            height: 40,
            child: VerticalDivider(
              width: 1,
              thickness: 2,
              color: theme.dividerColor,
            ),
          ),
          8.horizontalSpace,
          Flexible(
            child: SizedBox(
              width: 0.3.sw,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Skeleton.keep(
                    child: Text(
                      LocaleKeys.properties_publication_catalog_number.tr,
                      style: textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  4.verticalSpace,
                  Row(
                    children: [
                      const Skeleton.shade(
                        child: Icon(Icons.file_present_outlined),
                      ),
                      8.horizontalSpace,
                      Flexible(
                        child: FadeInUp(
                          from: 10,
                          child: _CatalogueNumberWidget(
                            publication: publication,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      const Divider(thickness: 1),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: SizedBox(
              width: 0.5.sw,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Skeleton.keep(
                    child: Text(
                      LocaleKeys.properties_publication_issn.tr,
                      style: textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  4.verticalSpace,
                  Row(
                    children: [
                      const Skeleton.shade(
                        child: Icon(Icons.confirmation_number_outlined),
                      ),
                      8.horizontalSpace,
                      FadeInUp(
                        from: 10,
                        child: _ISSNWidget(publication: publication),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          8.horizontalSpace,
          SizedBox(
            height: 40,
            child: VerticalDivider(
              width: 1,
              thickness: 2,
              color: theme.dividerColor,
            ),
          ),
          8.horizontalSpace,
          Flexible(
            child: SizedBox(
              width: 0.5.sw,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Skeleton.keep(
                    child: Text(
                      LocaleKeys.properties_publication_file_size.tr,
                      style: textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  4.verticalSpace,
                  Row(
                    children: [
                      const Skeleton.shade(
                        child: Icon(Icons.attach_file_sharp),
                      ),
                      8.horizontalSpace,
                      FadeInUp(
                        from: 10,
                        child: _FileSizeWidget(publication: publication),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      const Divider(thickness: 1),
      Skeleton.keep(
        child: Text(
          LocaleKeys.properties_publication_abstract.tr,
          style: textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w700),
        ),
      ),
      16.verticalSpace,
      FadeInUp(
        from: 5,
        child: HtmlWidget(
          publication?.abstract ?? '',
          textStyle: textTheme.bodySmall,
        ),
      ),
    ],
  );
}

class _PublicationTitleWidget extends StatelessWidget {
  const _PublicationTitleWidget({this.title, this.isFailed = false});

  final bool isFailed;
  final String? title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    if (isFailed) {
      return const Text('-');
    }

    return Text(
      title ?? 'Publication Title of 2023',
      style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
      maxLines: 2,
      textAlign: TextAlign.center,
    );
  }
}

class _PublicationCoverWidget extends StatelessWidget {
  const _PublicationCoverWidget({
    this.isFailed = false,
    required this.title,
    this.cover,
  });

  final bool isFailed;
  final String title;
  final String? cover;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Cover $title',
      child: AppNetworkImage(
        url:
            cover ??
            'https://fikrirasyid.com/wp-content/uploads/2016/10/placeholder-portrait-9-16.jpg',
        width: 0.25.sw,
        height: 0.18.sh,
      ),
    );
  }
}

class _CatalogueNumberWidget extends StatelessWidget {
  const _CatalogueNumberWidget({this.publication, this.isFailed = false});

  final bool isFailed;
  final Publication? publication;

  @override
  Widget build(BuildContext context) {
    if (isFailed) {
      return const Text('-');
    }

    return FittedBox(
      child: Text(publication?.catalogueNumber ?? 'xxxx-xx-xxxxx'),
    );
  }
}

class _LastUpdateWidget extends StatelessWidget {
  const _LastUpdateWidget({this.publication, this.isFailed = false});

  final bool isFailed;
  final Publication? publication;

  @override
  Widget build(BuildContext context) {
    if (isFailed) {
      return const Text('-');
    }

    return FittedBox(
      child: Text(
        DateFormatter.formatDate(
          'dd MMMM yyyy',
          publication?.updateDate,
          placeholder: LocaleKeys.properties_publication_no_update.tr,
        ),
      ),
    );
  }
}

class _PublicationReleaseDateWidget extends StatelessWidget {
  const _PublicationReleaseDateWidget({
    this.releaseDate,
    this.isFailed = false,
  });

  final bool isFailed;
  final DateTime? releaseDate;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    if (isFailed) {
      return const Text('-');
    }

    return Text(
      DateFormatter.formatDate(
        'dd MMMM yyyy',
        releaseDate,
        placeholder: 'dd MMMMMMM yyyy',
      ),
      style: textTheme.bodySmall,
      maxLines: 2,
      textAlign: TextAlign.center,
    );
  }
}

class _ISSNWidget extends StatelessWidget {
  const _ISSNWidget({this.publication, this.isFailed = false});

  final bool isFailed;
  final Publication? publication;

  @override
  Widget build(BuildContext context) {
    if (isFailed) {
      return const Text('-');
    }

    return FittedBox(child: Text(publication?.issn ?? 'xxxxxxxxxxx'));
  }
}

class _FileSizeWidget extends StatelessWidget {
  const _FileSizeWidget({this.publication, this.isFailed = false});

  final bool isFailed;
  final Publication? publication;

  @override
  Widget build(BuildContext context) {
    if (isFailed) {
      return const Text('-');
    }

    return FittedBox(child: Text(publication?.size ?? '0.0 MB'));
  }
}

class _PublicationNumberWidget extends StatelessWidget {
  const _PublicationNumberWidget({this.publication, this.isFailed = false});

  final bool isFailed;
  final Publication? publication;

  @override
  Widget build(BuildContext context) {
    if (isFailed) {
      return const Text('-');
    }

    return FittedBox(
      child: Text(publication?.publicationNumber ?? '093104081'),
    );
  }
}
