import 'package:flutter/material.dart';
import 'package:fruite_app/core/utils/app_colors.dart';
import 'package:fruite_app/core/utils/app_images.dart';
import 'package:fruite_app/core/utils/app_text_styles.dart';
import 'package:svg_flutter/svg.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Color(0x0A000000),
          blurRadius: 9,
          offset: Offset(0, 2),
        ),
      ]),
      child: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          suffixIcon: SizedBox(
            width: 20,
            child: Center(
              child: SvgPicture.asset(
                Assets.assetsImagesFiltter,
              ),
            ),
          ),
          prefixIcon: SizedBox(
            width: 20,
            child: Center(
              child: SvgPicture.asset(
                Assets.assetsImagesSearch,
              ),
            ),
          ),
          filled: true,
          fillColor: Colors.white,
          hintStyle: AppTextStyles().bodysmallRegular.copyWith(
                color: AppColors.lightgrey2,
              ),
          hintText: 'ابحث عن.......',
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
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.white,
        width: 1,
      ),
    );
  }
}
