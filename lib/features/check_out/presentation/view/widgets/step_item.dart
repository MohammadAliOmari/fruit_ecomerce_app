import 'package:flutter/material.dart';
import 'package:fruite_app/features/check_out/presentation/view/widgets/active_step_item.dart';
import 'package:fruite_app/features/check_out/presentation/view/widgets/inactive_step_item.dart';

class StepItem extends StatelessWidget {
  const StepItem(
      {super.key,
      required this.title,
      required this.index,
      required this.currentIndex,
      required this.isActive});
  final String title;
  final int index;
  final int currentIndex;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: InactiveStepItem(title: title, index: index),
      secondChild: ActiveStepItem(title: title),
      crossFadeState:
          isActive ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      duration: const Duration(milliseconds: 300),
    );
  }
}
