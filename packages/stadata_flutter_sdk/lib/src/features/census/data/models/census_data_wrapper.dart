import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

const _dataKey = 'data';
const _statusKey = 'status';
const _dataCountKey = 'data_count';
const _timestampKey = 'timestamp';

/// Wrapper model for the special census data API response structure
///
/// The census data API returns a unique nested structure where the actual
/// data is wrapped in an object containing metadata like timestamp,
/// status code, and data count.
///
/// Example response structure:
/// ```json
/// {
///   "timestamp": "2025-07-05T03:27:35.662993711",
///   "status": 200,
///   "data_count": 432,
///   "data": [
///     // actual census data items here
///   ]
/// }
/// ```
class CensusDataWrapper extends BaseEntity {
  /// Creates a [CensusDataWrapper] with the specified properties
  const CensusDataWrapper({
    required this.status,
    required this.dataCount,
    required this.timestamp,
    required this.data,
  });

  /// HTTP status code from the API response
  final int status;

  /// Total count of data items in the response
  final int dataCount;

  /// Timestamp when the response was generated
  final DateTime timestamp;

  /// List of census data items
  final List<CensusDataModel> data;

  /// Creates a [CensusDataWrapper] from JSON
  factory CensusDataWrapper.fromJson(JSON json) {
    // Handle null or missing timestamp
    final timestampStr = json[_timestampKey] as String?;
    final timestamp =
        timestampStr != null
            ? DateTime.tryParse(timestampStr) ?? DateTime.now()
            : DateTime.now();

    // Safely handle data array
    final dataList = json[_dataKey] as List? ?? <dynamic>[];

    return CensusDataWrapper(
      status: (json[_statusKey] as num?)?.toInt() ?? 200,
      dataCount: (json[_dataCountKey] as num?)?.toInt() ?? 0,
      timestamp: timestamp,
      data: dataList.map((e) => CensusDataModel.fromJson(e as JSON)).toList(),
    );
  }

  /// Converts the wrapper to JSON
  JSON toJson() => {
    _statusKey: status,
    _dataCountKey: dataCount,
    _timestampKey: timestamp.toIso8601String(),
    _dataKey: data.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [status, dataCount, timestamp, data];
}
