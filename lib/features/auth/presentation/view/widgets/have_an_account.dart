import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruite_app/core/utils/app_colors.dart';
import 'package:fruite_app/core/utils/app_text_styles.dart';

class HaveAnAccount extends StatelessWidget {
  const HaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: ' تمتلك حساب بلفعل؟ ',
        style: AppTextStyles().bodyBasaSemibold.copyWith(
              color: AppColors.lightgrey2,
            ),
        children: [
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pop(context);
              },
            text: 'تسجيل دخول',
            style: AppTextStyles().bodyBasaSemibold.copyWith(
                  color: AppColors.primary,
                ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
