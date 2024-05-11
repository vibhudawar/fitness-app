import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fitness_app/provider/base_view.dart';
import 'package:fitness_app/src/screens/auth_screen/auth_screen.dart';
import 'package:fitness_app/src/view/user_profile_view_model.dart';

class UserProfile extends StatelessWidget {
  final ThemeMode? themeMode;
  final ValueChanged<ThemeMode>? onThemeModeChanged;
  final FlexSchemeData? flexSchemeData;

  const UserProfile(
      {super.key,
      this.onThemeModeChanged,
      this.themeMode,
      this.flexSchemeData});

  @override
  Widget build(BuildContext context) {
    return BaseView<UserProfileViewModel>(
        onModelReady: (model) => {
              model.init(context),
            },
        builder: (context, model, child) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(10),
              child: model.isLoaded
                  ? ListView(
                      children: [
                        // User card
                        SimpleUserCard(
                          imageRadius: 20,
                          userProfilePic: NetworkImage(model.user.imageUrl),
                          userName: model.user.name,
                        ),
                        SettingsGroup(
                          items: [
                            SettingsItem(
                              onTap: () {
                                model.signOut();
                                Fluttertoast.showToast(msg: 'Signout Success');
                                Navigator.of(context)
                                    .pushNamed(AuthScreen.routeName);
                              },
                              icons: Icons.exit_to_app_rounded,
                              title: "Sign Out",
                            ),
                            SettingsItem(
                              onTap: () {
                                model.deleteAccount();
                                Fluttertoast.showToast(
                                    msg: 'User Account Deleted');
                                Navigator.of(context)
                                    .pushNamed(AuthScreen.routeName);
                              },
                              icons: CupertinoIcons.delete_solid,
                              title: "Delete account",
                              titleStyle: const TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
          );
        });
  }
}
