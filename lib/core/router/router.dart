import 'package:flutter/material.dart';
import 'package:test_app/features/workout/presentation/views/home_view.dart';

class Router {
  static const homePage = '/home';
  static const profilePage = '/profile';

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(builder: (context) => const HomeView());
      default:
        return null;
    }
  }
}
