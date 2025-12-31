import 'package:flutter/material.dart';
import 'package:fruite_app/core/utils/app_decration.dart';
import 'package:fruite_app/core/utils/app_text_styles.dart';

class ConfirmationItem extends StatelessWidget {
  const ConfirmationItem({super.key, required this.title, required this.child});
  final String title;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles().bodysmallbold,
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          decoration: AppDecration.greyboxDecoration,
          child: child,
        )
      ],
    );
  }
}
