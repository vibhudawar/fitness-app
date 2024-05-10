import 'package:flutter/material.dart';
import 'package:fitness_app/config/size_config.dart';

Widget Header() {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      children: [
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Text(
        //       '80 Kg',
        //       style: TextStyle(
        //           color: Colors.black,
        //           fontWeight: FontWeight.bold,
        //           fontSize: getProportionateScreenWidth(30)),
        //     ),
        //     ElevatedButton(
        //       onPressed: () {},
        //       style: ElevatedButton.styleFrom(
        //         shape: const CircleBorder(),
        //         backgroundColor: const Color(0xfff2f2f2),
        //         elevation: 0,
        //       ),
        //       child: const Icon(
        //         Icons.arrow_drop_up_outlined,
        //         size: 60,
        //         color: Colors.green,
        //       ),
        //     )
        //   ],
        // ),
        // SizedBox(
        //   height: getProportionateScreenHeight(8),
        // ),
        // Row(
        //   children: [
        //     Text(
        //       '-0.73kg 16%',
        //       style: TextStyle(
        //           color: Colors.green,
        //           fontWeight: FontWeight.bold,
        //           fontSize: getProportionateScreenWidth(15)),
        //     ),
        //     SizedBox(
        //       width: getProportionateScreenWidth(14),
        //     ),
        //     Text(
        //       'Today',
        //       style: TextStyle(
        //           color: Colors.black,
        //           fontWeight: FontWeight.bold,
        //           fontSize: getProportionateScreenWidth(15)),
        //     ),
        //   ],
        // ),
        // const Divider(
        //   thickness: 2,
        // ),
        // SizedBox(
        //   height: getProportionateScreenHeight(8),
        // ),
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
