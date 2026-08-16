import 'package:stadata_flutter_sdk/src/core/core.dart';

/// Pagination entity
///
class const Pagination({
  /// Total Data
  required final int total,

  /// Current page
  final int page = 0,

  /// Total pages
  final int pages = 0,

  /// Count of data in current page
  final int? count,

  /// How much data per page
  final int? perPage,
}) extends BaseEntity {
  @override
  List<Object?> get props => [page, pages, total, count, perPage];
}
