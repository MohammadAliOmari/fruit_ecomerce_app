import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruite_app/core/errors/exceptions.dart';
import 'package:fruite_app/core/errors/failure.dart';
import 'package:fruite_app/core/services/data_base_services.dart';
import 'package:fruite_app/core/services/firebase_auth_service.dart';
import 'package:fruite_app/core/utils/backend_end_point.dart';
import 'package:fruite_app/features/auth/data/models/user_model.dart';
import 'package:fruite_app/features/auth/domain/entites/user_entity.dart';
import 'package:fruite_app/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImp extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DataBaseService dataBaseService;
  AuthRepoImp(
      {required this.firebaseAuthService, required this.dataBaseService});

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required String name}) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      var userEntity = UserEntity(name: name, id: user.uid, email: email);
      await addUserDataToFirestore(
        user: userEntity,
      );
      return right(
        userEntity,
      );
    } on CustomException catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteUser();
      }
      return left(AuthFailure(e.message));
    } catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteUser();
      }
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
      var user = await firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      var userEntity = await getUserData(userId: user.uid);
      return right(userEntity);
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
    User? user;
    try {
      user = await firebaseAuthService.signInWithGoogle();
      var userEntity = UserModel.fromFirebaseUser(user);
      await addUserDataToFirestore(
        user: userEntity,
      );
      return right(
        userEntity,
      );
    } on CustomException catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteUser();
      }
      return left(AuthFailure(e.message));
    } catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteUser();
      }
      log('error in AuthRepoImp.signInWithGoogle: ${e.toString()}');
      return left(
        AuthFailure('لقد حدث خطأ أثناء تسجيل الدخول باستخدام جوجل'),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithFacebook();
      var userEntity = UserModel.fromFirebaseUser(user);
      await addUserDataToFirestore(
        user: userEntity,
      );
      return right(userEntity);
    } on CustomException catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteUser();
      }
      return left(AuthFailure(e.message));
    } catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteUser();
      }
      log('error in AuthRepoImp.signInWithFacebook: ${e.toString()}');
      return left(
        AuthFailure('لقد حدث خطأ أثناء تسجيل الدخول باستخدام فيسبوك'),
      );
    }
  }

  @override
  Future addUserDataToFirestore({required UserEntity user}) async {
    try {
      await dataBaseService.addData(
          collectionPath: BackendEndPoint.users,
          data: user.toMap(),
          docId: user.id);
    } catch (e) {
      log('error in AuthRepoImp.addUserDataToFirestore: ${e.toString()}');
    }
  }

  @override
  Future<UserEntity> getUserData({required String userId}) async {
    var userData = await dataBaseService.getData(
        docId: userId, collectionPath: BackendEndPoint.users);

    return UserModel.fromJson(userData);
  }
}
