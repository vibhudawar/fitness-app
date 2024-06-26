import 'package:fitness_app/src/view/auth_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/config/size_config.dart';
import 'package:fitness_app/provider/base_view.dart';
import 'components/auth_form.dart';

class AuthScreen extends StatelessWidget {
  static String routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<AuthScreenViewModel>(builder: (context, model, child) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.green,
        body: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: getProportionateScreenHeight(40),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Image.asset(
                'assets/images/splash_1024.png',
                height: getProportionateScreenHeight(65),
                width: getProportionateScreenWidth(63),
              ),
            ),
            Text(
              'Hello',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: getProportionateScreenWidth(40),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: getProportionateScreenWidth(8),
                ),
                Text(
                  'Welcome to FitUp',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: getProportionateScreenWidth(20),
                  ),
                ),
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            AuthForm(
              model: model,
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'By tapping signup I agree to FitUp\'s terms of service. Privacy policy and user agreement.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: getProportionateScreenWidth(13),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
