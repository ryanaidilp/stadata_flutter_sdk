import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/dynamic_tables/domain/entities/entities.dart';

const _periodKey = 'label';
const _valuesKey = 'datacontent';

/// Data model implementation of [DynamicTableData] entity.
///
/// Handles JSON serialization/deserialization for dynamic table data
/// from the BPS API. Each instance represents a single time period
/// with its associated vertical variable values.
class DynamicTableDataModel extends DynamicTableData {
  /// Creates a new [DynamicTableDataModel] instance.
  const DynamicTableDataModel({
    required super.period,
    required super.values,
  });

  /// Creates a [DynamicTableDataModel] from JSON response.
  ///
  /// Expects JSON structure:
  /// ```json
  /// {
  ///   "label": "2023",
  ///   "datacontent": {
  ///     "1234": "75.5",
  ///     "5678": "82.3"
  ///   }
  /// }
  /// ```
  factory DynamicTableDataModel.fromJson(JSON json) => DynamicTableDataModel(
    period: json[_periodKey] as String,
    values: json[_valuesKey] as Map<String, dynamic>? ?? {},
  );

  /// Converts this model to JSON format.
  JSON toJson() => {
    _periodKey: period,
    _valuesKey: values,
  };

  /// Creates a copy of this model with the given fields replaced.
  DynamicTableDataModel copyWith({
    String? period,
    Map<String, dynamic>? values,
  }) => DynamicTableDataModel(
    period: period ?? this.period,
    values: values ?? this.values,
  );
}
