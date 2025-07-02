import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruite_app/features/auth/presentation/cubit/signin_cubit/signin_cubit.dart';
import 'package:fruite_app/features/auth/presentation/view/widgets/signin_view_body.dart';

class SigninViewBodyBlocBuilder extends StatelessWidget {
  const SigninViewBodyBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SigninCubit, SigninState>(
      builder: (context, state) {
        return SigninViewBody();
      },
    );
  }
}
