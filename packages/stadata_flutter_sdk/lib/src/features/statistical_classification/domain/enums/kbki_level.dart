import 'package:stadata_flutter_sdk/src/features/features.dart';

/// An enumeration representing different classification levels of the
/// Klasifikasi Baku Komoditas Indonesia (KBKI).
///
/// KBKI provides a hierarchical classification of commodities, starting from
/// broad sectors to more specific categories. Each level in this hierarchy
/// is assigned a specific format and number of digits that helps in identifying
/// the detail and granularity of the classification.
///
/// Each enum value represents a specific level in the hierarchy, with an
/// associated code format:
/// - `section`: Represents the broadest classification level with a 1-digit code.
/// - `division`: A more detailed level than `section`, with a 2-digit code.
/// - `group`: Further detail within a division, represented by a 3-digit code.
/// - `classes`: More specific than group, represented by a 4-digit code.
/// - `subClass`: A detailed categorization within a class, using a 5-digit code.
/// - `commodityGroup`: Represents detailed groups within sub-classes, with a 7-digit code.
/// - `commodity`: The most detailed level, representing specific commodities with a 10-digit code.
///
/// Each level provides a unique and systematic approach to the classification
/// of commodities as per Indonesian standards.
enum KBKILevel implements ClassificationLevel {
  /// General classification outline, 1-digit code, 5 sections, 0-4.
  section('seksi'),

  /// Detailed description from section, 2-digit code.
  division('divisi'),

  /// Further details from division, 3-digit code.
  group('kelompok'),

  /// Further details from group, 4-digit code.
  classes('kelas'),

  /// Detailed from classes, 5-digit code.
  subClass('subkelas'),

  /// Detailed from sub-classes, 7-digit code for commodity group.
  commodityGroup('kelompok komoditas'),

  /// Detailed from commodity group, 10-digit code for commodities.
  commodity('komoditas');

  const KBKILevel(this.value);

  factory KBKILevel.fromValue(String data) => values.firstWhere(
    (element) => element.value.toLowerCase() == data,
    orElse: () => KBKILevel.section,
  );

  /// Validates a KBKI code based on the classification level.
  @override
  bool validateCode(String code) => switch (this) {
    KBKILevel.section => RegExp(r'^\d{1}$').hasMatch(code),
    KBKILevel.division => RegExp(r'^\d{2}$').hasMatch(code),
    KBKILevel.group => RegExp(r'^\d{3}$').hasMatch(code),
    KBKILevel.classes => RegExp(r'^\d{4}$').hasMatch(code),
    KBKILevel.subClass => RegExp(r'^\d{5}$').hasMatch(code),
    KBKILevel.commodityGroup => RegExp(r'^\d{7}$').hasMatch(code),
    KBKILevel.commodity => RegExp(r'^\d{10}$').hasMatch(code),
  };

  @override
  final String value;
}
