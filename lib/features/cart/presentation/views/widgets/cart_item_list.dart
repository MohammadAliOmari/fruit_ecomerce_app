import 'package:flutter/material.dart';
import 'package:fruite_app/features/cart/domain/entites/cart_item_entity.dart';
import 'package:fruite_app/features/cart/presentation/views/widgets/cart_item.dart';

class CartItemList extends StatelessWidget {
  const CartItemList({super.key, required this.cart});
  final List<CartItemEntity> cart;
  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (context, index) {
        return const Divider(
          color: Color(0xffEBF9F1),
          thickness: 2,
          height: 22,
        );
      },
      itemCount: cart.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: CartItem(cart: cart[index]),
        );
      },
    );
  }
}
