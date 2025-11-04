import 'package:flutter/material.dart';
import 'package:fruite_app/features/home/domain/entites/bottom_nav_bar_entity.dart';
import 'package:fruite_app/features/layout/presentation/widgets/active_item.dart';
import 'package:fruite_app/features/layout/presentation/widgets/inactive_item.dart';

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({super.key, required this.isActive, required this.e});
  final bool isActive;
  final BottomNavBarEntity e;
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        switchInCurve: Curves.easeInOut,
        switchOutCurve: Curves.easeInOut,
        child: isActive
            ? ActiveItem(
                icon: e.activeIcon,
                text: e.title,
              )
            : InActiveItem(icon: e.inactiveIcon));
  }
}
