import 'package:dartz/dartz.dart';
import 'package:fruite_app/core/errors/failure.dart';
import 'package:fruite_app/features/auth/domain/entites/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String name,
    required String password,
  });

  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserEntity>> signInWithGoogle();
  Future<Either<Failure, UserEntity>> signInWithFacebook();
  Future addUserDataToFirestore({
    required UserEntity user,
  });
}
