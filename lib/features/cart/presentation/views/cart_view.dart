import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruite_app/core/cubits/cart_item_cubit/cubit/cart_item_cubit.dart';
import 'package:fruite_app/core/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruite_app/features/cart/presentation/views/widgets/cart_view_body.dart';
import 'package:fruite_app/features/cart/presentation/views/widgets/custom_cart_button.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartItemCubit(),
      child: Scaffold(
        body: SafeArea(child: CartViewBody()),
        bottomNavigationBar:
            context.read<CartCubit>().cartEntity.cartList.isEmpty
                ? SizedBox.shrink()
                : CustomCartButton(),
      ),
    );
  }
}
