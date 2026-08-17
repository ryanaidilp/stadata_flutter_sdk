import 'package:meta/meta.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';

abstract class const UseCase<ReturnType, Params, Repo>({
  @internal required final Repo repo,
}) {
  Future<Result<Failure, ReturnType>> call(Params param);
}

class NoParams extends BaseEntity {
  @override
  List<Object?> get props => [];
}

class const IDParams({required final String id}) extends BaseEntity {
  @override
  List<Object?> get props => [id];
}
