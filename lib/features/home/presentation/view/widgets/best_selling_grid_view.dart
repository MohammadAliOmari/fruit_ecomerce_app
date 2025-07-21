import 'package:flutter/material.dart';
import 'package:fruite_app/features/home/presentation/view/widgets/product_item.dart';

class BestSellingGridView extends StatelessWidget {
  const BestSellingGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      sliver: SliverGrid.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 163 / 214,
            crossAxisSpacing: 16,
            mainAxisSpacing: 8),
        itemBuilder: (context, index) => const ProductItem(),
        itemCount: 4,
      ),
    );
  }
}
