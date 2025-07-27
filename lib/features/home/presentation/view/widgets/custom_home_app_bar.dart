import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fruite_app/constants.dart';
import 'package:fruite_app/core/helper/functions/get_user.dart';
import 'package:fruite_app/core/services/shared_preferences.dart';
import 'package:fruite_app/core/utils/app_colors.dart';
import 'package:fruite_app/core/utils/app_images.dart';
import 'package:fruite_app/core/utils/app_text_styles.dart';
import 'package:fruite_app/core/widgets/notifcation_widget.dart';
import 'package:fruite_app/features/auth/data/models/user_model.dart';
import 'package:fruite_app/features/auth/domain/entites/user_entity.dart';
import 'package:svg_flutter/svg.dart';

class CustomHomeAppBar extends StatefulWidget {
  const CustomHomeAppBar({super.key});

  @override
  State<CustomHomeAppBar> createState() => _CustomHomeAppBarState();
}

class _CustomHomeAppBarState extends State<CustomHomeAppBar> {
  @override
  void initState() {
    getUser();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserEntity>(
      future: getUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return ListTile(
            trailing: NotifcationWidget(),
            leading: SizedBox(
              width: 44,
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
            subtitle: const SizedBox(
              height: 16,
              child: LinearProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError || !snapshot.hasData) {
          return ListTile(
            trailing: NotifcationWidget(),
            leading: SizedBox(
              width: 44,
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
              'اسم المستخدم غير متوفر',
              style: AppTextStyles().bodyBasabold.copyWith(color: Colors.black),
            ),
          );
        } else {
          return ListTile(
            trailing: NotifcationWidget(),
            leading: SizedBox(
              width: 44,
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
              snapshot.data!.name,
              style: AppTextStyles().bodyBasabold.copyWith(color: Colors.black),
            ),
          );
        }
      },
    );
  }
}
