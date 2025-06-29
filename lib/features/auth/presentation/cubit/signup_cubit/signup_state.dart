part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

final class SignupLoading extends SignupState {}

final class SignupSuccess extends SignupState {
  final UserEntity userEntity;

  SignupSuccess({required this.userEntity});
}

final class PasswordVisibilityState extends SignupState {
  final bool isPasswordVisible;

  PasswordVisibilityState({required this.isPasswordVisible});
}

final class SignupFailure extends SignupState {
  final String message;

  SignupFailure({required this.message});
}
