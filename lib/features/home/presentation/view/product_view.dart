import 'package:flutter/material.dart';
import 'package:fruite_app/features/home/presentation/view/widgets/product_view_body.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: ProductViewBody()),
    );
  }
}
