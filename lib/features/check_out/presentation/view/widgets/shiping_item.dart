import 'package:flutter/material.dart';
import 'package:fruite_app/core/utils/app_colors.dart';
import 'package:fruite_app/core/utils/app_text_styles.dart';

class ShipingItem extends StatelessWidget {
  const ShipingItem(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.price,
      required this.isSelected,
      required this.onTap});
  final String title;
  final String subtitle;
  final String price;
  final bool isSelected;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 81,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? AppColors.primary : Colors.transparent,
          ),
          color: AppColors.lightgrey,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          children: [
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 18,
                    width: 18,
                    decoration: ShapeDecoration(
                      color: isSelected ? AppColors.primary : Colors.white,
                      shape: OvalBorder(
                        side: BorderSide(
                          width: isSelected ? 3 : 1,
                          color:
                              isSelected ? Colors.white : AppColors.lightgrey2,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: AppTextStyles().bodysmallSemibold,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        subtitle,
                        style: AppTextStyles().bodysmallRegular.copyWith(
                              color: Colors.black.withOpacity(0.5),
                            ),
                      )
                    ],
                  ),
                  const Spacer(),
                  Center(
                    child: Text(
                      '$price دينار',
                      style: AppTextStyles().bodysmallbold.copyWith(
                            color: AppColors.lightprimary,
                          ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
