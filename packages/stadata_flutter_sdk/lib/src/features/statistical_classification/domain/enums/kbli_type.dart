import 'package:stadata_flutter_sdk/src/features/features.dart';

/// Represents different versions of the Klasifikasi Baku Lapangan Usaha Indonesia (KBLI),
/// which is used for the standardized classification of business fields in Indonesia.
/// This enum facilitates the management of data across different KBLI releases,
/// including years 2009, 2015, 2017, and 2020.
///
/// Each variant of this enum corresponds to a specific release year of the KBLI,
/// allowing for compatibility and comparison studies between different version-specific
/// datasets and standards.
enum KBLIType implements ClassificationType {
  /// The KBLI version for the year 2009.
  y2009,

  /// The KBLI version for the year 2015.
  y2015,

  /// The KBLI version for the year 2017.
  y2017,

  /// The KBLI version for the year 2020, used as the default if no matching version is found.
  y2020;

  /// Constructs a `KBLIType` from a string value representing a year.
  /// This factory method provides a way to dynamically assign the enum based on input data,
  /// defaulting to `y2020` if no match is found.
  ///
  /// `data`: A string input that ideally matches one of the enum's years.
  factory KBLIType.fromValue(String data) => values.firstWhere(
    (element) => element.value.toLowerCase() == data.toLowerCase(),
    orElse: () => KBLIType.y2020,
  );

  /// Generates a URL parameter string for API requests that require a version-specific
  /// format. If `code` includes 'kbli', it's returned as is; otherwise, it formats the
  /// code with the respective year.
  ///
  /// `code`: The KBLI code to be appended in URL parameters.
  @override
  String urlParamGenerator(String code) {
    if (code.contains('kbli')) {
      return code;
    }
    return 'kbli_${year}_$code';
  }

  /// Provides the year associated with the KBLI version. Useful for filtering, querying,
  /// and display operations that need to reference the specific version year of the KBLI.
  @override
  int get year => switch (this) {
    y2009 => 2009,
    y2015 => 2015,
    y2017 => 2017,
    y2020 => 2020,
  };

  /// Returns a unique identifier for each version of the KBLI, combining 'kbli' with the
  /// version year. This is helpful for identification in logs, user interfaces, or API interactions.
  @override
  String get value => 'kbli$year';
}
