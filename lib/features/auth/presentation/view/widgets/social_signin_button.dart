import 'package:flutter/material.dart';
import 'package:fruite_app/core/utils/app_colors.dart';
import 'package:fruite_app/core/utils/app_text_styles.dart';
import 'package:svg_flutter/svg.dart';

class SocialSigninButton extends StatelessWidget {
  const SocialSigninButton(
      {super.key,
      required this.image,
      required this.text,
      required this.onPressed});
  final String image;
  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          side: BorderSide(
            color: AppColors.lightgrey2.withOpacity(.5),
          ),
        ),
        onPressed: onPressed,
        child: ListTile(
          visualDensity: VisualDensity(
            vertical: VisualDensity.minimumDensity,
          ),
          leading: SvgPicture.asset(
            image,
            width: 20,
            height: 20,
          ),
          title: Text(
            text,
            style: AppTextStyles().bodyBasaSemibold,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
