import 'package:flutter/material.dart';
import 'package:fruite_app/features/check_out/presentation/view/widgets/step_item.dart';

class CheckOutSteps extends StatelessWidget {
  const CheckOutSteps({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
        steps.length,
        (index) {
          return Expanded(
            child: StepItem(
                isActive: false,
                title: steps[index],
                index: index,
                currentIndex: index),
          );
        },
      ),
    );
  }

  List<String> get steps => ['الشحن', 'العنوان', 'الدفع', 'المراجعة'];
}
