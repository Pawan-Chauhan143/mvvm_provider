import 'package:flutter/material.dart';
import 'package:mvvmprojectss/utils/routes/routes_name.dart';
import 'package:mvvmprojectss/view/home_screen.dart';
import 'package:mvvmprojectss/view/login_view.dart';
import 'package:mvvmprojectss/view/signup_view.dart';
import 'package:mvvmprojectss/view/splash_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(builder: (context) => const LoginView());
      case RoutesName.signUp:
        return MaterialPageRoute(builder: (context) => const SignUpView());
      case RoutesName.splashView:
        return MaterialPageRoute(builder: (context) => const SplashView());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No routes defined'),
            ),
          );
        });
    }
  }
}
