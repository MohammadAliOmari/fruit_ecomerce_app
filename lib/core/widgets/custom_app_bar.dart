import 'package:flutter/material.dart';
import 'package:fruite_app/core/utils/app_text_styles.dart';
import 'package:fruite_app/core/widgets/notifcation_widget.dart';

AppBar customAppBar(
    {required BuildContext context,
    required String title,
    bool showNotification = true}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: [
      Visibility(
        visible: showNotification,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: NotifcationWidget(),
        ),
      ),
    ],
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
      onPressed: () => Navigator.pop(context),
    ),
    title: Text(
      title,
      style: AppTextStyles().bodyLargebold.copyWith(color: Colors.black),
    ),
    centerTitle: true,
  );
}
