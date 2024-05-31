import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:reading_time/reading_time.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stadata_example/app/routes/app_pages.dart';
import 'package:stadata_example/app/shared/widgets/news_card.dart';
import 'package:stadata_example/app/utils/date_formatter.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

import '../controllers/news_controller.dart';

class NewsView extends GetView<NewsController> {
  const NewsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Page'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Custom Param',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            8.verticalSpace,
            TextFormField(
              maxLength: 4,
              onChanged: (value) {
                controller.domain.value = value;
                EasyDebounce.debounce(
                  'reloadNewsCategories',
                  const Duration(milliseconds: 500),
                  () {
                    controller.newsCategory.value = null;
                    controller.loadNewsCategories();
                  },
                );
              },
              keyboardType: TextInputType.number,
              initialValue: controller.domain.value,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: 'Domain (domain) - required',
              ),
            ),
            8.verticalSpace,
            Obx(
              () => DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  isDense: true,
                  labelText: 'Language (lang) - required',
                ),
                value: controller.selectedLang.value,
                items: DataLanguage.values
                    .map(
                      (e) => DropdownMenuItem<DataLanguage>(
                        value: e,
                        child: Text('${e.name} - ${e.value}'),
                      ),
                    )
                    .toList(),
                onChanged: (selectedType) {
                  if (selectedType == null) return;

                  controller.selectedLang.value = selectedType;
                  controller.newsCategory.value = null;
                  controller.loadNewsCategories();
                },
              ),
            ),
            8.verticalSpace,
            Obx(
              () => DropdownButtonFormField<NewsCategory?>(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  isDense: true,
                  labelText: 'Category - optional',
                ),
                value: controller.newsCategory.value,
                items: controller.newsCategories
                    .map(
                      (e) => DropdownMenuItem<NewsCategory>(
                        value: e,
                        child: Text(
                          '${e.id} - ${e.name}',
                          style: Theme.of(context).textTheme.bodySmall,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (category) {
                  controller.newsCategory.value = category;
                },
              ),
            ),
            8.verticalSpace,
            TextFormField(
              onChanged: (value) => controller.keyword.value = value,
              keyboardType: TextInputType.text,
              initialValue: controller.keyword.value,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: 'Keyword (keyword) - optional',
              ),
            ),
            16.verticalSpace,
            TextFormField(
              onChanged: (value) => controller.page.value = value,
              keyboardType: TextInputType.number,
              initialValue: controller.page.value,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: 'Page (page) - optional',
              ),
            ),
            16.verticalSpace,
            TextFormField(
              controller: controller.dateCtl,
              onTap: () async {
                final result = await showDatePicker(
                  context: context,
                  initialDate: controller.date.value ?? DateTime.now(),
                  firstDate: DateTime.now().subtract(
                    const Duration(
                      days: 365 * 5,
                    ),
                  ),
                  lastDate: DateTime.now(),
                );
                controller.date.value = result;
                controller.dateCtl.text = DateFormatter.formatDate(
                  'MMMM y',
                  result,
                );
              },
              readOnly: true,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: 'Month & Year (month & year) - optional',
              ),
            ),
            16.verticalSpace,
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  controller.loadNews();
                },
                child: const Text('Submit'),
              ),
            ),
            16.verticalSpace,
            Text(
              'Pagination',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            8.verticalSpace,
            controller.obx(
              (state) => IntrinsicHeight(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Text(
                        'Page : ${state?.pagination?.page ?? 0}',
                      ),
                      const VerticalDivider(
                        color: Colors.blueGrey,
                      ),
                      Text(
                        'Pages : ${state?.pagination?.pages ?? 0}',
                      ),
                      const VerticalDivider(
                        color: Colors.blueGrey,
                      ),
                      Text(
                        'Per Page : ${state?.pagination?.perPage ?? 0}',
                      ),
                      const VerticalDivider(
                        color: Colors.blueGrey,
                      ),
                      Text(
                        'Total : ${state?.pagination?.total ?? 0}',
                      ),
                    ],
                  ),
                ),
              ),
              onLoading: const Skeletonizer(
                enabled: true,
                child: IntrinsicHeight(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text(
                          'Page : ',
                        ),
                        VerticalDivider(
                          color: Colors.blueGrey,
                        ),
                        Text(
                          'Pages : ',
                        ),
                        VerticalDivider(
                          color: Colors.blueGrey,
                        ),
                        Text(
                          'Per Page : ',
                        ),
                        VerticalDivider(
                          color: Colors.blueGrey,
                        ),
                        Text(
                          'Total : ',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            16.verticalSpace,
            Text(
              'Result',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            16.verticalSpace,
            controller.obx(
              (state) => ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  if (state == null) {
                    return const SizedBox();
                  }
                  final news = state.data[index];
                  final readTime = readingTime(
                    Bidi.stripHtmlIfNeeded(news.content),
                  );
                  return NewsCard(
                    title: news.title,
                    category: news.category,
                    releaseDate: news.releaseDate,
                    content: news.content,
                    readTime: readTime.msg,
                    onPressed: () => Get.toNamed(
                      Routes.NEWS_DETAIL,
                      arguments: {
                        'id': news.id.toString(),
                        'lang': controller.selectedLang.value,
                        'domain': controller.domain.value,
                      },
                    ),
                  );
                },
                separatorBuilder: (_, __) => const Divider(),
                itemCount: state?.data.length ?? 0,
              ),
              onLoading: Skeletonizer(
                enabled: true,
                child: ListView.separated(
                  separatorBuilder: (_, __) => const Divider(),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (_, __) => NewsCard(
                    title: 'Contoh judul berita panjang',
                    releaseDate: DateTime.now(),
                    content: '<h1> Lorem ipsum dolor si amet </h1>',
                    readTime: '2 menit',
                    onPressed: () {},
                  ),
                  itemCount: 10,
                ),
              ),
              onError: (error) => Center(
                child: Text(
                  error.toString(),
                ),
              ),
              onEmpty: const Center(
                child: Text('Empty'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
