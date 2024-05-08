import 'package:flutter/material.dart';

Widget inputField(BuildContext context, TextEditingController controller) {
  return TextFormField(
    controller: controller,
    validator: (value) {
      if (value == null) {
        return 'Please enter a valid value';
      }
      return null;
    },
    keyboardType: TextInputType.number,
    textAlign: TextAlign.center,
    maxLines: 1,
    decoration: const InputDecoration(
      hintText: 'Enter weight',
    ),
    onSaved: (value) {
      print(value);
    },
  );
}
