import 'package:flutter/material.dart';
import 'package:fruite_app/features/home/presentation/view/widgets/product_item_shimmer.dart';

class BestSellingGridViewShimmer extends StatelessWidget {
  const BestSellingGridViewShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverGrid.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 163 / 214,
          crossAxisSpacing: 16,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (_, __) => const ShimmerProductItem(),
        itemCount: 4, // show 4 shimmer tiles
      ),
    );
  }
}
