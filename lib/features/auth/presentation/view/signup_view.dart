import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruite_app/core/services/get_it_service.dart';
import 'package:fruite_app/core/widgets/auth_app_bar.dart';
import 'package:fruite_app/features/auth/domain/repos/auth_repo.dart';
import 'package:fruite_app/features/auth/presentation/cubit/signup_cubit/signup_cubit.dart';
import 'package:fruite_app/features/auth/presentation/view/widgets/signup_view_body_bloc_consumer.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static const String routeName = '/signup';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: authbuildAppBar(
          context,
          title: 'حساب جديد',
        ),
        body: SignUpViewBodyBlocConsumer(),
      ),
    );
  }
}
