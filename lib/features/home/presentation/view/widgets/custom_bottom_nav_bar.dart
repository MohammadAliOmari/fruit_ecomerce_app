import 'package:flutter/material.dart';
import 'package:fruite_app/features/home/domain/entites/bottom_nav_bar_entity.dart';
import 'package:fruite_app/features/home/presentation/view/widgets/bottom_nav_item.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 70,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 9,
            offset: Offset(0, -2),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: bottomNavBarItems.map(
          (e) {
            return BottomNavItem(
              activeIcon: e.activeIcon,
              inactiveIcon: e.inactiveIcon,
              isActive: false,
            );
          },
        ).toList(),
      ),
    );
  }
}
