import 'package:bloc_pattern_app/routes/app_routes.dart';
import 'package:bloc_pattern_app/routes/route_generator.dart';
import 'package:bloc_pattern_app/themes/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const SafeArea(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meals App',
      theme: lightTheme(),
      darkTheme: darkTheme(),
      initialRoute: AppRoutes.splash,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
