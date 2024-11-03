import 'package:stadata_flutter_sdk/src/core/core.dart';
import 'package:stadata_flutter_sdk/src/features/features.dart';
import 'package:stadata_flutter_sdk/src/shared/shared.dart';

abstract class DomainRepository {
  Future<Result<Failure, ApiResponse<List<DomainEntity>>>> get({
    DomainType type = DomainType.all,
    String? provinceCode,
  });
}
