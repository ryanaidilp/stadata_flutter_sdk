// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/entities/pagination.dart';
import 'package:stadata_flutter_sdk/src/shared/domain/enums/data_availability.dart';

class ApiResponse<T> extends Equatable {
  const ApiResponse({
    required this.status,
    required this.dataAvailability,
    this.message,
    this.data,
    this.pagination,
  });

  final String? message;
  final DataAvailability dataAvailability;
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
