import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruite_app/core/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruite_app/core/cubits/cart_item_cubit/cubit/cart_item_cubit.dart';
import 'package:fruite_app/features/cart/domain/entites/cart_item_entity.dart';
import 'package:fruite_app/core/utils/app_colors.dart';
import 'package:fruite_app/core/utils/app_text_styles.dart';

class ActionButtonRow extends StatelessWidget {
  const ActionButtonRow({
    super.key,
    required this.cart,
  });

  final CartItemEntity cart;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            cart.incrementQuantity();
            context.read<CartItemCubit>().updateCartItem(cart);
          },
          child: CircleAvatar(
            radius: 14,
            backgroundColor: AppColors.primary,
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          width: 16,
        ),
        Text(
          cart.quantity.toString(),
          style: AppTextStyles().bodyBasabold,
        ),
        SizedBox(
          width: 16,
        ),
        GestureDetector(
          onTap: () {
            cart.decrementQuantity();
            if (cart.quantity == 0) {
              context.read<CartCubit>().removeFromCart(cart);
            }
            context.read<CartItemCubit>().updateCartItem(cart);
          },
          child: CircleAvatar(
              radius: 14,
              backgroundColor: AppColors.lightgrey,
              child: Icon(
                color: AppColors.lightgrey2,
                Icons.remove,
              )),
        )
      ],
    );
  }
}
