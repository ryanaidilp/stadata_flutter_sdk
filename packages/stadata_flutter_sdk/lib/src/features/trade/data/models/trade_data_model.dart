import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/trade/domain/entities/entities.dart';

/// Data model for [TradeData] that handles JSON deserialization
/// from the BPS `dataexim` API endpoint.
class TradeDataModel extends TradeData {
  /// Creates a new [TradeDataModel] instance.
  const TradeDataModel({
    required super.value,
    required super.netWeight,
    required super.hsCode,
    required super.port,
    required super.country,
    required super.year,
  });

  /// Deserializes a [TradeDataModel] from a JSON map.
  ///
  /// API field mappings:
  /// - `value` → [value]
  /// - `netweight` → [netWeight]
  /// - `kodehs` → [hsCode]
  /// - `pod` → [port]
  /// - `ctr` → [country]
  /// - `tahun` → [year]
  factory TradeDataModel.fromJson(JSON json) => TradeDataModel(
    value: (json['value'] as num?)?.toDouble() ?? 0.0,
    netWeight: (json['netweight'] as num?)?.toDouble() ?? 0.0,
    hsCode: json['kodehs']?.toString() ?? '',
    port: json['pod']?.toString() ?? '',
    country: json['ctr']?.toString() ?? '',
    year: json['tahun']?.toString() ?? '',
  );

  /// Serializes this model to a JSON map.
  JSON toJson() => {
    'value': value,
    'netweight': netWeight,
    'kodehs': hsCode,
    'pod': port,
    'ctr': country,
    'tahun': year,
  };
}
