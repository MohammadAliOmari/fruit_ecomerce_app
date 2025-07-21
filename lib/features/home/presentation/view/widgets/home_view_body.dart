import 'package:flutter/material.dart';
import 'package:fruite_app/core/widgets/search_text_field.dart';
import 'package:fruite_app/features/home/presentation/view/widgets/best_selling_grid_view.dart';
import 'package:fruite_app/features/home/presentation/view/widgets/best_selling_headar.dart';
import 'package:fruite_app/features/home/presentation/view/widgets/custom_home_app_bar.dart';
import 'package:fruite_app/features/home/presentation/view/widgets/featured_list.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              CustomHomeAppBar(),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SearchTextField(),
              ),
              SizedBox(
                height: 12,
              ),
              FeaturedList(),
              SizedBox(
                height: 12,
              ),
              BestSellingHeadar(),
              SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
        BestSellingGridView(),
      ],
    );
  }
}
