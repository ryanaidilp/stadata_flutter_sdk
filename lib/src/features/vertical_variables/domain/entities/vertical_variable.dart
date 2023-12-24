import 'package:equatable/equatable.dart';

/// `VerticalVariable` is a data model class representing a vertical variable
/// retrieved from the BPS (Badan Pusat Statistik) API endpoint.
///
/// This class maps the JSON data returned by the BPS API, specifically from
/// the endpoint documented at: https://webapi.bps.go.id/documentation/#dynamicdata_7
/// The JSON structure typically contains fields like 'kode_ver_id', 'vervar',
/// etc., which correspond to various aspects of a statistical variable.
///
class VerticalVariable extends Equatable {
  /// Constructs an instance of [VerticalVariable].
  ///
  /// This constructor maps the fields from the API response to the properties
  /// of this class, enabling the representation of vertical variable data
  /// within the application.
  ///
  /// Parameters:
  /// - [id]: Unique identifier for the vertical variable ('kode_ver_id').
  /// - [title]: Descriptive title of the variable ('vervar').
  /// - [itemID]: Specific identifier for an item within the variable
  ///   ('item_ver_id').
  /// - [groupID]: Identifier for the group the variable belongs to
  ///   ('group_ver_id').
  /// - [groupName]: Name of the group associated with the variable
  ///   ('name_group_ver_id').
  const VerticalVariable({
    required this.id,
    required this.title,
    required this.itemID,
    required this.groupID,
    required this.groupName,
  });

  /// [id]: 'kode_ver_id' in the API response.
  /// This is a unique identifier for the vertical variable.
  final int id;

  /// [title]: 'vervar' in the API response.
  /// This represents the name or title of the vertical variable.
  final String title;

  /// [itemID]: 'item_ver_id' in the API response.
  /// It specifies a particular item or element within the vertical variable.
  final int itemID;

  /// [groupID]: 'group_ver_id' in the API response.
  /// This identifies the group to which the variable belongs.
  final int groupID;

  /// [groupName]: 'name_group_ver_id' in the API response.
  /// It indicates the name of the group associated with the variable.
  final String groupName;

  @override
  List<Object> get props {
    return [
      id,
      title,
      itemID,
      groupID,
      groupName,
    ];
  }
}
