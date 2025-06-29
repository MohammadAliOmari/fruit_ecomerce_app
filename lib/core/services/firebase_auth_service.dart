import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruite_app/core/errors/exceptions.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('erro in FirebaaseauthService.createUserWithEmailAndPassword: ${e.toString()} Code ${e.code}');
      if (e.code == 'weak-password') {
        throw CustomException('كلمة المرور ضعيفة جدًا.');
      } else if (e.code == 'invalid-email') {
        throw CustomException('البريد الإلكتروني غير صالح.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException('البريد الإلكتروني مستخدم بالفعل.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
            'الاتصال بالشبكة فشل. يرجى التحقق من الاتصال بالشبكة.');
      } else {
        throw CustomException('حدث خطأ أثناء إنشاء الحساب');
      }
    } catch (e) {
      log('erro in FirebaaseauthService.createUserWithEmailAndPassword: ${e.toString()}');
      throw CustomException('حدث خطاء غير معروف أثناء إنشاء الحساب');
    }
  }

  Future<User> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('erro in FirebaaseauthService.logInWithEmailAndPassword: ${e.toString()} Code ${e.code}');
      if (e.code == 'user-not-found') {
        throw CustomException('البريد الالكتروني او كلمة المرور غير صحيحة.');
      } else if (e.code == 'wrong-password') {
        throw CustomException('البريد الالكتروني او كلمة المرور غير صحيحة.');
      } else if (e.code == 'invalid-email') {
        throw CustomException('البريد الإلكتروني غير صالح.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(
            'الاتصال بالشبكة فشل. يرجى التحقق من الاتصال بالشبكة.');
      } else {
        throw CustomException('حدث خطأ أثناء تسجيل الدخول');
      }
    } catch (e) {
      log('erro in FirebaaseauthService.logInWithEmailAndPassword: ${e.toString()}');
      throw CustomException('حدث خطاء غير معروف أثناء تسجيل الدخول');
    }
  }
}
