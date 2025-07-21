import 'package:flutter/material.dart';
import 'package:fruite_app/features/home/presentation/view/widgets/custom_bottom_nav_bar.dart';
import 'package:fruite_app/features/home/presentation/view/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(),
      body: SafeArea(child: HomeViewBody()),
    );
  }
}
