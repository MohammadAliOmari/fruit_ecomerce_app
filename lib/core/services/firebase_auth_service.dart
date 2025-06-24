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
        throw CustomException('The password provided is too weak.');
      } else if (e.code == 'invalid-email') {
        throw CustomException('The email address is not valid.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException('The account already exists for that email.');
      } else {
        throw CustomException('An error occurred: ${e.message}');
      }
    } catch (e) {
      throw CustomException('An unknown error occurred: $e');
    }
  }
}
