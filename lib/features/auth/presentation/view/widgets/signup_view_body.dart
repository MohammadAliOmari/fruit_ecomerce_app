import 'package:flutter/material.dart';
import 'package:fruite_app/core/utils/app_colors.dart';
import 'package:fruite_app/core/widgets/custom_button.dart';
import 'package:fruite_app/core/widgets/custom_text_form_field.dart';
import 'package:fruite_app/features/auth/presentation/view/widgets/have_an_account.dart';
import 'package:fruite_app/features/auth/presentation/view/widgets/terms_and_conditions.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 24.0,
            ),
            CustomTextFormField(
                hintText: 'الاسم كامل', keyboardType: TextInputType.name),
            SizedBox(
              height: 16.0,
            ),
            CustomTextFormField(
                hintText: 'البريد الإلكتروني',
                keyboardType: TextInputType.emailAddress),
            SizedBox(
              height: 16.0,
            ),
            CustomTextFormField(
              hintText: 'كلمة المرور',
              keyboardType: TextInputType.visiblePassword,
              suffixIcon: Icon(
                Icons.visibility,
                color: AppColors.lightgrey2.withOpacity(0.5),
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            TermsAndConditions(),
            SizedBox(
              height: 30.0,
            ),
            CustomButton(title: 'إنشاء حساب جديد', onPressed: () {}),
            SizedBox(
              height: 26.0,
            ),
            HaveAnAccount(),
          ],
        ),
      ),
    );
  }
}
