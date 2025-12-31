import 'package:flutter/material.dart';
import 'package:fruite_app/core/utils/app_colors.dart';
import 'package:fruite_app/core/utils/app_images.dart';
import 'package:fruite_app/core/utils/app_text_styles.dart';
import 'package:fruite_app/core/widgets/custom_text_form_field.dart';
import 'package:fruite_app/features/check_out/presentation/view/widgets/custom_pyment_item.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'أختار طريقه الدفع المناسبه :',
              style: AppTextStyles().bodysmallbold,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'من فضلك اختر طريقه الدفع المناسبه لك.',
              style: AppTextStyles().bodysmallRegular.copyWith(
                    color: AppColors.lightgrey2,
                  ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: List.generate(
                images().length,
                (index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: CustomPaymentItem(
                      image: images()[index],
                      color:
                          index == 3 ? const Color(0xFF1434CB) : Colors.white,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Column(
              children: [
                CustomTextFormField(
                  hintText: 'اسم حامل البطاقة',
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextFormField(
                  hintText: 'رقم البطاقة',
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 163,
                      child: CustomTextFormField(
                        hintText: 'تاريخ انتهاء البطاقة',
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                    SizedBox(
                      width: 163,
                      child: CustomTextFormField(
                        hintText: 'CVV',
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
            CheckboxListTile(
                checkboxShape: RoundedRectangleBorder(
                    side: BorderSide(color: AppColors.primary),
                    borderRadius: BorderRadius.circular(4)),
                value: true,
                onChanged: (value) {},
                activeColor: AppColors.primary,
                checkColor: Colors.white,
                title: Text(
                  'جعل البطاقه افتراضية',
                  style: AppTextStyles().bodysmallSemibold.copyWith(
                        color: AppColors.lightgrey2,
                      ),
                ))
          ],
        ));
  }

  List<String> images() => [
        Assets.assetsImagesApplePay,
        Assets.assetsImagesPayPal,
        Assets.assetsImagesMasterCard,
        Assets.assetsImagesVisa,
      ];
}
