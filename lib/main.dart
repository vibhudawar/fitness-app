import 'package:firebase_core/firebase_core.dart';
import 'package:fitness_app/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/provider/getit.dart';
import 'package:fitness_app/routes/routes.dart';
import 'package:fitness_app/service/navigation_service.dart';
import 'package:fitness_app/src/screens/home_screen/home_screen.dart';
import 'package:fitness_app/src/screens/splash_screen/splash_screen.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.system;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const FlexScheme usedScheme = FlexScheme.aquaBlue;
    return MaterialApp(
      title: 'FitUp',
      navigatorKey: getIt<NavigationService>().navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: FlexThemeData.light(
        useMaterial3: false,
        scheme: usedScheme,
        appBarElevation: 0.5,
      ),
      darkTheme: FlexThemeData.dark(
        scheme: usedScheme,
        appBarElevation: 2,
      ),
      themeMode: themeMode,
      routes: routes,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx, snapShots) {
          if (snapShots.hasData) {
            return HomeScreen(
              onThemeModeChanged: (ThemeMode mode) {
                setState(() {
                  themeMode = mode;
                });
              },
              flexSchemeData: FlexColor.schemes[usedScheme]!,
              themeMode: themeMode,
            );
          }
          return const SplashScreen();
        },
      ),
    );
  }
}
