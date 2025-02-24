import 'package:stadata_flutter_sdk/src/core/core.dart';

/// Pagination entity
///
class Pagination extends BaseEntity {
  /// Constructor of Pagination
  const Pagination({
    required this.total,
    this.page = 0,
    this.pages = 0,
    this.count,
    this.perPage,
  });

  /// Current page
  final int page;

  /// Total pages
  final int pages;

  /// Total Data
  final int total;

  /// Count of data in current page
  final int? count;

  /// How much data per page
  final int? perPage;

  @override
  List<Object?> get props => [page, pages, total, count, perPage];
}
