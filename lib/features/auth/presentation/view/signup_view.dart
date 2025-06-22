import 'package:flutter/material.dart';
import 'package:fruite_app/core/widgets/custom_app_bar.dart';
import 'package:fruite_app/features/auth/presentation/view/widgets/signup_view_body.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static const String routeName = '/signup';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: 'حساب جديد',
      ),
      body: SignupViewBody(),
    );
  }
}
