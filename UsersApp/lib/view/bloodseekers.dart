import 'package:doctor/model/used_styles.dart';
import 'package:doctor/view/reusable/container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BloodSeekersScreen extends StatefulWidget {
  const BloodSeekersScreen({super.key});

  @override
  State<BloodSeekersScreen> createState() => _BloodSeekersScreenState();
}

class _BloodSeekersScreenState extends State<BloodSeekersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Mystyles.whiteColor,
      appBar: AppBar(
        backgroundColor: Mystyles.maybeCyanColor,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios_new_rounded)),
        title: Text('Blood Seekers',
            style: Mystyles.headersize(Mystyles.blackColor)),
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyContainer(
                  context: context,
                  name: "Mahmoud Mostafa",
                  location: "El",
                  bloodType: "A+",
                  onDonateTap: () {}),
              MyContainer(
                  context: context,
                  name: "Mahmoud Mostafa",
                  location: "El",
                  bloodType: "A+",
                  onDonateTap: () {}),
              MyContainer(
                  context: context,
                  name: "Mahmoud Mostafa",
                  location: "El",
                  bloodType: "A+",
                  onDonateTap: () {}),
              MyContainer(
                  context: context,
                  name: "Mahmoud Mostafa",
                  location: "El",
                  bloodType: "A+",
                  onDonateTap: () {}),
              MyContainer(
                  context: context,
                  name: "Mahmoud Mostafa",
                  location: "El",
                  bloodType: "A+",
                  onDonateTap: () {}),
              MyContainer(
                  context: context,
                  name: "Mahmoud Mostafa",
                  location: "El",
                  bloodType: "A+",
                  onDonateTap: () {}),
            ]),
      ),
    );
  }
}
