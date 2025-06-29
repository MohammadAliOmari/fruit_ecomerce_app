import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruite_app/core/errors/exceptions.dart';
import 'package:fruite_app/features/auth/domain/entites/user_entity.dart';

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
      if (e.code == 'weak-password') {
        throw CustomException('كلمة المرور ضعيفة جدًا.');
      } else if (e.code == 'invalid-email') {
        throw CustomException('البريد الإلكتروني غير صالح.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException('البريد الإلكتروني مستخدم بالفعل.');
      } else {
        throw CustomException('حدث خطأ أثناء إنشاء الحساب');
      }
    } catch (e) {
      throw CustomException('حدث خطاء غير معروف أثناء إنشاء الحساب');
    }
  }
}
