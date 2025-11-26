import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruite_app/core/widgets/custom_button.dart';
import 'package:fruite_app/core/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruite_app/features/cart/presentation/views/widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: CartViewBody()),
      bottomNavigationBar: context.read<CartCubit>().cartEntity.cartList.isEmpty
          ? SizedBox.shrink()
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomButton(
                title:
                    'الدفع ${context.watch<CartCubit>().cartEntity.calculateTotalPrice()} دينار',
                onPressed: () {},
              ),
            ),
    );
  }
}
