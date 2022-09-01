import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:test_app/core/dependecy_injection/locator.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NavigationService _navigationService = locator<NavigationService>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: GestureDetector(
        onTap: () {
          _navigationService.back();
        },
        child: const Center(
          child: Text("User Page"),
        ),
      ),
    );
  }
}
