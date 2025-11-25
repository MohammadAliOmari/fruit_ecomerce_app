import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruite_app/core/utils/app_text_styles.dart';
import 'package:fruite_app/features/home/presentation/cart_cubit/cart_cubit.dart';
import 'package:fruite_app/features/home/presentation/view/widgets/cart_item_list.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(children: [
            ListTile(
              title: Center(
                child: Text(
                  'السلة',
                  style: AppTextStyles().bodyLargebold,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              color: Color(0xffEBF9F1),
              width: double.infinity,
              child: Center(
                child: Text(
                  context.read<CartCubit>().cartEntity.cartList.isEmpty
                      ? 'لا يوجد منتجات في السلة'
                      : 'لديك ${context.watch<CartCubit>().cartEntity.cartList.length} منتجات في السلة',
                  style: AppTextStyles()
                      .bodysmallRegular
                      .copyWith(color: Color(0xff1B5E37)),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
          ]),
        )),
        CartItemList(cart: context.read<CartCubit>().cartEntity.cartList),
      ],
    );
  }
}
