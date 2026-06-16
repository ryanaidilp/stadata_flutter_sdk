import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/trade/domain/enums/enums.dart';

/// Parameters for querying foreign trade data from the BPS `dataexim` endpoint.
class TradeParam extends BaseEntity {
  /// Creates a new [TradeParam] instance.
  const TradeParam({
    required this.source,
    required this.period,
    required this.hsCode,
    required this.hsType,
    required this.year,
  });

  /// Trade direction: export or import.
  ///
  /// Sent as the `sumber` query parameter.
  final TradeSource source;

  /// Reporting period aggregation type: monthly or annually.
  ///
  /// Sent as the `periode` query parameter.
  final TradePeriod period;

  /// HS commodity code to filter by.
  ///
  /// Sent as the `kodehs` query parameter.
  final String hsCode;

  /// HS code digit classification level.
  ///
  /// Sent as the `jenishs` query parameter.
  final HSCodeType hsType;

  /// Year to filter by (e.g. "2023").
  ///
  /// Sent as the `tahun` query parameter.
  final String year;

  @override
  List<Object?> get props => [source, period, hsCode, hsType, year];
}
