import 'package:flutter/material.dart';
import 'package:fruite_app/core/utils/app_colors.dart';
import 'package:fruite_app/core/utils/app_text_styles.dart';

class DontHavAccount extends StatelessWidget {
  const DontHavAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: 'لا تمتلك حساب؟ ',
        style: AppTextStyles().bodyBasaSemibold.copyWith(
              color: AppColors.lightgrey2,
            ),
        children: [
          TextSpan(
            text: 'قم بإنشاء حساب',
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
