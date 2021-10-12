import 'package:flutter/material.dart';

import '/screen/screen.dart';

class RouteGenerate {
  static const String routeLogin = "/";
  static const String routeAccount = "/account";
  static const String routeHome = "/home";
  static const String routeAddOccurrence = "/AddOccurrence";

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    dynamic args = settings.arguments;
    switch (settings.name) {
      case "/home":
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case "/account":
        return MaterialPageRoute(
          builder: (context) => const CreateAccountScreen(),
        );
      case "/":
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case "/AddOccurrence":
        return MaterialPageRoute(
          builder: (context) => const AddOrEditOccurrence(),
        );

      default:
    }
  }
}
