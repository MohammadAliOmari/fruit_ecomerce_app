import 'package:flutter/material.dart';
import 'package:fruite_app/constants.dart';
import 'package:fruite_app/core/services/shared_preferences.dart';
import 'package:fruite_app/core/utils/app_colors.dart';
import 'package:fruite_app/core/utils/app_text_styles.dart';
import 'package:fruite_app/features/auth/presentation/view/signin_view.dart';
import 'package:svg_flutter/svg.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.image,
    required this.backgroundImage,
    required this.subtitle,
    required this.title,
    required this.visible,
  });
  final String image, backgroundImage, subtitle;
  final Widget title;
  final bool visible; // Placeholder for visibility condition
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  backgroundImage,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: SvgPicture.asset(
                  image,
                ),
              ),
              Visibility(
                visible: visible,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: GestureDetector(
                    onTap: () async {
                      final navigator = Navigator.of(context);
                      final cacheService = await CacheService.instance;
                      await cacheService.setBool(kisOnBoardingSeen, true);

                      navigator.pushReplacementNamed(
                        SigninView.routeName,
                      );
                    },
                    child: Text(
                      'تخط',
                      style: AppTextStyles().bodysmallRegular.copyWith(
                            color: AppColors.grey,
                          ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 64,
        ),
        title,
        const SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 37),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const AppTextStyles()
                .bodysmallSemibold
                .copyWith(color: AppColors.grey),
          ),
        )
      ],
    );
  }
}
