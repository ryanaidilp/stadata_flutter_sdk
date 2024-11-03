import 'package:stadata_flutter_sdk/src/core/core.dart';

/// Dart class representation of BPS Statistics Domain
///
/// docs: https://webapi.bps.go.id/documentation/#domain

class DomainEntity extends BaseEntity {
  /// Constructor of DomainEntity
  const DomainEntity({
    required this.id,
    required this.name,
    required this.url,
  });

  /// id of the domain
  ///
  /// represent 'domain_id' from api response
  final String id;

  /// name of the domain
  ///
  /// represent 'domain_name' from api response
  final String name;

  /// url of the domain
  ///
  /// represent 'domain_url' from api response
  final String url;

  @override
  List<Object> get props => [id, name, url];
}
