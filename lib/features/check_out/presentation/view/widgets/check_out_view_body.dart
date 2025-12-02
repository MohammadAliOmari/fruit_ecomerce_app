import 'package:flutter/material.dart';
import 'package:fruite_app/features/check_out/presentation/view/widgets/check_out_steps.dart';

class CheckOutViewBody extends StatelessWidget {
  const CheckOutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 18,
        ),
        CheckOutSteps(),
      ],
    );
  }
}
