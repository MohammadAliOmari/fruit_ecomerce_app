import 'package:flutter/material.dart';
import 'package:fruite_app/core/widgets/search_text_field.dart';
import 'package:fruite_app/features/home/presentation/view/widgets/custom_home_app_bar.dart';

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
          ],
        )),
      ],
    );
  }
}
