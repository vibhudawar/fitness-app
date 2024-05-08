import 'package:fitness_app/src/screens/about_screen/about_us_screen.dart';
import 'package:fitness_app/src/screens/auth_screen/auth_screen.dart';
import 'package:fitness_app/src/screens/details_screen/details_screen.dart';
import 'package:fitness_app/src/screens/home_screen/home_screen.dart';
import 'package:fitness_app/src/screens/splash_screen/splash_screen.dart';
import 'package:flutter/cupertino.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => const HomeScreen(),
  DetailsScreen.routeName: (context) => const DetailsScreen(),
  AuthScreen.routeName: (context) => const AuthScreen(),
  SplashScreen.routeName: (context) => const SplashScreen(),
  AboutUs.routeName: (context) => const AboutUs(),
};
