import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stadata_example/app/utils/date_formatter.dart';
import '../controllers/static_table_detail_controller.dart';

class StaticTableDetailView extends GetView<StaticTableDetailController> {
  const StaticTableDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Static Table Detail'),
        centerTitle: true,
      ),
      body: Scrollbar(
        controller: controller.verticalCtl,
        scrollbarOrientation: ScrollbarOrientation.right,
        thickness: 4.sp,
        thumbVisibility: true,
        trackVisibility: true,
        child: SingleChildScrollView(
          controller: controller.verticalCtl,
          padding: EdgeInsets.all(16.r),
          physics: const BouncingScrollPhysics(),
          child: controller.obx(
            (state) => _StaticTableDetail(
              scrollCtl: controller.horizontalCtl,
              title: state!.title,
              table: state.table ?? '<h1>Hello</h1>',
              updatedAt: state.updatedAt,
            ),
            onLoading: Skeletonizer(
              enabled: true,
              child: _StaticTableDetail(
                scrollCtl: controller.horizontalCtl,
                title: 'This is example static table',
                table: '<h1>Hello</h1>',
                updatedAt: DateTime.now(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _StaticTableDetail extends StatelessWidget {
  const _StaticTableDetail({
    required this.title,
    required this.table,
    required this.updatedAt,
    required this.scrollCtl,
  });

  final String title;
  final String table;
  final DateTime updatedAt;
  final ScrollController scrollCtl;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          4.verticalSpace,
          Row(
            children: [
              const Skeleton.keep(
                child: Text('Updated At: '),
              ),
              4.horizontalSpace,
              Text(DateFormatter.formatDate('EEEE, dd MMMM yyyy', updatedAt)),
            ],
          ),
          16.verticalSpace,
          Scrollbar(
            controller: scrollCtl,
            scrollbarOrientation: ScrollbarOrientation.bottom,
            thickness: 4,
            trackVisibility: true,
            thumbVisibility: true,
            interactive: true,
            child: SingleChildScrollView(
              controller: scrollCtl,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: HtmlWidget(
                table,
                renderMode: RenderMode.column,
                textStyle: Theme.of(context).textTheme.bodySmall,
                onTapUrl: (url) async {
                  return true;
                },
              ),
            ),
          ),
        ],
      );
}
