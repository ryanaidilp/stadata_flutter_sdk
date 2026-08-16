import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

/// Represents a result containing a list of data items of type [T] along with
/// optional pagination information.
///
/// The [ListResult] class is used to encapsulate a list of data items, such as
/// items fetched from an API,
/// along with optional pagination details when applicable.
///
/// - [data]: A list of data items of type [T].
/// - [dataAvailability]: Availability of the data
/// - [pagination]: Optional pagination information, typically used to navigate
/// through a large dataset.
class const ListResult<T>({
  /// The list of data items of type [T].
  required final List<T> data,

  /// Availability of the data
  required final DataAvailability dataAvailability,

  /// Optional pagination information, typically used to navigate through
  ///  a large dataset.
  final Pagination? pagination,
}) extends BaseEntity {
  @override
  List<Object?> get props => [data, dataAvailability, pagination];
}
