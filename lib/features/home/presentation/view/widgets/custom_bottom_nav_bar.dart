import 'package:flutter/material.dart';
import 'package:fruite_app/features/home/domain/entites/bottom_nav_bar_entity.dart';
import 'package:fruite_app/features/home/presentation/view/widgets/bottom_nav_item.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int selectedindex = 0;
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
        children: bottomNavBarItems.asMap().entries.map(
          (e) {
            var index = e.key;
            var entity = e.value;
            return Expanded(
              flex: index == selectedindex ? 3 : 2,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedindex = index;
                  });
                },
                child: BottomNavItem(
                  e: entity,
                  isActive: selectedindex == index,
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
