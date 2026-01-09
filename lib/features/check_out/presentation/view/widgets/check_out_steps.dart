import 'package:flutter/material.dart';
import 'package:fruite_app/core/helper/functions/build_error_snack_bar.dart';
import 'package:fruite_app/features/check_out/domain/entities/order_entity.dart';
import 'package:fruite_app/features/check_out/presentation/view/widgets/step_item.dart';
import 'package:provider/provider.dart';

class CheckOutSteps extends StatelessWidget {
  const CheckOutSteps(
      {super.key, required this.currentIndex, required this.pageController});
  final int currentIndex;
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
        steps().length,
        (index) {
          return Expanded(
            child: GestureDetector(
              onTap: () {
                if (context.read<OrderEntity>().payWithCash != null) {
                  pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                } else {
                  builderrorsnackbar(context, 'الرجاء اختيار طريقة الدفع');
                }
              },
              child: StepItem(
                isActive: index <= currentIndex,
                title: steps()[index],
                index: index,
              ),
            ),
          );
        },
      ),
    );
  }
}

List<String> steps() => ['الشحن', 'العنوان', 'الدفع', 'المراجعة'];
