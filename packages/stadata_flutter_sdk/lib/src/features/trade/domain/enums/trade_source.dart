/// Represents the source (direction) of foreign trade data from BPS Web API.
///
/// Used as the `sumber` query parameter when requesting trade data from
/// the `dataexim` endpoint.
enum TradeSource {
  /// Export trade data (sumber = 1).
  export(value: 1),

  /// Import trade data (sumber = 2).
  ///
  /// Named `import_` to avoid conflict with the Dart `import` keyword.
  import_(value: 2);

  const TradeSource({required this.value});

  /// Creates a [TradeSource] from its integer API value.
  ///
  /// Defaults to [export] if no matching value is found.
  factory TradeSource.fromValue(int data) => values.firstWhere(
    (element) => element.value == data,
    orElse: () => TradeSource.export,
  );

  /// The integer value sent to the BPS API as the `sumber` query parameter.
  final int value;
}
