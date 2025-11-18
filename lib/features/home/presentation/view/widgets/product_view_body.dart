import 'package:flutter/material.dart';
import 'package:fruite_app/core/utils/app_colors.dart';
import 'package:fruite_app/core/utils/app_text_styles.dart';
import 'package:fruite_app/core/widgets/notifcation_widget.dart';
import 'package:fruite_app/core/widgets/search_text_field.dart';

class ProductViewBody extends StatelessWidget {
  const ProductViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ListTile(
                  trailing: NotifcationWidget(),
                  title: Center(
                    child: Text(
                      'المنتجات',
                      style: AppTextStyles().bodyLargebold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SearchTextField(),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '5 نتائج',
                        style: AppTextStyles().bodyBasabold,
                      ),
                      Container(
                        height: 30,
                        width: 44,
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.lightgrey),
                            borderRadius: BorderRadius.circular(4)),
                        child: Icon(
                          size: 24,
                          Icons.swap_vert_rounded,
                          color: AppColors.lightgrey2,
                        ),
                      )
                    ]),
              ),
              SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
        //BestSellingGridViewBlocBuilder(),
      ],
    );
  }
}
