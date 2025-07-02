import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruite_app/core/services/get_it_service.dart';
import 'package:fruite_app/core/widgets/custom_app_bar.dart';
import 'package:fruite_app/features/auth/domain/repos/auth_repo.dart';
import 'package:fruite_app/features/auth/presentation/cubit/signin_cubit/signin_cubit.dart';
import 'package:fruite_app/features/auth/presentation/view/widgets/signin_view_body.dart';
import 'package:fruite_app/features/auth/presentation/view/widgets/signin_view_body_bloc_builder.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});
  static const String routeName = '/login';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(getIt.get<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, title: 'تسجيل دخول'),
        body: SigninViewBodyBlocBuilder(),
      ),
    );
  }
}
