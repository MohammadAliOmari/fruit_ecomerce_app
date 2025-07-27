import 'package:flutter/material.dart';
import 'package:fruite_app/core/utils/app_colors.dart';
import 'package:fruite_app/core/utils/app_text_styles.dart';

class BestSellingHeadar extends StatelessWidget {
  const BestSellingHeadar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'الأكثر مبيعاً',
            style: AppTextStyles().bodyBasabold.copyWith(
                  color: Colors.black,
                ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/best-selling');
            },
            child: Text(
              'عرض الكل',
              style: AppTextStyles().bodysmallRegular.copyWith(
                    color: AppColors.lightgrey2,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
