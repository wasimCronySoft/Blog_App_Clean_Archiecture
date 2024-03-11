import 'package:clean_arch_application/core/routes/routes_constants.dart';
import 'package:clean_arch_application/features/auth/presentation/pages/login_view.dart';
import 'package:clean_arch_application/features/auth/presentation/pages/sign_up_view.dart';
import 'package:clean_arch_application/features/homepage/presentation/pages/hompage_view.dart';
import 'package:flutter/material.dart';

class RoutesGenerator {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homepage:
        return MaterialPageRoute(
          builder: (context) => const HomepageView(),
        );
      case Routes.login:
        return MaterialPageRoute(
          builder: (context) => const LoginView(),
        );
      case Routes.singup:
        return MaterialPageRoute(
          builder: (context) => const SignupView(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const SignupView(),
        );
    }
  }
}
