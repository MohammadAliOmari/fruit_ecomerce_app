import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruite_app/features/auth/domain/entites/user_entity.dart';
import 'package:fruite_app/features/auth/domain/repos/auth_repo.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this._authRepo) : super(SignupInitial());
  final AuthRepo _authRepo;
  bool obscureText = true;
  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String name,
    required String password,
  }) async {
    emit(SignupLoading());
    final result = await _authRepo.createUserWithEmailAndPassword(
      email: email,
      name: name,
      password: password,
    );
    result.fold(
      (failure) => emit(SignupFailure(message: failure.message)),
      (userEntity) => emit(SignupSuccess(userEntity: userEntity)),
    );
  }

  void togglePassword() {
    obscureText = !obscureText;
    emit(PasswordVisibilityState(
      isPasswordVisible: obscureText,
    ));
  }
}
