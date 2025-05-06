import 'package:stadata_flutter_sdk/src/core/base/base.dart';

class CensusArea extends BaseEntity {
  const CensusArea({
    required this.id,
    required this.name,
    required this.slug,
    required this.mfdCode,
  });

  final int id;
  final String name;
  final String slug;
  final String mfdCode;

  @override
  List<Object?> get props => [id, name, slug, mfdCode];
}
