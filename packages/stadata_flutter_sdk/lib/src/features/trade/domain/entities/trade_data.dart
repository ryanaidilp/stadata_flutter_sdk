import 'package:stadata_flutter_sdk/src/core/core.dart';

/// Entity representing a single record of foreign trade data from BPS Web API.
///
/// Maps to data returned by the `dataexim` endpoint, which provides
/// export and import trade statistics aggregated by HS commodity code,
/// port, and trading partner country.
///
/// Documentation: https://webapi.bps.go.id/documentation/#dataexim
class TradeData extends BaseEntity {
  /// Creates a new [TradeData] instance.
  const TradeData({
    required this.value,
    required this.netWeight,
    required this.hsCode,
    required this.port,
    required this.country,
    required this.year,
  });

  /// Trade value in USD.
  ///
  /// Represents the monetary value of the traded commodity.
  final double value;

  /// Net weight of the traded commodity in kilograms.
  final double netWeight;

  /// HS (Harmonized System) commodity code.
  ///
  /// Corresponds to `kodehs` in the API response.
  final String hsCode;

  /// Port of origin or destination.
  ///
  /// Corresponds to `pod` in the API response.
  final String port;

  /// Trading partner country.
  ///
  /// Corresponds to `ctr` in the API response.
  final String country;

  /// Year of the trade record.
  ///
  /// Corresponds to `tahun` in the API response.
  final String year;

  @override
  List<Object?> get props => [value, netWeight, hsCode, port, country, year];
}
