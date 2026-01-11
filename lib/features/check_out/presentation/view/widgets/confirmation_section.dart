import 'package:flutter/material.dart';
import 'package:fruite_app/core/utils/app_colors.dart';
import 'package:fruite_app/core/utils/app_text_styles.dart';
import 'package:fruite_app/features/check_out/domain/entities/order_entity.dart';
import 'package:fruite_app/features/check_out/presentation/view/widgets/confirmation_item.dart';
import 'package:fruite_app/features/check_out/presentation/view/widgets/order_confirmation_info.dart';
import 'package:provider/provider.dart';

class ConfirmationSection extends StatelessWidget {
  const ConfirmationSection({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 24,
        ),
        OrderConfirmationInfo(),
        const SizedBox(
          height: 24,
        ),
        ConfirmationItem(
            title: 'عنوان التوصبل :',
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.location_on_outlined),
                  Text(
                    '${context.read<OrderEntity>().shipping.address} ,',
                    style: AppTextStyles().bodyBasaRegular.copyWith(
                          color: AppColors.lightgrey2,
                        ),
                  ),
                  Text(
                    '${context.read<OrderEntity>().shipping.city} ,',
                    style: AppTextStyles().bodyBasaRegular.copyWith(
                          color: AppColors.lightgrey2,
                        ),
                  ),
                  Text(
                    '${context.read<OrderEntity>().shipping.addressDetails}',
                    style: AppTextStyles().bodyBasaRegular.copyWith(
                          color: AppColors.lightgrey2,
                        ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      pageController.animateToPage(
                        1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Row(
                      children: [
                        Icon(Icons.edit, color: AppColors.lightgrey2, size: 16),
                        Text(
                          'تعديل',
                          style: AppTextStyles().bodysmallSemibold.copyWith(
                                color: AppColors.lightgrey2,
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
