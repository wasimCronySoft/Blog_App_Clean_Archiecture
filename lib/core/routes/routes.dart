import 'package:clean_arch_application/core/routes/routes_constants.dart';
import 'package:clean_arch_application/features/auth/presentation/pages/login_view.dart';
import 'package:clean_arch_application/features/auth/presentation/pages/sign_up_view.dart';
import 'package:clean_arch_application/features/homepage/presentation/pages/hompage_view.dart';
import 'package:flutter/material.dart';

class RoutesGenerator {
  static generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homepage:
        MaterialPageRoute(
          builder: (context) => const HomepageView(),
        );
      case Routes.login:
        MaterialPageRoute(
          builder: (context) => const LoginView(),
        );
      case Routes.singup:
        MaterialPageRoute(
          builder: (context) => const SignupView(),
        );

      default:
    }
  }
}
