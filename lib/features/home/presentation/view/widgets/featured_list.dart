import 'package:flutter/material.dart';
import 'package:fruite_app/features/home/presentation/view/widgets/featured_item.dart';

class FeaturedList extends StatelessWidget {
  const FeaturedList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 158, // Adjust based on your design
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemCount: 5, // Set your item count here
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: FeaturedItem(),
          );
        },
      ),
    );
  }
}
