import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruite_app/core/cubits/cart_item_cubit/cubit/cart_item_cubit.dart';
import 'package:fruite_app/core/utils/app_colors.dart';
import 'package:fruite_app/core/utils/app_text_styles.dart';
import 'package:fruite_app/features/cart/domain/entites/cart_item_entity.dart';
import 'package:fruite_app/core/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruite_app/features/cart/presentation/views/widgets/action_button_row.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cart});
  final CartItemEntity cart;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      buildWhen: (previous, current) {
        if (current is CartItemUpdated) {
          if (current.cartItem == cart) {
            return true;
          } else {
            return false;
          }
        }
        return false;
      },
      builder: (context, state) {
        log('we build a widget here ${cart.product.name}');
        return Row(
          children: [
            Container(
              height: 92,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Color(0xffF3F5F7),
              ),
              child: Image.network(
                cart.product.imagePath!,
                height: 50,
                width: 40,
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  cart.product.name,
                  style: AppTextStyles().bodysmallbold,
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  '${cart.calculateTotalWeight()} كيلو',
                  style: AppTextStyles()
                      .bodysmallRegular
                      .copyWith(color: AppColors.orange),
                ),
                SizedBox(
                  height: 8,
                ),
                ActionButtonRow(cart: cart),
              ],
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    context.read<CartCubit>().removeFromCart(cart);
                  },
                  child: Icon(
                    Icons.delete_outline,
                    color: AppColors.lightgrey2,
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  ' ${cart.calculateTotalPrice()} دينار',
                  style: AppTextStyles()
                      .bodyBasabold
                      .copyWith(color: AppColors.orange),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
