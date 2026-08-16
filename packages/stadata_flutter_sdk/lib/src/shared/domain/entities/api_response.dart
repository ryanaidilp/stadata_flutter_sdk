import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

class const ApiResponse<T>({
  required final bool status,
  final DataAvailability? dataAvailability = DataAvailability.notAvailable,
  final String? message,
  final T? data,
  final Pagination? pagination,
}) extends BaseEntity {
  @override
  List<Object?> get props => [
    status,
    message,
    data,
    pagination,
    dataAvailability,
  ];
}
