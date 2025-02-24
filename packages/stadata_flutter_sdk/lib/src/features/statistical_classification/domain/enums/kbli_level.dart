import 'package:stadata_flutter_sdk/src/features/features.dart';

/// `KBLILevel` enumerates levels of economic activity classification in the
/// KBLI (Klasifikasi Baku Lapangan Usaha Indonesia), which structures business
/// activities in Indonesia into a detailed hierarchy. This hierarchy aids in
/// precise identification and categorization of business functions for statistical
/// analysis and policy development.
///
/// Enum breakdown:
/// - `category`: Broadest level, each represented by a single letter (A-U),
///   covering major sectors such as Agriculture and Services.
/// - `primaryGroup`: Adds a numeric digit to categories for more specific primary
///   groups, using a two-character code.
/// - `group`: Adds another digit for a three-character code, detailing specific
///   economic activities within primary groups.
/// - `subGroup`: Further refinement with a four-character code, breaking down groups
///   into finer categories.
/// - `cluster`: Most detailed, using a five-character code to define highly specific
///   economic activities.
///
/// This enumeration supports methods to validate KBLI codes to ensure they match
/// the expected hierarchical format, crucial for maintaining data integrity across
/// analytical and statistical outputs.
enum KBLILevel implements ClassificationLevel {
  /// Represents the main economic classification,
  /// coded with a single alphabet letter.
  category('kategori'),

  /// Detailed description from category, each coded with two digits.
  primaryGroup('golongan pokok'),

  /// Further details from the primary group, each coded with three digits.
  /// The first two indicate the primary group and the last digit the economic
  /// activity.
  group('golongan'),

  /// Further detail from a group's economic activities, coded with four digits.
  /// The first three indicate the group and the last digit specifies the sub-group.
  subGroup('subgolongan'),

  /// Distinguishes activities within a subgroup into more homogeneous
  /// activities, coded with five digits.
  cluster('kelompok');

  const KBLILevel(this.value);

  /// Factory constructor to convert a string value into a corresponding enum
  /// value. If the provided `data` does not match any existing value, defaults
  /// to `category`.
  factory KBLILevel.fromValue(String data) => values.firstWhere(
    (element) => element.value.toLowerCase() == data,
    orElse: () => KBLILevel.category,
  );

  /// Validates a KBLI code based on the classification level.
  /// Checks if the code conforms to the expected format (e.g., one alphabet
  /// followed by specific numbers of digits).
  @override
  bool validateCode(String code) =>
  // Applying regex based on KBLILevel
  switch (this) {
    KBLILevel.category => RegExp(r'^[A-U]$').hasMatch(code),
    KBLILevel.primaryGroup => RegExp(r'^[A-U]\d{1}$').hasMatch(code),
    KBLILevel.group => RegExp(r'^[A-U]\d{2}$').hasMatch(code),
    KBLILevel.subGroup => RegExp(r'^[A-U]\d{3}$').hasMatch(code),
    KBLILevel.cluster => RegExp(r'^[A-U]\d{4}$').hasMatch(code),
  };

  @override
  final String value;
}
