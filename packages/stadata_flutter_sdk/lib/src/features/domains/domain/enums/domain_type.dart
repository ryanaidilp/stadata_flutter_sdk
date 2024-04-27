/// Type of the domain you want to fetch
///
/// It has four values which is:
/// [DomainType.all] (default)
/// [DomainType.province]
/// [DomainType.regency]
/// [DomainType.regencyByProvince]
enum DomainType {
  /// Get all domains.
  ///
  /// Equals to 'all' in query params.
  all,

  /// Get all province domains.
  ///
  /// Equals to 'prov' in query params.
  province,

  /// Get all regency domains.
  ///
  /// Equaks to 'kab' in query params.
  regency,

  ///Get all regency domains by province code.
  ///
  /// Equals to 'kabbyprov' in query params.
  regencyByProvince;

  /// String representation of enums for query params
  String get value => switch (this) {
        all => 'all',
        province => 'prov',
        regency => 'kab',
        regencyByProvince => 'kabbyprov',
      };
}
