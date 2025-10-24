import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';

const _idKey = 'turvar_id';
const _nameKey = 'turvar';
const _groupIDKey = 'group_turvar_id';
const _groupNameKey = 'name_group_turvar';

/// Model class for [DerivedVariable] entity that handles JSON serialization.
///
/// This class extends [DerivedVariable] and provides methods to convert between
/// JSON data from the BPS API and the domain entity.
class DerivedVariableModel extends DerivedVariable {
  /// Creates a new [DerivedVariableModel] instance.
  const DerivedVariableModel({
    required super.id,
    required super.name,
    required super.groupID,
    required super.groupName,
  });

  /// Creates a [DerivedVariableModel] from JSON data.
  ///
  /// The JSON structure from BPS API:
  /// ```json
  /// {
  ///   "turvar_id": 3200,
  ///   "turvar": "Variable title",
  ///   "group_turvar_id": 1,
  ///   "name_group_turvar": "Wilayah Provinsi"
  /// }
  /// ```
  factory DerivedVariableModel.fromJson(JSON json) => DerivedVariableModel(
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

  /// Creates a [DerivedVariableModel] from a [DerivedVariable] entity.
  ///
  /// This is useful for converting domain entities back to models when needed
  /// for serialization or API communication.
  factory DerivedVariableModel.fromEntity(DerivedVariable variable) =>
      DerivedVariableModel(
        id: variable.id,
        name: variable.name,
        groupID: variable.groupID,
        groupName: variable.groupName,
      );

  /// Creates a copy of this model with the given fields replaced.
  DerivedVariableModel copyWith({
    int? id,
    String? name,
    int? groupID,
    String? groupName,
  }) => DerivedVariableModel(
    id: id ?? this.id,
    name: name ?? this.name,
    groupID: groupID ?? this.groupID,
    groupName: groupName ?? this.groupName,
  );
}
