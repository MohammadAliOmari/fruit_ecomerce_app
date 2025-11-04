import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruite_app/core/product_cubit/products_cubit.dart';
import 'package:fruite_app/core/repos/product_repo/product_repo.dart';
import 'package:fruite_app/core/services/get_it_service.dart';
import 'package:fruite_app/features/home/presentation/view/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(getIt<ProductRepo>()),
      child: SafeArea(child: HomeViewBody()),
    );
  }
}
