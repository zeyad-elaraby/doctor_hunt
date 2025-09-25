import 'package:doctor_hunt/core/helper/route_manager.dart/routes.dart';
import 'package:doctor_hunt/features/login/presentation/views/login_view.dart' show LoginView;
import 'package:doctor_hunt/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:doctor_hunt/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';


Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.splashView:
      return MaterialPageRoute(builder: (context) => SplashView());
    case AppRoutes.onboardingView:
      return MaterialPageRoute(builder: (context) => OnBoardingView());
    case AppRoutes.loginView:
      return MaterialPageRoute(builder: (context) => LoginView());

    default:
      return MaterialPageRoute(
        builder: (context) =>
            Scaffold(body: Center(child: Text('No Route Found'))),
      );
  }
}
