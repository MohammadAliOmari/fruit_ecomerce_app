import 'package:flutter/material.dart';
import 'package:fruite_app/core/utils/app_colors.dart';
import 'package:fruite_app/core/utils/app_text_styles.dart';
import 'package:fruite_app/core/widgets/custom_text_form_field.dart';

class AddressSection extends StatelessWidget {
  const AddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextFormField(
              hintText: 'الاسم الكامل',
              keyboardType: TextInputType.name,
            ),
            SizedBox(
              height: 8,
            ),
            CustomTextFormField(
              hintText: 'رقم الهاتف',
              keyboardType: TextInputType.phone,
            ),
            SizedBox(
              height: 8,
            ),
            CustomTextFormField(
              hintText: 'البريد الاكتروني',
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 8,
            ),
            CustomTextFormField(
              hintText: ' العنوان',
              keyboardType: TextInputType.streetAddress,
            ),
            SizedBox(
              height: 8,
            ),
            CustomTextFormField(
              hintText: 'المدينة',
              keyboardType: TextInputType.streetAddress,
            ),
            SizedBox(
              height: 8,
            ),
            CustomTextFormField(
              hintText: 'رقم الطابق ,الشقة..',
              keyboardType: TextInputType.streetAddress,
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Transform.scale(
                  scale: 0.6,
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: Switch(
                      value: true,
                      onChanged: (value) {
                        value = value;
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  'حفظ العنوان',
                  style: AppTextStyles().bodysmallSemibold.copyWith(
                        color: AppColors.lightgrey2,
                      ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
