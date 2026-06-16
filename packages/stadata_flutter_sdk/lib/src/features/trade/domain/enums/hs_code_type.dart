/// Represents the HS (Harmonized System) code digit classification level
/// used in foreign trade data from BPS Web API.
///
/// Used as the `jenishs` query parameter when requesting trade data from
/// the `dataexim` endpoint.
enum HSCodeType {
  /// Two-digit HS code (jenishs = 1).
  twoDigit(value: 1),

  /// Full HS code (jenishs = 2).
  full(value: 2);

  const HSCodeType({required this.value});

  /// Creates a [HSCodeType] from its integer API value.
  ///
  /// Defaults to [twoDigit] if no matching value is found.
  factory HSCodeType.fromValue(int data) => values.firstWhere(
    (element) => element.value == data,
    orElse: () => HSCodeType.twoDigit,
  );

  /// The integer value sent to the BPS API as the `jenishs` query parameter.
  final int value;
}
