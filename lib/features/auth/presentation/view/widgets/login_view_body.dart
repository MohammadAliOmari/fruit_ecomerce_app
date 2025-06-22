import 'package:flutter/material.dart';
import 'package:fruite_app/core/utils/app_colors.dart';
import 'package:fruite_app/core/utils/app_images.dart';
import 'package:fruite_app/core/utils/app_text_styles.dart';
import 'package:fruite_app/core/widgets/custom_button.dart';
import 'package:fruite_app/core/widgets/custom_text_form_field.dart';
import 'package:fruite_app/features/auth/presentation/view/widgets/dont_have_aaccount.dart';
import 'package:fruite_app/core/widgets/or_divider.dart';
import 'package:fruite_app/features/auth/presentation/view/widgets/social_login_button.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            CustomTextFormField(
              hintText: 'البريد الإلكتروني',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              suffixIcon: Icon(
                Icons.visibility,
                color: AppColors.lightgrey2.withOpacity(0.5),
              ),
              hintText: 'كلمة المرور',
              keyboardType: TextInputType.visiblePassword,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  textAlign: TextAlign.left,
                  'نسيت كلمة المرور؟',
                  style: AppTextStyles().bodysmallSemibold.copyWith(
                        color: AppColors.lightprimary,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 33),
            CustomButton(title: 'تسجيل دخول', onPressed: () {}),
            const SizedBox(height: 33),
            const DontHavAccount(),
            const SizedBox(height: 33),
            const OrDivider(),
            const SizedBox(height: 16),
            SocialLoginButton(
              text: 'تسجيل بواسطة جوجل',
              image: Assets.assetsImagesGoogleicons,
              onPressed: () {},
            ),
            SizedBox(height: 16),
            SocialLoginButton(
              text: 'تسجيل بواسطة أبل',
              image: Assets.assetsImagesAppleicon,
              onPressed: () {},
            ),
            SizedBox(height: 16),
            SocialLoginButton(
              text: 'تسجيل بواسطة فيسبوك',
              image: Assets.assetsImagesFacbookicons,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
