import 'package:flutter/material.dart';
import 'package:fruite_app/features/home/presentation/view/widgets/active_item.dart';
import 'package:fruite_app/features/home/presentation/view/widgets/inactive_item.dart';

class BottomNavItem extends StatelessWidget {
  const BottomNavItem(
      {super.key,
      required this.isActive,
      required this.activeIcon,
      required this.inactiveIcon});
  final bool isActive;
  final String activeIcon;
  final String inactiveIcon;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? const ActiveItem()
        : InActiveItem(
            icon: inactiveIcon,
          );
  }
}
