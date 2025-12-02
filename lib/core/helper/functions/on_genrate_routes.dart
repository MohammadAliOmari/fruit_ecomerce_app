import 'package:flutter/material.dart';
import 'package:fruite_app/features/auth/presentation/view/signin_view.dart';
import 'package:fruite_app/features/auth/presentation/view/signup_view.dart';
import 'package:fruite_app/features/best_selling_product/presentation/view/best_selling_view.dart';
import 'package:fruite_app/features/check_out/presentation/view/check_out_view.dart';
import 'package:fruite_app/features/home/presentation/view/home_view.dart';
import 'package:fruite_app/features/layout/presentation/layout_view.dart';
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
    case LayoutView.routeName:
      return MaterialPageRoute(
        builder: (_) => const LayoutView(),
      );
    case CheckOutView.routeName:
      return MaterialPageRoute(
        builder: (_) => const CheckOutView(),
      );
    case SigninView.routeName:
      return MaterialPageRoute(
        builder: (_) => const SigninView(),
      );
    case SignupView.routeName:
      return MaterialPageRoute(
        builder: (_) => const SignupView(),
      );
    case HomeView.routeName:
      return MaterialPageRoute(
        builder: (_) => const HomeView(),
      );
    case BestSellingView.routeName:
      return MaterialPageRoute(
        builder: (_) => const BestSellingView(),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(child: Text('Page not found')),
        ),
      );
  }
}
