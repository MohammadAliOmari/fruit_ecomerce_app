import 'package:flutter/material.dart';
import 'package:fruite_app/core/utils/app_text_styles.dart';
import 'package:fruite_app/features/check_out/domain/entities/order_entity.dart';
import 'package:fruite_app/features/check_out/presentation/view/widgets/confirmation_item.dart';
import 'package:provider/provider.dart';

class OrderConfirmationInfo extends StatelessWidget {
  const OrderConfirmationInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConfirmationItem(
      title: 'ملخص الطلب :',
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'المجموع الفرعي :',
                  style: AppTextStyles().bodysmallRegular,
                ),
                const Spacer(),
                Text(
                  '${context.read<OrderEntity>().cartEntity.calculateTotalPrice()} دينار',
                  style: AppTextStyles().bodysmallSemibold,
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Text(
                  'التوصيل :',
                  style: AppTextStyles().bodysmallRegular,
                ),
                const Spacer(),
                Text(
                  '1 دينار',
                  style: AppTextStyles().bodysmallRegular,
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                color: Color(0xffCACECE).withOpacity(1),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Text(
                  'الكلي',
                  style: AppTextStyles().bodyBasabold,
                ),
                const Spacer(),
                Text(
                  '${context.read<OrderEntity>().cartEntity.calculateTotalPrice() + 1} دينار',
                  style: AppTextStyles().bodyBasabold,
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
