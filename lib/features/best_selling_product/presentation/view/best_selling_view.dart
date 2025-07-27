import 'package:flutter/material.dart';
import 'package:fruite_app/core/widgets/custom_app_bar.dart';
import 'package:fruite_app/features/best_selling_product/presentation/view/widget/best_selling_view_body.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});
  static const String routeName = '/best-selling';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: "الأكثر مبيعًا"),
      body: BestSellingViewBody(),
    );
  }
}
