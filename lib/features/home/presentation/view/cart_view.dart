import 'package:flutter/material.dart';
import 'package:fruite_app/core/widgets/custom_button.dart';
import 'package:fruite_app/features/home/presentation/view/widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: CartViewBody()),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomButton(
          title: 'الدفع 120 دينار',
          onPressed: () {},
        ),
      ),
    );
  }
}
