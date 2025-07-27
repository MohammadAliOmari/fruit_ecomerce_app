import 'package:flutter/material.dart';
import 'package:fruite_app/core/utils/app_text_styles.dart';
import 'package:fruite_app/features/home/presentation/view/widgets/best_selling_grid_view.dart';

class BestSellingViewBody extends StatelessWidget {
  const BestSellingViewBody({super.key});

  @override
/*************  ✨ Windsurf Command ⭐  *************/
  /// Build method for [BestSellingViewBody]

/*******  c879cb59-c7c2-4c13-a78b-e630dbb02d95  *******/
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
        SliverToBoxAdapter(
          child: SizedBox(height: 8),
        ),
        const BestSellingGridView(),
      ],
    );
  }
}
