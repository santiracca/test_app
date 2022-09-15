// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:test_app/core/dependency_injection/locator.dart';
import 'package:test_app/core/router/router.dart' as router;

void main() {
  setupLocator();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      navigatorKey: StackedService.navigatorKey,
      initialRoute: router.Router.homePage,
      onGenerateRoute: router.Router.generateRoute,
    );
  }
}
