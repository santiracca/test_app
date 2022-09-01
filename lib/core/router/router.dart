import 'package:flutter/material.dart';
import 'package:test_app/features/home/views/home_view.dart';
import 'package:test_app/features/user/views/profile_view.dart';

class Router {
  static const homePage = '/home';
  static const profilePage = '/profile';

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(builder: (context) => const HomeView());
      case profilePage:
        return MaterialPageRoute(builder: (context) => const ProfileView());
      default:
        return null;
    }
  }
}
