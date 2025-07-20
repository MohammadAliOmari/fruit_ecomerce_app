import 'package:flutter/material.dart';
import 'package:fruite_app/core/utils/app_colors.dart';
import 'package:fruite_app/core/utils/app_text_styles.dart';

class FeauterdItemButton extends StatelessWidget {
  const FeauterdItemButton({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      height: 33,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          backgroundColor: Colors.white,
          foregroundColor: AppColors.primary,
        ),
        onPressed: () {}, // Add your onPressed functionality here
        child: Text(
          'تسوق الان',
          style: AppTextStyles().bodysmallbold.copyWith(),
        ),
      ),
    );
  }
}
