import 'package:flutter/material.dart';
import 'package:fruite_app/constants.dart';
import 'package:fruite_app/core/services/firebase_auth_service.dart';
import 'package:fruite_app/core/services/shared_preferences.dart';
import 'package:fruite_app/core/utils/app_images.dart';
import 'package:fruite_app/features/auth/presentation/view/signin_view.dart';
import 'package:fruite_app/features/home/presentation/view/home_view.dart';
import 'package:fruite_app/features/on_boarding/presentation/view/on_boarding_view.dart';
import 'package:svg_flutter/svg.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    excuteNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(Assets.assetsImagesPlant),
          ],
        ),
        SvgPicture.asset(Assets.assetsImagesLogo),
        SvgPicture.asset(
          Assets.assetsImagesSplashBottom,
          fit: BoxFit.fill,
        ),
      ],
    );
  }

  void excuteNavigation() {
    Future.delayed(const Duration(seconds: 3), () {
      bool isSignedIn = FirebaseAuthService().isUserSignedIn();
      bool isOnBoardingSeen = Prefs.getBool(kisOnBoardingSeen);
      if (mounted) {
        if (isOnBoardingSeen) {
          if (isSignedIn) {
            Navigator.pushReplacementNamed(context, HomeView.routeName);
          } else {
            Navigator.pushReplacementNamed(context, SigninView.routeName);
          }
        } else {
          Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
        }
      }
    });
  }
}
