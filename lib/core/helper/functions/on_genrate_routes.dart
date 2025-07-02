import 'package:flutter/material.dart';
import 'package:fruite_app/features/auth/presentation/view/signin_view.dart';
import 'package:fruite_app/features/auth/presentation/view/signup_view.dart';
import 'package:fruite_app/features/on_boarding/presentation/view/on_boarding_view.dart';
import 'package:fruite_app/features/splash/presentation/view/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  // Define your routes here
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (_) => const SplashView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(
        builder: (_) => const OnBoardingView(),
      );
    case SigninView.routeName:
      return MaterialPageRoute(
        builder: (_) => const SigninView(),
      );
    case SignupView.routeName:
      return MaterialPageRoute(
        builder: (_) => const SignupView(),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(child: Text('Page not found')),
        ),
      );
  }
}
