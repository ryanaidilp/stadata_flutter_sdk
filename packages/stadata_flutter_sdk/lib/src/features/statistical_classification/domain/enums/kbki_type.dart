import 'package:stadata_flutter_sdk/src/features/features.dart';

/// Represents different versions of the Klasifikasi Baku Komoditas Indonesia (KBKI),
/// which is used for the standardized classification of commodities in Indonesia.
/// Currently, only the 2015 version is available, but the structure allows for
/// easy expansion to include future versions.
///
/// Each variant of this enum corresponds to a specific release year of the KBKI,
/// ensuring that data handling and APIs can adapt to changes in classification over time.
enum KBKIType implements ClassificationType {
  /// The KBKI version for the year 2015.
  y2015;

  /// Creates an instance of `KBKIType` based on the provided string value.
  /// Defaults to `2015` if the string does not match any existing variants.
  ///
  /// `data`: A string that represents a year, used to find the corresponding enum value.
  factory KBKIType.fromValue(String data) => values.firstWhere(
        (element) => element.value.toLowerCase() == data.toLowerCase(),
        orElse: () => KBKIType.y2015,
      );

  /// Generates a URL parameter for API requests. If `code` already contains 'kbki',
  /// it returns the code directly. Otherwise, it constructs a parameter using the
  /// KBKI version's year and the provided `code`.
  ///
  /// `code`: The commodity code to be included in the URL parameter.
  @override
  String urlParamGenerator(String code) {
    if (code.contains('kbki')) {
      return code;
    }

    return 'kbki_${year}_$code';
  }

  // Returns the year associated with the KBKI version, facilitating operations that
  /// are sensitive to the data version, such as database queries and reporting.
  @override
  int get year => switch (this) {
        y2015 => 2015,
      };

  /// Provides a string representation of the KBKI version, which combines 'kbki' with
  /// the year. Useful for identifying the version in logs, displays, or API interactions.
  @override
  String get value => 'kbki$year';
}
