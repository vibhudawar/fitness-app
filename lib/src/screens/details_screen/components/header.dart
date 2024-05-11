import 'package:flutter/material.dart';
import 'package:fitness_app/config/size_config.dart';

Widget Header() {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      children: [
        Text(
          'Recent History',
          style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: getProportionateScreenWidth(15)),
        ),
      ],
    ),
  );
}
