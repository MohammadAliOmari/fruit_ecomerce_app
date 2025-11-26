import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruite_app/core/cubits/product_cubit/products_cubit.dart';
import 'package:fruite_app/core/repos/product_repo/product_repo.dart';
import 'package:fruite_app/core/services/get_it_service.dart';
import 'package:fruite_app/features/products/presentation/view/widgets/product_view_body.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(getIt<ProductRepo>()),
      child: Scaffold(
        body: SafeArea(child: ProductViewBody()),
      ),
    );
  }
}
