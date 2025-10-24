import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

const _idKey = 'turth_id';
const _nameKey = 'turth';
const _groupIDKey = 'group_turth_id';
const _groupNameKey = 'name_group_turth';

/// Model class for [DerivedPeriod] entity that handles JSON serialization.
///
/// This class extends [DerivedPeriod] and provides methods to convert between
/// JSON data from the BPS API and the domain entity.
class DerivedPeriodModel extends DerivedPeriod {
  /// Creates a new [DerivedPeriodModel] instance.
  const DerivedPeriodModel({
    required super.id,
    required super.name,
    required super.groupID,
    required super.groupName,
  });

  /// Creates a [DerivedPeriodModel] from JSON data.
  ///
  /// The JSON structure from BPS API:
  /// ```json
  /// {
  ///   "turth_id": 1,
  ///   "turth": "2020",
  ///   "group_turth_id": 1,
  ///   "name_group_turth": "Tahunan"
  /// }
  /// ```
  factory DerivedPeriodModel.fromJson(JSON json) => DerivedPeriodModel(
    id: json[_idKey] as int,
    name: json[_nameKey] as String,
    groupID: json[_groupIDKey] as int,
    groupName: json[_groupNameKey] as String,
  );

  /// Converts this model to JSON format.
  ///
  /// Returns a map that can be serialized to JSON matching the BPS API format.
  JSON toJson() => {
    _idKey: id,
    _nameKey: name,
    _groupIDKey: groupID,
    _groupNameKey: groupName,
  };

  /// Creates a [DerivedPeriodModel] from a [DerivedPeriod] entity.
  ///
  /// This is useful for converting domain entities back to models when needed
  /// for serialization or API communication.
  factory DerivedPeriodModel.fromEntity(DerivedPeriod period) =>
      DerivedPeriodModel(
        id: period.id,
        name: period.name,
        groupID: period.groupID,
        groupName: period.groupName,
      );

  /// Creates a copy of this model with the given fields replaced.
  DerivedPeriodModel copyWith({
    int? id,
    String? name,
    int? groupID,
    String? groupName,
  }) => DerivedPeriodModel(
    id: id ?? this.id,
    name: name ?? this.name,
    groupID: groupID ?? this.groupID,
    groupName: groupName ?? this.groupName,
  );
}
