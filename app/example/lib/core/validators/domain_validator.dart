/// Validator for domain input fields across the application.
class DomainValidator {
  DomainValidator._();

  /// Default domain code for Indonesia (National level)
  static const String defaultDomain = '7200';

  /// Required length for domain codes
  static const int domainLength = 4;

  /// Validates that the domain is exactly 4 characters long.
  ///
  /// Returns an error message if validation fails, null otherwise.
  static String? validate(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Domain is required';
    }

    if (value.trim().length != domainLength) {
      return 'Domain must be exactly $domainLength digits';
    }

    return null;
  }

  /// Checks if the domain is valid (exactly 4 characters).
  static bool isValid(String? value) {
    return value != null &&
        value.trim().isNotEmpty &&
        value.trim().length == domainLength;
  }
}
