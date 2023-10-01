import 'package:flutter/material.dart';
import 'package:mvvm_try/routes/routes.dart';
import 'package:mvvm_try/screens/home.screen/home_screen.dart';
import 'package:mvvm_try/screens/login.screen/login_screen.dart';
import 'package:mvvm_try/screens/signup.screen/signup_screen.dart';
import 'package:mvvm_try/screens/splash.screen/splash.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case RoutesName.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case RoutesName.login:
        return MaterialPageRoute(
          builder: (_) => const LogInScreen(),
        );
      case RoutesName.signUp:
        return MaterialPageRoute(
          builder: (_) => const SignUpScreen(),
        );

      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(
                    child: Text('No Routes Fount'),
                  ),
                ));
    }
  }
}
