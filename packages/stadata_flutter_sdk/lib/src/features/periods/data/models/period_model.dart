import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

const _idKey = 'th_id';
const _yearKey = 'th';

/// Model class for [Period] entity that handles JSON serialization.
///
/// This class extends [Period] and provides methods to convert between
/// JSON data from the BPS API and the domain entity.
class PeriodModel extends Period {
  /// Creates a new [PeriodModel] instance.
  const PeriodModel({
    required super.id,
    required super.year,
  });

  /// Creates a [PeriodModel] from JSON data.
  ///
  /// The JSON structure from BPS API:
  /// ```json
  /// {
  ///   "th_id": 117,
  ///   "th": 2017
  /// }
  /// ```
  factory PeriodModel.fromJson(JSON json) => PeriodModel(
    id: json[_idKey] as int,
    year: json[_yearKey] as int,
  );

  /// Converts this model to JSON format.
  ///
  /// Returns a map that can be serialized to JSON matching the BPS API format.
  JSON toJson() => {
    _idKey: id,
    _yearKey: year,
  };

  /// Creates a [PeriodModel] from a [Period] entity.
  ///
  /// This is useful for converting domain entities back to models when needed
  /// for serialization or API communication.
  factory PeriodModel.fromEntity(Period period) => PeriodModel(
    id: period.id,
    year: period.year,
  );

  /// Creates a copy of this model with the given fields replaced.
  PeriodModel copyWith({
    int? id,
    int? year,
  }) => PeriodModel(
    id: id ?? this.id,
    year: year ?? this.year,
  );
}
