import 'package:flutter/material.dart';
import 'package:fruite_app/core/utils/app_colors.dart';
import 'package:fruite_app/core/utils/app_images.dart';
import 'package:fruite_app/core/utils/app_text_styles.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 214,
      width: 160,
      color: Color(0xFFF3F5F7),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_border_outlined),
            ),
          ),
          Positioned.fill(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  Assets.assetsImagesFruit,
                  width: 100,
                  height: 130,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 9.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('تفاح',
                              style: AppTextStyles().bodysmallSemibold.copyWith(
                                    color: Colors.black,
                                  )),
                          const SizedBox(height: 4),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: '30دينار',
                                  style: AppTextStyles().bodysmallbold.copyWith(
                                        color:
                                            AppColors.orange /* Orange-500 */,
                                      ),
                                ),
                                TextSpan(
                                  text: '/',
                                  style: AppTextStyles()
                                      .bodysmallSemibold
                                      .copyWith(
                                        color: AppColors
                                            .lightorange /* Orange-300 */,
                                      ),
                                ),
                                TextSpan(
                                  text: ' الكيلو',
                                  style: AppTextStyles()
                                      .bodysmallSemibold
                                      .copyWith(
                                        color: AppColors
                                            .lightorange /* Grey-500 */,
                                      ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      CircleAvatar(
                        backgroundColor: AppColors.primary,
                        child: Icon(Icons.add, color: Colors.white),
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
