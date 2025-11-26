import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruite_app/core/entities/product_entity.dart';
import 'package:fruite_app/core/utils/app_colors.dart';
import 'package:fruite_app/core/utils/app_text_styles.dart';
import 'package:fruite_app/core/cubits/cart_cubit/cart_cubit.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Color(0xFFF3F5F7),
      ),
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
                productEntity.imagePath != null
                    ? Image.network(
                        productEntity.imagePath!,
                        width: 100,
                        height: 140,
                      )
                    : Container(
                        width: 100,
                        height: 140,
                        color: Colors.white,
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
                          Text(productEntity.name,
                              style: AppTextStyles().bodysmallSemibold.copyWith(
                                    color: Colors.black,
                                  )),
                          const SizedBox(height: 4),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: '${productEntity.price} د.أ',
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
                      GestureDetector(
                        onTap: () {
                          context.read<CartCubit>().addToCart(
                                productEntity,
                              );
                        },
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
