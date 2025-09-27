import 'package:doctor_hunt/core/helper/route_manager.dart/routes.dart';
import 'package:doctor_hunt/features/authentication/presentation/views/login_view.dart'
    show LoginView;
import 'package:doctor_hunt/features/authentication/presentation/views/sign_up_view.dart';
import 'package:doctor_hunt/features/find_doctors/presentation/views/find_doctors_view.dart';
import 'package:doctor_hunt/features/home/presentation/views/bottom_nav_view.dart';
import 'package:doctor_hunt/features/home/presentation/views/home_view.dart';
import 'package:doctor_hunt/features/live/presentation/views/live_view.dart';
import 'package:doctor_hunt/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:doctor_hunt/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';

import 'package:doctor_hunt/features/home/presentation/views/bottom_nav_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.splashView:
      return MaterialPageRoute(builder: (context) => SplashView());
    case AppRoutes.onboardingView:
      return MaterialPageRoute(builder: (context) => OnBoardingView());
    case AppRoutes.loginView:
      return MaterialPageRoute(builder: (context) => LoginView());
    case AppRoutes.signUpView:
      return MaterialPageRoute(builder: (context) => SignUpView());
    case AppRoutes.homeView:
      return MaterialPageRoute(builder: (context) => HomeView());
    case AppRoutes.liveView:
      return MaterialPageRoute(builder: (context) => LiveView());
    case AppRoutes.bottomNavView:
      return MaterialPageRoute(
        builder: (context) => BottomNavView(currentIndex: 0),
      );
    case AppRoutes.findDoctorsView:
      return MaterialPageRoute(
        builder: (context) => FindDoctorsView(),
      );

    default:
      return MaterialPageRoute(
        builder: (context) =>
            Scaffold(body: Center(child: Text('No Route Found'))),
      );
  }
}
