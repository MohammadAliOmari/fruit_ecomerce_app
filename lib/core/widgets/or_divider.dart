import 'package:flutter/material.dart';
import 'package:fruite_app/core/utils/app_text_styles.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(),
        ),
        SizedBox(width: 18),
        Text('أو', style: AppTextStyles().bodyBasaSemibold),
        SizedBox(width: 18),
        Expanded(
          child: Divider(),
        ),
      ],
    );
  }
}
