import 'package:flutter/material.dart';
import 'package:fruite_app/core/utils/app_colors.dart';
import 'package:fruite_app/core/utils/app_text_styles.dart';

class ActiveStepItem extends StatelessWidget {
  const ActiveStepItem({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 11.5,
          backgroundColor: AppColors.primary,
          child: Icon(
            Icons.check,
            color: Colors.white,
            size: 18,
          ),
        ),
        SizedBox(
          width: 4,
        ),
        Flexible(
          child: Text(
            title,
            style: AppTextStyles().bodysmallbold.copyWith(
                  color: AppColors.primary,
                ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
