import 'package:flutter/material.dart';
import 'package:fruite_app/core/utils/app_colors.dart';
import 'package:fruite_app/core/utils/app_images.dart';
import 'package:fruite_app/core/utils/app_text_styles.dart';
import 'package:svg_flutter/svg.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Container(
        width: 34,
        height: 34,
        padding: const EdgeInsets.all(7),
        decoration: ShapeDecoration(
          color: AppColors.lightgrey,
          shape: OvalBorder(),
        ),
        child: Badge(
          backgroundColor: Colors.red,
          alignment: Alignment.topCenter,
          smallSize: 5,
          largeSize: 5,
          child: SvgPicture.asset(
            Assets.assetsImagesNotification,
            height: 20,
          ),
        ),
      ),
      leading: SizedBox(
        width: 44, // adjust based on your SVG size
        height: 44,
        child: Image.asset(
          Assets.assetsImagesProfilePic,
        ),
      ),
      title: Text(
        'صباح الخير !..',
        style: AppTextStyles()
            .bodyBasaRegular
            .copyWith(color: AppColors.lightgrey2),
      ),
      subtitle: Text(
        'أحمد مصطفي',
        style: AppTextStyles().bodyBasabold.copyWith(color: Colors.black),
      ),
    );
  }
}
