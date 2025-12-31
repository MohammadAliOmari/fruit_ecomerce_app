import 'package:flutter/material.dart';
import 'package:fruite_app/features/check_out/presentation/view/widgets/order_confirmation_info.dart';

class ConfirmationSection extends StatelessWidget {
  const ConfirmationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 24,
        ),
        OrderConfirmationInfo(),
      ],
    );
  }
}
