import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruite_app/features/auth/presentation/cubit/signup_cubit/signup_cubit.dart';
import 'package:fruite_app/features/auth/presentation/view/widgets/signup_view_body.dart';
import 'package:fruite_app/features/auth/presentation/view/widgets/signup_view_body_bloc_listener.dart';

class SignUpViewBodyBlocConsumer extends StatelessWidget {
  const SignUpViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return SignupViewBody();
      },
    );
  }
}
