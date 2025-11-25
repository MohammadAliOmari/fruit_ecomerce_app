import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruite_app/features/home/presentation/cart_cubit/cart_cubit.dart';
import 'package:fruite_app/features/home/presentation/view/cart_view.dart';
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
    CartView(),
    Container(
      color: Colors.green,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: BlocListener<CartCubit, CartState>(
        listener: (context, state) {
          if (state is AddToCart) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Product added to cart')),
            );
          }
        },
        child: Scaffold(
          body: screens[curentindex],
          bottomNavigationBar: CustomBottomNavBar(
            onTabChange: (value) {
              setState(() {
                curentindex = value;
              });
            },
          ),
        ),
      ),
    );
  }
}
