import 'package:stadata_flutter_sdk/src/core/core.dart';

/// Entity class representing statistical domains from BPS Web API.
///
/// This class maps to the domains endpoint:
/// `https://webapi.bps.go.id/v1/api/list/domain/{domain_id}`
///
/// Domains represent different geographical or administrative levels where
/// statistical data is collected and organized, including:
/// - National level (nasional)
/// - Provincial level (provinsi)
/// - Regency/City level (kabupaten/kota)
/// - Sub-district level (kecamatan)
///
/// Each domain provides access to statistical datasets specific to that
/// administrative boundary, enabling users to retrieve data at the appropriate
/// geographical scope for their analysis needs.
///
/// Documentation: https://webapi.bps.go.id/documentation/#domain

class DomainEntity extends BaseEntity {
  /// Creates a new [DomainEntity] instance.
  const DomainEntity({required this.id, required this.name, required this.url});

  /// Unique identifier for the statistical domain
  ///
  /// Represents 'domain_id' from the API response.
  /// Common values include province codes (e.g., "3200" for West Java),
  /// regency codes, or special identifiers like "0000" for national level.
  final String id;

  /// Descriptive name of the statistical domain
  ///
  /// Represents 'domain_name' from the API response.
  /// Examples: "DKI Jakarta", "Kabupaten Bogor", "Indonesia"
  final String name;

  /// Official URL endpoint for accessing this domain's statistical data
  ///
  /// Represents 'domain_url' from the API response.
  /// Points to the specific BPS regional office or data portal
  /// responsible for this geographical area.
  final String url;

  @override
  List<Object> get props => [id, name, url];
}
