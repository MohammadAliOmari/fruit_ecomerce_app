import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruite_app/core/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruite_app/core/cubits/cart_item_cubit/cubit/cart_item_cubit.dart';
import 'package:fruite_app/core/widgets/custom_button.dart';
import 'package:fruite_app/features/check_out/presentation/view/check_out_view.dart';

class CustomCartButton extends StatelessWidget {
  const CustomCartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: CustomButton(
            title:
                'الدفع ${context.watch<CartCubit>().cartEntity.calculateTotalPrice()} دينار',
            onPressed: () {
              Navigator.pushNamed(context, CheckOutView.routeName);
            },
          ),
        );
      },
    );
  }
}
