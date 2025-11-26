import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruite_app/core/cubits/product_cubit/products_cubit.dart';
import 'package:fruite_app/core/widgets/search_text_field.dart';
import 'package:fruite_app/features/best_selling_product/presentation/view/widget/best_selling_grid_view_bloc_builder.dart';
import 'package:fruite_app/features/best_selling_product/presentation/view/widget/best_selling_headar.dart';
import 'package:fruite_app/features/home/presentation/view/widgets/custom_home_app_bar.dart';
import 'package:fruite_app/features/home/presentation/view/widgets/featured_list.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductsCubit>().getBestSellingProduct();
    });
  }

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
        BestSellingGridViewBlocBuilder(),
      ],
    );
  }
}
