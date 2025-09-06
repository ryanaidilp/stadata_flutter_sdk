import 'package:meta/meta.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';

abstract class UseCase<ReturnType, Params, Repo> {
  @internal
  final Repo repo;

  const UseCase({required this.repo});

  Future<Result<Failure, ReturnType>> call(Params param);
}

class NoParams extends BaseEntity {
  @override
  List<Object?> get props => [];
}

class IDParams extends BaseEntity {
  const IDParams({required this.id});
  final String id;

  @override
  List<Object?> get props => [id];
}
