/// Represents the reporting period type for foreign trade data from BPS Web API.
///
/// Used as the `periode` query parameter when requesting trade data from
/// the `dataexim` endpoint.
enum TradePeriod {
  /// Monthly trade data aggregation (periode = 1).
  monthly(value: 1),

  /// Annual trade data aggregation (periode = 2).
  annually(value: 2);

  const TradePeriod({required this.value});

  /// Creates a [TradePeriod] from its integer API value.
  ///
  /// Defaults to [monthly] if no matching value is found.
  factory TradePeriod.fromValue(int data) => values.firstWhere(
    (element) => element.value == data,
    orElse: () => TradePeriod.monthly,
  );

  /// The integer value sent to the BPS API as the `periode` query parameter.
  final int value;
}
