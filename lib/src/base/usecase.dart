// ignore_for_file: public_member_api_docs

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:stadata_flutter_sdk/src/core/failures/failures.dart';

abstract class UseCase<Type, Params, Repo> {
  Repo get repo;

  Future<Either<Failure, Type>> call(Params param);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

class IDParams extends Equatable {
  const IDParams({required this.id});
  final String id;

  @override
  List<Object?> get props => [id];
}
