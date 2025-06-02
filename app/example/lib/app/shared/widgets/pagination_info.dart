import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:stadata_example/generated/locales.g.dart';

class PaginationInfo extends StatelessWidget {
  const PaginationInfo({
    super.key,
    required this.page,
    required this.pages,
    required this.perPage,
    required this.total,
  });

  final int page;
  final int pages;
  final int perPage;
  final int total;

  const PaginationInfo.skeleton({
    super.key,
    this.page = 0,
    this.total = 0,
    this.pages = 0,
    this.perPage = 0,
  });

  @override
  Widget build(BuildContext context) => IntrinsicHeight(
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Text(LocaleKeys.label_pagination_page.trParams({'page': '$page'})),
          const VerticalDivider(color: Colors.blueGrey),
          Text(LocaleKeys.label_pagination_pages.trParams({'pages': '$pages'})),
          const VerticalDivider(color: Colors.blueGrey),
          Text(
            LocaleKeys.label_pagination_per_page.trParams({
              'per_page': '$perPage',
            }),
          ),
          const VerticalDivider(color: Colors.blueGrey),
          Text(LocaleKeys.label_pagination_total.trParams({'total': '$total'})),
          const VerticalDivider(color: Colors.blueGrey),
        ],
      ),
    ),
  );
}
