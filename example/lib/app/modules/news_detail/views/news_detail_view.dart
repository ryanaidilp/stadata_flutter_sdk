import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stadata_example/app/shared/widgets/network_image.dart';
import 'package:stadata_example/app/utils/date_formatter.dart';

import '../controllers/news_detail_controller.dart';

class NewsDetailView extends GetView<NewsDetailController> {
  const NewsDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail News'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            controller.obx(
              (state) => AppNetworkImage(
                url: state!.picture,
                width: 1.sw,
                fit: BoxFit.cover,
                height: 0.6.sh,
                borderRadius: BorderRadius.zero,
              ),
              onLoading: Skeletonizer(
                enabled: true,
                child: Container(
                  color: Colors.grey,
                  width: double.infinity,
                  height: 0.6.sh,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 16.h,
                horizontal: 8.w,
              ),
              child: controller.obx(
                (state) => _NewsSection(
                  title: state!.title,
                  releaseDate: state.releaseDate,
                  content: state.content,
                ),
                onLoading: Skeletonizer(
                  enabled: true,
                  child: _NewsSection(
                    title: 'A Very Long News Title',
                    releaseDate: DateTime.now(),
                    content: 'Lorem ipsum dolor sit amet',
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _NewsSection extends StatelessWidget {
  const _NewsSection({
    required this.title,
    required this.releaseDate,
    required this.content,
  });

  final String title;
  final DateTime releaseDate;
  final String content;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textTheme.displaySmall,
        ),
        8.verticalSpace,
        Row(
          children: [
            CircleAvatar(
              radius: 15.r,
            ),
            4.horizontalSpace,
            const Text('Penulis'),
            Expanded(
              child: Text(
                DateFormatter.formatDate(
                  'EEEE, dd MMMM y',
                  releaseDate,
                ),
                textAlign: TextAlign.end,
              ),
            )
          ],
        ),
        const Divider(),
        HtmlWidget(
          content,
          renderMode: RenderMode.column,
          textStyle: textTheme.bodySmall,
        ),
      ],
    );
  }
}
