/// Enumeration of table types in BPS WebAPI.
///
/// BPS provides different types of statistical tables, each with
/// distinct characteristics and data access patterns.
enum TableType {
  /// Static tables contain pre-computed, fixed statistical data.
  ///
  /// These tables are ready for immediate display and do not require
  /// parameter selection. They include metadata, HTML content, and
  /// downloadable Excel formats.
  ///
  /// Characteristics:
  /// - Pre-rendered HTML content
  /// - Fixed data structure
  /// - Direct download available
  /// - No query parameters needed
  static,

  /// Dynamic tables allow user-driven data customization through parameters.
  ///
  /// Users can select variables, periods, and dimensions to generate
  /// customized views of the statistical data. These tables support
  /// interactive querying and filtering.
  ///
  /// Characteristics:
  /// - Requires parameter selection
  /// - Multiple dimensions (variables, periods, vertical variables)
  /// - Generated on-demand
  /// - Query builder interface
  dynamic,

  /// Simdasi tables (Special Information and Data System).
  ///
  /// Specialized table type for specific BPS data systems with unique
  /// formatting and display requirements.
  simdasi,

  /// Unknown table type.
  ///
  /// Used when table type cannot be determined from metadata or
  /// when encountering unsupported table types.
  unknown;

  /// Creates a [TableType] from a string value.
  ///
  /// Matches common API values and variations:
  /// - "static", "statis", "1" → [TableType.static]
  /// - "dynamic", "dinamis", "2" → [TableType.dynamic]
  /// - "simdasi", "3" → [TableType.simdasi]
  ///
  /// Returns [TableType.unknown] for unrecognized values.
  static TableType fromString(String? value) {
    if (value == null || value.isEmpty) return TableType.unknown;

    final normalized = value.toLowerCase().trim();

    // Static table variations
    if (normalized == 'static' || normalized == 'statis' || normalized == '1') {
      return TableType.static;
    }

    // Dynamic table variations
    if (normalized == 'dynamic' ||
        normalized == 'dinamis' ||
        normalized == '2') {
      return TableType.dynamic;
    }

    // Simdasi table variations
    if (normalized == 'simdasi' || normalized == '3') {
      return TableType.simdasi;
    }

    return TableType.unknown;
  }

  /// Converts this [TableType] to a string representation.
  ///
  /// Returns lowercase string matching the enum name.
  String toApiValue() {
    switch (this) {
      case TableType.static:
        return 'static';
      case TableType.dynamic:
        return 'dynamic';
      case TableType.simdasi:
        return 'simdasi';
      case TableType.unknown:
        return 'unknown';
    }
  }
}
