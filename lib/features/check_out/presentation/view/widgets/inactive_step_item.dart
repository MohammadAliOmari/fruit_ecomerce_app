import 'package:flutter/material.dart';
import 'package:fruite_app/core/utils/app_colors.dart';
import 'package:fruite_app/core/utils/app_text_styles.dart';

class InactiveStepItem extends StatelessWidget {
  const InactiveStepItem({super.key, required this.title, required this.index});
  final String title;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 10,
          backgroundColor: AppColors.lightgrey,
          child: Center(
            child: Text(
              '${index + 1}',
              style: AppTextStyles().bodysmallSemibold,
            ),
          ),
        ),
        SizedBox(
          width: 4,
        ),
        Flexible(
          child: Text(
            title,
            style: AppTextStyles().bodysmallSemibold.copyWith(
                  color: AppColors.lightgrey2,
                ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
