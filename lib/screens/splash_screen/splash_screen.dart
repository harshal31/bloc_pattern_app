import 'dart:async';
import 'package:bloc_pattern_app/routes/app_routes.dart';
import 'package:bloc_pattern_app/themes/theme.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SplashState();
}

class _SplashState extends State<SplashScreen> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, AppRoutes.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorScheme().background,
      child: const Center(
        child: FlutterLogo(
          size: 180,
        ),
      ),
    );
  }
}
