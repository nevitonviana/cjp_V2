import 'package:flutter/material.dart';

import '/screen/screen.dart';

class RouteGenerate {
  static const String routeSplash = "/";
  static const String routeLogin = "/login";
  static const String routeAccount = "/account";
  static const String routeHome = "/home";
  static const String routeAddOccurrence = "/addOccurrence";
  static const String routeOccurrenceDetail = "/occurrenceDetail";
  static const String routeMyOccurrence = "/myOccurrence";
  static const String routeEditOccurrence = "/editOccurrence";
  static const String routeProfile = "/profile";
  static const String routeFeedback = "/feedBack";

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    dynamic args = settings.arguments;
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case "/login":
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case "/account":
        return MaterialPageRoute(
          builder: (context) => const CreateAccountScreen(),
        );
      case "/home":
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case "/addOccurrence":
        return MaterialPageRoute(
          builder: (context) => const AddOrEditOccurrence(),
        );
      case "/myOccurrence":
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(
            myOccurrence: true,
          ),
        );
      case "/editOccurrence":
        return MaterialPageRoute(
          builder: (context) => AddOrEditOccurrence(occurrenceModel: args),
        );
      case "/occurrenceDetail":
        return MaterialPageRoute(
          builder: (context) => OccurrenceDetailScreen(occurrenceModel: args),
        );
      case "/profile":
        return MaterialPageRoute(
          builder: (context) => const ProfileScreen(),
        );
      case "/feedBack":
        return MaterialPageRoute(
          builder: (context) => const FeedBack(),
        );
    }
  }
}
