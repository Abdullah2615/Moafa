import 'package:doctor/view/DonationRequest.dart';
import 'package:doctor/view/Measurement.dart';
import 'package:doctor/view/authentication/welcome.dart';
import 'package:doctor/view/blooddonation.dart';
import 'package:doctor/view/home.dart';
import 'package:doctor/view/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MeasurementScreen(),
    );
  }
}
