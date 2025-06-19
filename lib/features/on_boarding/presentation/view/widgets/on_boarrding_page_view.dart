import 'package:flutter/material.dart';
import 'package:fruite_app/core/utils/app_colors.dart';
import 'package:fruite_app/core/utils/app_images.dart';
import 'package:fruite_app/core/utils/app_text_styles.dart';
import 'package:fruite_app/features/on_boarding/presentation/view/widgets/page_view_item.dart';

class OnBoarrdingPageView extends StatelessWidget {
  const OnBoarrdingPageView({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
            visible: true,
            image: Assets.assetsImagesOnboardingImg1,
            backgroundImage: Assets.assetsImagesOnboardingBg1,
            subtitle:
                'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل  على أفضل العروض والجودة العالية.',
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'مرحبًا بك في',
                  style: const AppTextStyles().headingHeading5bold,
                ),
                Text(
                  ' HUB',
                  style: const AppTextStyles().headingHeading5bold.copyWith(
                        color: AppColors.orange,
                      ),
                ),
                Text(
                  'Fruit',
                  style: const AppTextStyles().headingHeading5bold.copyWith(
                        color: AppColors.primary,
                      ),
                ),
              ],
            )),
        PageViewItem(
            visible: false,
            image: Assets.assetsImagesOnboardingImg2,
            backgroundImage: Assets.assetsImagesOnboardingBg2,
            subtitle:
                'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ابحث وتسوق',
                  style: const AppTextStyles().headingHeading5bold,
                ),
              ],
            )),
      ],
    );
  }
}
