import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:fitness_app/config/size_config.dart';
import 'package:fitness_app/src/view/home_screen_view_model.dart';
import 'line_graph.dart';

class Body extends StatelessWidget {
  final HomeScreenViewModel model;
  final String? lastWeight;
  final int? monthNumber;
  Body({Key? key, required this.model, this.lastWeight, this.monthNumber});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(15),
        vertical: getProportionateScreenHeight(10),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Weight',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(15),
                vertical: getProportionateScreenHeight(10),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: getProportionateScreenWidth(120),
                    //width: 2 * getProportionateScreenWidth(200),
                    child: SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: CircularPercentIndicator(
                        radius: getProportionateScreenWidth(200),
                        lineWidth: 13,
                        animation: true,
                        animationDuration: 2000,
                        percent: 1,
                        startAngle: 270,
                        circularStrokeCap: CircularStrokeCap.round,
                        progressColor: Colors.green[400],
                        center: Column(
                          children: [
                            SizedBox(
                              height: getProportionateScreenHeight(40),
                            ),
                            const Text(
                              'Today',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '${lastWeight ?? "0.0"} Kg',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                  fontSize: getProportionateScreenWidth(25)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Current Weight',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Statistics',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(15),
                ),
                LineChartSample2(
                  lastWeight: lastWeight,
                  monthNumber: monthNumber,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
