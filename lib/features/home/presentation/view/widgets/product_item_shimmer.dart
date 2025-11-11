import 'package:flutter/material.dart';
import 'package:fruite_app/core/utils/app_colors.dart';
import 'package:fruite_app/core/utils/app_text_styles.dart';
import 'package:fruite_app/core/widgets/shimmer_loading.dart';

class ShimmerProductItem extends StatelessWidget {
  const ShimmerProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Color(0xFFF3F5F7),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                ShimmerLoading(
                  child: Container(
                    width: 100,
                    height: 130,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 9.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // First line (Product name)
                          ShimmerLoading(
                            child: Container(
                              width: 60,
                              height: 14,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          // Second line (price info)
                          ShimmerLoading(
                            child: Container(
                              width: 70,
                              height: 12,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      ShimmerLoading(
                        child: CircleAvatar(
                          backgroundColor: AppColors.primary,
                          child: Icon(Icons.add, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
