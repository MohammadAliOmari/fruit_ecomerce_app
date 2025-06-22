import 'package:flutter/material.dart';
import 'package:fruite_app/core/utils/app_colors.dart';
import 'package:fruite_app/core/utils/app_text_styles.dart';
import 'package:fruite_app/features/auth/presentation/view/widgets/custom_check_box.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomCheckBox(isChecked: false),
        SizedBox(
          width: 16,
        ),
        // 32 for padding, 48 for checkbox and spacing
        Expanded(
          child: Text.rich(
            TextSpan(
              text: 'من خلال إنشاء حساب ، فإنك توافق على ',
              style: AppTextStyles()
                  .bodysmallSemibold
                  .copyWith(color: AppColors.lightgrey2),
              children: [
                TextSpan(
                  text: 'الشروط والأحكام الخاصة بنا',
                  style: AppTextStyles().bodysmallSemibold.copyWith(
                        color: AppColors.lightprimary,
                      ),
                ),
              ],
            ),
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}
