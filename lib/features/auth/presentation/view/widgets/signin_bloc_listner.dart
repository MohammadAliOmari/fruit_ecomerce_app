import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruite_app/core/helper/functions/build_error_snack_bar.dart';
import 'package:fruite_app/features/auth/presentation/cubit/signin_cubit/signin_cubit.dart';

class SigninBlocListener extends StatelessWidget {
  const SigninBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SigninCubit, SigninState>(
      listenWhen: (previous, current) =>
          current is SigninLoading ||
          current is SigninSuccess ||
          current is SigninFailure,
      listener: (context, state) {
        if (state is SigninLoading) {
          showDialog(
            context: context,
            builder: (context) => Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is SigninSuccess) {
          Navigator.pop(context); // Close the loading dialog
        } else if (state is SigninFailure) {
          Navigator.pop(context); // Close the loading dialog
          builderrorsnackbar(context, state.message);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
