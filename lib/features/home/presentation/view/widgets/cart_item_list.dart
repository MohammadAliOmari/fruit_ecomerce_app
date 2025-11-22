import 'package:flutter/material.dart';
import 'package:fruite_app/features/home/presentation/view/widgets/cart_item.dart';

class CartItemList extends StatelessWidget {
  const CartItemList({super.key});

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
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: const CartItem(),
        );
      },
    );
  }
}
