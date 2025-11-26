import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruite_app/core/cubits/product_cubit/products_cubit.dart';
import 'package:fruite_app/core/widgets/custom_error_widget.dart';
import 'package:fruite_app/features/best_selling_product/presentation/view/widget/best_selling_grid_view.dart';
import 'package:fruite_app/features/best_selling_product/presentation/view/widget/best_selling_grid_view_shimmer.dart';

class BestSellingGridViewBlocBuilder extends StatelessWidget {
  const BestSellingGridViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccessState) {
          return BestSellingGridView(products: state.products);
        } else if (state is ProductsFailureState) {
          return SliverToBoxAdapter(
            child: CustomErrorWidget(message: state.message),
          );
        } else {
          return BestSellingGridViewShimmer();
        }
      },
    );
  }
}
