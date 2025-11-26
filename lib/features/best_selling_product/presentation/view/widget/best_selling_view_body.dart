import 'package:flutter/material.dart';
import 'package:fruite_app/core/utils/app_text_styles.dart';
import 'package:fruite_app/features/best_selling_product/presentation/view/widget/best_selling_grid_view_bloc_builder.dart';

class BestSellingViewBody extends StatelessWidget {
  const BestSellingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'الأكثر مبيعًا',
              style: AppTextStyles().bodyBasabold.copyWith(
                    color: Colors.black,
                  ),
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 8),
        ),
        BestSellingGridViewBlocBuilder(),
      ],
    );
  }
}
