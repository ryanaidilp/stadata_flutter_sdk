import 'package:stadata_flutter_sdk/src/core/core.dart';

/// Represents a parsed composite key from the datacontent map.
///
/// BPS API uses denormalized flat structure where each key encodes
/// all dimensional coordinates in the format:
/// `{vervar}{var}{turvar}{tahun}{turtahun}`
///
/// Example: "7315310990" breaks down as:
/// - 7315 = vervar (vertical variable - region/domain)
/// - 31 = var (variable ID)
/// - 0 = turvar (derived variable ID)
/// - 99 = tahun (period ID)
/// - 0 = turtahun (derived period ID)
class DataContentKey extends BaseEntity {
  /// Creates a [DataContentKey] with explicit values.
  const DataContentKey({
    required this.compositeKey,
    required this.verticalVariable,
    required this.variable,
    required this.derivedVariable,
    required this.period,
    required this.derivedPeriod,
  });

  /// Creates a [DataContentKey] by parsing a composite key string.
  ///
  /// The parsing strategy:
  /// 1. Extract vervar (first N digits, length varies by domain)
  /// 2. Extract var (next digits, variable ID)
  /// 3. Extract turvar (single digit, derived variable)
  /// 4. Extract tahun (2-3 digits, period)
  /// 5. Extract turtahun (remaining digits, derived period)
  factory DataContentKey.parse(
    String compositeKey, {
    required List<int> vervarValues,
    required List<int> varValues,
    required List<int> turvarValues,
    required List<int> tahunValues,
    required List<int> turtahunValues,
  }) {
    // Strategy: Match against known values from metadata arrays
    // to determine where each segment starts/ends

    int? vervar;
    int? variable;
    int? turvar;
    int? tahun;
    int? turtahun;

    // Try to match vervar (can be 4+ digits)
    for (final vv in vervarValues) {
      final vvStr = vv.toString();
      if (compositeKey.startsWith(vvStr)) {
        vervar = vv;
        final remaining = compositeKey.substring(vvStr.length);

        // Try to match var
        for (final v in varValues) {
          final vStr = v.toString();
          if (remaining.startsWith(vStr)) {
            variable = v;
            final remaining2 = remaining.substring(vStr.length);

            // Try to match turvar (usually single digit)
            for (final tv in turvarValues) {
              final tvStr = tv.toString();
              if (remaining2.startsWith(tvStr)) {
                turvar = tv;
                final remaining3 = remaining2.substring(tvStr.length);

                // Try to match tahun (2-3 digits)
                for (final t in tahunValues) {
                  final tStr = t.toString();
                  if (remaining3.startsWith(tStr)) {
                    tahun = t;
                    final remaining4 = remaining3.substring(tStr.length);

                    // Remaining should be turtahun
                    final ttValue = int.tryParse(remaining4);
                    if (ttValue != null && turtahunValues.contains(ttValue)) {
                      turtahun = ttValue;
                      break;
                    }
                  }
                }
                if (tahun != null) break;
              }
            }
            if (turvar != null) break;
          }
        }
        if (variable != null) break;
      }
    }

    return DataContentKey(
      compositeKey: compositeKey,
      verticalVariable: vervar ?? 0,
      variable: variable ?? 0,
      derivedVariable: turvar ?? 0,
      period: tahun ?? 0,
      derivedPeriod: turtahun ?? 0,
    );
  }

  /// The original composite key string.
  final String compositeKey;

  /// Vertical variable value (e.g., 7315 for a region).
  final int verticalVariable;

  /// Variable ID (e.g., 31 for population).
  final int variable;

  /// Derived variable ID (e.g., 0 for no derived variable).
  final int derivedVariable;

  /// Period/year ID (e.g., 99 for year 1999).
  final int period;

  /// Derived period ID (e.g., 0 for no derived period).
  final int derivedPeriod;

  @override
  List<Object?> get props => [
    compositeKey,
    verticalVariable,
    variable,
    derivedVariable,
    period,
    derivedPeriod,
  ];

  @override
  String toString() =>
      'DataContentKey(vervar: $verticalVariable, var: $variable, turvar: $derivedVariable, tahun: $period, turtahun: $derivedPeriod)';
}
