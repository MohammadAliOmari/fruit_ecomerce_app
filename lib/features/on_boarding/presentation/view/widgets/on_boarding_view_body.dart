import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruite_app/constants.dart';
import 'package:fruite_app/core/services/shared_preferences.dart';
import 'package:fruite_app/core/utils/app_colors.dart';
import 'package:fruite_app/core/widgets/custom_button.dart';
import 'package:fruite_app/features/auth/presentation/view/signin_view.dart';
import 'package:fruite_app/features/on_boarding/presentation/view/widgets/on_boarrding_page_view.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  PageController pageController = PageController();
  int currentPage = 0;
  @override
  void initState() {
    pageController.addListener(() {
      currentPage = pageController.page!.round();
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: OnBoarrdingPageView(
            pageController: pageController,
          ),
        ),
        DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(
            activeColor: currentPage == 0
                ? AppColors.primary
                : AppColors.primary.withOpacity(0.5),
            color: currentPage == 1
                ? AppColors.primary
                : AppColors.primary.withOpacity(0.5),
          ),
        ),
        const SizedBox(
          height: 29,
        ),
        Visibility(
          visible: currentPage == 1 ? true : false,
          maintainState: true,
          maintainAnimation: true,
          maintainSize: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomButton(
                title: 'ابدأ الان',
                onPressed: () async {
                  final navigator = Navigator.of(context);
                  Prefs.setBool(kisOnBoardingSeen, true);
                  navigator.pushReplacementNamed(
                    SigninView.routeName, // Replace with your actual route name
                  );
                }),
          ),
        ),
        const SizedBox(
          height: 34,
        )
      ],
    );
  }
}
