import 'package:doctor/model/used_styles.dart';
import 'package:flutter/material.dart';

Widget myFormField(
  String label,
  /*TextEditingController theController,*/ bool isPassword,
) {
  bool _isPasswordVisible = false;

  return isPassword
      ? Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: TextFormField(
            obscureText: !_isPasswordVisible,
            decoration: InputDecoration(
              labelText: '   $label',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Mystyles.blueColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Mystyles.blueColor),
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  // ignore: dead_code
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
                onPressed: () {
                  // setState(() {
                  //   _isPasswordVisible = !_isPasswordVisible;
                  // });
                },
              ),
            ),
          ),
        )
      : Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: TextFormField(
            decoration: InputDecoration(
              labelText: '   $label',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Mystyles.blueColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Mystyles.blueColor),
              ),
            ),
          ),
        );
}

Widget pillTextField(double screenWidth, String label) {
  return TextFormField(
    decoration: InputDecoration(
      hintText: label,
      fillColor: Colors.grey[200],
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(screenWidth * 0.02),
      ),
    ),
  );
}
