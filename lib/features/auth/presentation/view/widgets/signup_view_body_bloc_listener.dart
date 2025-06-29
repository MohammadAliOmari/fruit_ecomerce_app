import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruite_app/core/helper/functions/build_error_snack_bar.dart';
import 'package:fruite_app/features/auth/presentation/cubit/signup_cubit/signup_cubit.dart';

class SignupBlocListener extends StatelessWidget {
  const SignupBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listenWhen: (previous, current) =>
          current is SignupLoading ||
          current is SignupSuccess ||
          current is SignupFailure,
      listener: (context, state) {
        if (state is SignupLoading) {
          showDialog(
            context: context,
            builder: (context) => Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).indicatorColor,
              ),
            ),
          );
        } else if (state is SignupSuccess) {
          Navigator.pop(context); // Close the loading dialog
        } else if (state is SignupFailure) {
          Navigator.pop(context); // Close the loading dialog
          builderrorsnackbar(context, state.message);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
