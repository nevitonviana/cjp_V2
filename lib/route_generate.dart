import 'package:flutter/material.dart';

import '/screen/screen.dart';

class RouteGenerate {
  static const String routeLogin = "/";
  static const String routeAccount = "/account";

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    dynamic args = settings.arguments;
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );

      case "/account":
        return MaterialPageRoute(
          builder: (context) => const CreateAccountScreen(),
        );

      default:
    }
  }
}
