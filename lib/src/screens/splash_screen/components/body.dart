import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:fitness_app/config/size_config.dart';
import 'package:fitness_app/constant/constant.dart';
import 'package:fitness_app/src/screens/auth_screen/auth_screen.dart';
import 'package:fitness_app/src/screens/splash_screen/components/carousel_card.dart';

class Body extends StatelessWidget {
  Body({super.key});

  final controller = PageController(
    viewportFraction: 0.9,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //     gradient: LinearGradient(
      //   begin: Alignment.topCenter,
      //   end: Alignment.bottomCenter,
      //   colors: const [
      //     Color(0xFFC2FFF9),
      //     Color(0xFF71DFE7),
      //   ],
      // )),
      child: Padding(
        padding: EdgeInsets.all(getProportionateScreenWidth(15)),
        child: Container(
          padding:
              EdgeInsets.symmetric(vertical: getProportionateScreenHeight(15)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(55),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
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
                        SizedBox(
                          width: getProportionateScreenWidth(8),
                        ),
                        const Text(
                          'Lossy',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    Row(
                      children: [
                        Text(
                          'Weight',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: getProportionateScreenWidth(30)),
                        ),
                        SizedBox(
                          width: getProportionateScreenWidth(8),
                        ),
                        Text(
                          'Loss',
                          style: TextStyle(
                              color: ThemeData().primaryColorDark,
                              fontWeight: FontWeight.bold,
                              fontSize: getProportionateScreenWidth(30)),
                        ),
                      ],
                    ),
                    Text(
                      'can be easy',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: getProportionateScreenWidth(30)),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(8),
                    ),
                    Text(
                      'and not 😂',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: getProportionateScreenWidth(15)),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(35),
                    ),
                    const Text(
                      'Start to measure your weight every day and analyze your dynamic.',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(35),
              ),
              Container(
                height: 200,

                ///Try with padding over here
                child: PageView.builder(
                  controller: controller,
                  // itemCount: pages.length,
                  itemBuilder: (_, index) {
                    return CarouselCard(
                        context, Constants.carouselItems[index]);
                  },
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(24),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(30),
                  ),
                  SmoothPageIndicator(
                    controller: controller,
                    count: Constants.carouselItems.length,
                    effect: WormEffect(
                      activeDotColor: ThemeData().primaryColorDark,
                      dotHeight: 10,
                      dotWidth: 10,
                      type: WormType.thin,
                      // strokeWidth: 5,
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(30),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(AuthScreen.routeName);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(135),
                        vertical: getProportionateScreenHeight(13),
                      ),
                      shape: const StadiumBorder(),
                    ),
                    child: const Text(
                      'Start',
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Do you have an account? ',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Login'),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
