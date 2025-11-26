import 'package:flutter/material.dart';
import 'package:fruite_app/core/widgets/custom_app_bar.dart';
import 'package:fruite_app/features/best_selling_product/presentation/view/widget/best_selling_view_body.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruite_app/core/cubits/product_cubit/products_cubit.dart';
import 'package:fruite_app/core/repos/product_repo/product_repo.dart';
import 'package:fruite_app/core/services/get_it_service.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});
  static const String routeName = '/best-selling';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(
        getIt.get<ProductRepo>(),
      )..getBestSellingProduct(),
      child: Scaffold(
        appBar: customAppBar(context: context, title: "الأكثر مبيعًا"),
        body: const BestSellingViewBody(),
      ),
    );
  }
}
