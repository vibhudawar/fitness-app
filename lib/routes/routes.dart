import 'package:flutter/cupertino.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  AuthScreen.routeName: (context) => AuthScreen(),
  SplashScreen.routeName: (context) => SplashScreen(),
  AboutUs.routeName: (context) => AboutUs(),
};
