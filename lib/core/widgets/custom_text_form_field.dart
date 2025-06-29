import 'package:flutter/material.dart';
import 'package:fruite_app/core/utils/app_colors.dart';
import 'package:fruite_app/core/utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.hintText,
      required this.keyboardType,
      this.suffixIcon,
      this.onSaved});
  final String hintText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final void Function(String?)? onSaved;
  @override
  Widget build(
    BuildContext context,
  ) {
    return TextFormField(
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'هذا الحقل مطلوب';
        }
        return null;
      },
      keyboardType: keyboardType,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: AppColors.lightgrey.withOpacity(.2),
        hintStyle: AppTextStyles().bodysmallbold.copyWith(
              color: AppColors.lightgrey2,
            ),
        hintText: hintText,
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
        // focusedBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(8.0),
        //   borderSide: BorderSide(color: Colors.blue),
        // ),
      ),
      // style: TextStyle(fontSize: 16.0, color: Colors.black),
      // cursorColor: Colors.blue,
      // keyboardType: TextInputType.text,
      // textInputAction: TextInputAction.done,
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.0),
      borderSide: BorderSide(
        color: AppColors.lightgrey,
        width: 1,
      ),
    );
  }
}
