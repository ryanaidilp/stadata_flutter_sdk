// ignore_for_file: public_member_api_docs

import 'package:dartz/dartz.dart';
import 'package:stadata_flutter_sdk/src/core/core.dart';

abstract class UseCase<Type, Params, Repo> {
  Repo get repo;

  Future<Either<Failure, Type>> call(Params param);
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
