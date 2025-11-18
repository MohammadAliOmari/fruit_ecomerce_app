import 'package:flutter/material.dart';
import 'package:fruite_app/features/home/presentation/view/home_view.dart';
import 'package:fruite_app/features/home/presentation/view/product_view.dart';
import 'package:fruite_app/features/layout/presentation/widgets/custom_bottom_nav_bar.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});
  static const routeName = '/layout';

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  int curentindex = 0;

  List<Widget> screens = [
    const HomeView(),
    ProductView(),
    Container(
      color: Colors.amber,
    ),
    Container(
      color: Colors.blue,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[curentindex],
      bottomNavigationBar: CustomBottomNavBar(
        onTabChange: (value) {
          setState(() {
            curentindex = value;
          });
        },
      ),
    );
  }
}
