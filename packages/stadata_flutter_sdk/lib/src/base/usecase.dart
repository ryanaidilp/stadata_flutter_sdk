import 'package:stadata_flutter_sdk/src/core/core.dart';

abstract class UseCase<Type, Params, Repo> {
  Repo get repo;

  Future<Result<Failure, Type>> call(Params param);
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
