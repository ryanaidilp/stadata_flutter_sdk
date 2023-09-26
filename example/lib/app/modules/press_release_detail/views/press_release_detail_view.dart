import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stadata_example/app/shared/widgets/network_image.dart';
import 'package:stadata_example/app/utils/date_formatter.dart';

import '../controllers/press_release_detail_controller.dart';

class PressReleaseDetailView extends GetView<PressReleaseDetailController> {
  const PressReleaseDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Press Release Detail'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            controller.obx(
              (state) => AppNetworkImage(
                url: state!.cover,
                width: 1.sw,
                height: 0.25.sh,
                borderRadius: BorderRadius.zero,
              ),
              onLoading: Skeletonizer(
                enabled: true,
                child: AppNetworkImage(
                  url:
                      'https://fikrirasyid.com/wp-content/uploads/2016/10/placeholder-portrait-9-16.jpg',
                  width: 1.sw,
                  height: 0.25.sh,
                  borderRadius: BorderRadius.zero,
                ),
              ),
            ),
            16.verticalSpace,
            controller.obx(
                (state) => _PressReleaseDetailSection(
                      title: state!.title,
                      abstract: state.abstract ?? '',
                      fileSize: state.size,
                      updatedAt: state.updatedAt,
                      releaseDate: state.releaseDate,
                      pdfUrl: state.pdf,
                      slideUrl: state.slide,
                    ),
                onLoading: Skeletonizer(
                  enabled: true,
                  child: _PressReleaseDetailSection(
                    title:
                        'Title of Press Release Title of Press Release Title of Press Release',
                    abstract: 'Lorem ipsum dolor',
                    fileSize: '18 MB',
                    releaseDate: DateTime.now(),
                    pdfUrl: 'urlurlurlurlurlurlurlurlurlurlurlurlurl',
                    slideUrl: 'urlurlurlurlurlurlurlurlurlurlurlurlurl',
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class _PressReleaseDetailSection extends StatelessWidget {
  const _PressReleaseDetailSection({
    required this.title,
    required this.abstract,
    required this.fileSize,
    required this.releaseDate,
    required this.pdfUrl,
    required this.slideUrl,
    this.updatedAt,
  });

  final String title;
  final String abstract;
  final String fileSize;
  final DateTime? updatedAt;
  final DateTime releaseDate;
  final String pdfUrl;
  final String slideUrl;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Padding(
      padding: EdgeInsets.all(16.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: textTheme.titleLarge,
          ),
          16.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: Skeleton.keep(
                  child: Text('Release Date :'),
                ),
              ),
              Expanded(
                child: Text(
                  DateFormatter.formatDate('EEEE, dd MMMM y', releaseDate),
                  maxLines: 1,
                  style: textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          8.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: Skeleton.keep(
                  child: Text('Updated Date :'),
                ),
              ),
              Expanded(
                child: Text(
                  DateFormatter.formatDate(
                    'EEEE, dd MMMM y',
                    updatedAt,
                    placeholder: 'No Changes Made',
                  ),
                  maxLines: 1,
                  style: textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                flex: 2,
                child: Skeleton.keep(
                  child: Text('PDF Url :'),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  pdfUrl,
                  maxLines: 1,
                  style: textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Expanded(
                flex: 1,
                child: Skeleton.keep(
                  child: IconButton.filled(
                    onPressed: () {
                      Clipboard.setData(
                        ClipboardData(text: pdfUrl),
                      );
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Link berhasil disalin!'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.copy,
                      size: 16.sp,
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                flex: 2,
                child: Skeleton.keep(
                  child: Text('Slide Url :'),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  slideUrl,
                  maxLines: 1,
                  style: textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Expanded(
                flex: 1,
                child: Skeleton.keep(
                  child: IconButton.filled(
                    onPressed: () {
                      Clipboard.setData(
                        ClipboardData(text: slideUrl),
                      );
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Link berhasil disalin!'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.copy,
                      size: 16.sp,
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                flex: 2,
                child: Skeleton.keep(
                  child: Text('File Size : '),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  fileSize,
                  maxLines: 1,
                  style: textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Expanded(
                flex: 1,
                child: Skeleton.keep(
                  child: IconButton.filled(
                    onPressed: () {},
                    icon: Icon(
                      Icons.file_download,
                      size: 18.sp,
                    ),
                  ),
                ),
              )
            ],
          ),
          const Divider(),
          HtmlWidget(
            abstract,
            textStyle: textTheme.bodySmall,
          )
        ],
      ),
    );
  }
}
