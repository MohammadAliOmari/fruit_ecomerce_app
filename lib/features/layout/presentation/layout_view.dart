import 'package:flutter/material.dart';
import 'package:fruite_app/features/home/presentation/view/home_view.dart';
import 'package:fruite_app/features/layout/presentation/widgets/custom_bottom_nav_bar.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});
  static const routeName = '/layout';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeView(),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
