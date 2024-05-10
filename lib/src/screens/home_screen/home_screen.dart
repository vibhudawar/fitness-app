import 'package:fitness_app/src/widgets/custom_bottom_nav_bar.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/config/size_config.dart';
import 'package:fitness_app/provider/base_view.dart';
import 'package:fitness_app/src/screens/details_screen/components/weight_operations.dart';
import 'package:fitness_app/src/screens/details_screen/details_screen.dart';
import 'package:fitness_app/src/screens/user_profile/user_profile.dart';
import 'components/body.dart';
import 'package:fitness_app/src/view/home_screen_view_model.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = '/home-screen';
  final ThemeMode? themeMode;
  final ValueChanged<ThemeMode>? onThemeModeChanged;
  final FlexSchemeData? flexSchemeData;
  const HomeScreen(
      {super.key,
      this.onThemeModeChanged,
      this.themeMode,
      this.flexSchemeData});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BaseView<HomeScreenViewModel>(
        onModelReady: (model) => {},
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.green,
              automaticallyImplyLeading: false,
              title: const Center(child: Text('FitUp')),
            ),
            body: PageView(controller: model.pageController, children: [
              SingleChildScrollView(
                child: Body(
                  model: model,
                  lastWeight: model.lastWeight,
                  monthNumber: model.monthNumber,
                ),
              ),
              const DetailsScreen(),
              UserProfile(
                onThemeModeChanged: onThemeModeChanged,
                flexSchemeData: flexSchemeData,
                themeMode: themeMode,
              ),
            ]),
            floatingActionButton: ElevatedButton(
              onPressed: () {
                WeightOperations.addWeight(context, model);
              },
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                padding: const EdgeInsets.all(10),
                backgroundColor: Colors.green,
              ),
              child: Text(
                'Add Weight',
                style: TextStyle(
                  fontSize: 15,
                  color: ThemeData().scaffoldBackgroundColor,
                ),
              ),
            ),
            bottomNavigationBar: CustomBottomNavBar(model),
          );
        });
  }
}
