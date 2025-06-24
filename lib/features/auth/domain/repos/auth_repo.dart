import 'package:dartz/dartz.dart';
import 'package:fruite_app/core/errors/failure.dart';
import 'package:fruite_app/features/auth/domain/entites/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String name,
    required String password,
  });
}
