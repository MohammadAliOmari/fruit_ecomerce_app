import 'package:flutter/material.dart';
import 'package:fruite_app/core/utils/app_text_styles.dart';

AppBar buildAppBar(BuildContext context, {required String title}) {
  return AppBar(
    backgroundColor: Colors.white,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios_new),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    title: Text(
      title,
      style: AppTextStyles().bodyLargebold,
    ),
    centerTitle: true,
  );
}
