import 'package:bloc_pattern_app/routes/app_routes.dart';
import 'package:bloc_pattern_app/screens/home_screen/new_home_screen.dart';
import 'package:bloc_pattern_app/screens/home_screen/new_user_bloc/new_user_bloc.dart';
import 'package:bloc_pattern_app/screens/home_screen/repository/user_repository.dart';
import 'package:bloc_pattern_app/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
    case AppRoutes.splash:
    return MaterialPageRoute(
    builder: (ctx) => const SplashScreen(),
    );
    case AppRoutes.home:
    return MaterialPageRoute(
    builder: (ctx) => RepositoryProvider(
    create: (context) => UserRepository(),
    child: BlocProvider(
    create: (context) => NewUserBloc(context.read<UserRepository>()),
    child: NewHomeScreen(),
    ),
    ),
    );
    case: AppRoutes.detail:
    return MaterialPageRoute(builder: (ctx) => {})
    default:
    return null;
    }
  }
}

// case AppRoutes.home:
// return MaterialPageRoute(
// builder: (ctx) => RepositoryProvider(
// create: (context) => UserRepository(),
// child: BlocProvider(
// create: (context) => UserBloc(context.read<UserRepository>()),
// child: HomeScreen(),
// ),
// ),
// );
