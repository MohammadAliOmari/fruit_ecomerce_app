import 'package:flutter/material.dart';
import 'package:fruite_app/core/utils/app_colors.dart';
import 'package:fruite_app/core/utils/app_images.dart';
import 'package:svg_flutter/svg.dart';

class NotifcationWidget extends StatelessWidget {
  const NotifcationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
