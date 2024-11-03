// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

const _totalKey = 'total';
const _pageKey = 'page';
const _pagesKey = 'pages';
const _perPageKey = 'per_page';
const _countKey = 'count';

class PaginationModel extends Pagination {
  const PaginationModel({
    required super.total,
    super.page = 0,
    super.pages = 0,
    super.perPage,
    super.count,
  });

  factory PaginationModel.fromJson(JSON json) => PaginationModel(
        total: json[_totalKey] as int,
        page: json[_pageKey] as int,
        pages: json[_pagesKey] as int,
        perPage: json[_perPageKey] as int?,
        count: json[_countKey] as int?,
      );

  JSON toJson() => {
        _totalKey: total,
        _pageKey: page,
        _pagesKey: pages,
        _perPageKey: perPage,
        _countKey: count,
      };

  PaginationModel copyWith({
    int? page,
    int? pages,
    int? total,
    ValueGetter<int?>? count,
    ValueGetter<int?>? perPage,
  }) =>
      PaginationModel(
        page: page ?? this.page,
        pages: pages ?? this.pages,
        total: total ?? this.total,
        count: count != null ? count() : this.count,
        perPage: perPage != null ? perPage() : this.perPage,
      );
}
