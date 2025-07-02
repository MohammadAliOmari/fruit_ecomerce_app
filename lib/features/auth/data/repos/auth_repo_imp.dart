import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruite_app/core/errors/exceptions.dart';
import 'package:fruite_app/core/errors/failure.dart';
import 'package:fruite_app/core/services/firebase_auth_service.dart';
import 'package:fruite_app/features/auth/data/models/user_model.dart';
import 'package:fruite_app/features/auth/domain/entites/user_entity.dart';
import 'package:fruite_app/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImp extends AuthRepo {
  final FirebaseAuthService _firebaseAuthService;

  AuthRepoImp(this._firebaseAuthService);

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required String name}) async {
    try {
      var user = await _firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(
        UserModel.fromFirebaseUser(user),
      );
    } on CustomException catch (e) {
      return left(AuthFailure(e.message));
    } catch (e) {
      log('error in AuthRepoImp.createUserWithEmailAndPassword: ${e.toString()}');
      return left(
        AuthFailure('لقد حدث خطأ أثناء إنشاء الحساب'),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    if (email.isEmpty || password.isEmpty) {
      return left(AuthFailure('البريد الإلكتروني وكلمة المرور مطلوبان'));
    }

    try {
      var user = await _firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(
        UserModel.fromFirebaseUser(user),
      );
    } on CustomException catch (e) {
      return left(AuthFailure(e.message));
    } catch (e) {
      log('error in AuthRepoImp.logInWithEmailAndPassword: ${e.toString()}');
      return left(
        AuthFailure('لقد حدث خطأ أثناء تسجيل الدخول'),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      var user = await _firebaseAuthService.signInWithGoogle();
      return right(
        UserModel.fromFirebaseUser(user),
      );
    } on CustomException catch (e) {
      return left(AuthFailure(e.message));
    } catch (e) {
      log('error in AuthRepoImp.signInWithGoogle: ${e.toString()}');
      return left(
        AuthFailure('لقد حدث خطأ أثناء تسجيل الدخول باستخدام جوجل'),
      );
    }
  }
}
