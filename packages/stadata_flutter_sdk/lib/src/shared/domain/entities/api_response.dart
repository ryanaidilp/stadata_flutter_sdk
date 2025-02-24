import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class ApiResponse<T> extends BaseEntity {
  const ApiResponse({
    required this.status,
    this.dataAvailability = DataAvailability.notAvailable,
    this.message,
    this.data,
    this.pagination,
  });

  final String? message;
  final DataAvailability? dataAvailability;
  final bool status;
  final T? data;
  final Pagination? pagination;

  @override
  List<Object?> get props => [
    status,
    message,
    data,
    pagination,
    dataAvailability,
  ];
}
