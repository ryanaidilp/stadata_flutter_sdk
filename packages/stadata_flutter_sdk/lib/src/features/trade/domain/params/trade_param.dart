import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/trade/domain/enums/enums.dart';

/// Parameters for querying foreign trade data from the BPS `dataexim` endpoint.
class const TradeParam({
  /// Trade direction: export or import.
  ///
  /// Sent as the `sumber` query parameter.
  required final TradeSource source,

  /// Reporting period aggregation type: monthly or annually.
  ///
  /// Sent as the `periode` query parameter.
  required final TradePeriod period,

  /// HS commodity code to filter by.
  ///
  /// Sent as the `kodehs` query parameter.
  required final String hsCode,

  /// HS code digit classification level.
  ///
  /// Sent as the `jenishs` query parameter.
  required final HSCodeType hsType,

  /// Year to filter by (e.g. "2023").
  ///
  /// Sent as the `tahun` query parameter.
  required final String year,
}) extends BaseEntity {
  @override
  List<Object?> get props => [source, period, hsCode, hsType, year];
}
