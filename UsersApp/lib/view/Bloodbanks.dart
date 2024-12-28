import 'package:doctor/model/used_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BloodBanksScreen extends StatefulWidget {
  const BloodBanksScreen({super.key});

  @override
  State<BloodBanksScreen> createState() => _BloodBanksScreenState();
}

class _BloodBanksScreenState extends State<BloodBanksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Mystyles.cyanColor,
        title: const Text('Blood Banks'),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Example of using containerbuild
              containerbuild(
                context: context,
                name: "City Blood Bank",
                asset: "assets/SG hospital.jpg",
                icon: Icons.location_on,
                location: "Downtown, Main Street",
                onDonateTap: () {
                  // Action for donate button
                  Get.snackbar("Donate", "Thank you for your interest!");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget containerbuild({
    required BuildContext context,
    required String name,
    required String asset,
    required IconData icon,
    required String location,
    required VoidCallback onDonateTap,
  }) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width * 0.9,
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Mystyles.cyanColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  asset,
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width * 0.3,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 10), // Add spacing between image and text
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: Mystyles.headersize(Mystyles.blackColor),
                      ),
                      const SizedBox(height: 5), // Add spacing between lines
                      Row(
                        children: [
                          Icon(icon, color: Mystyles.blueColor),
                          const SizedBox(width: 5),
                          Text(
                            location,
                            style: Mystyles.notessize(Mystyles.blueColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height:
                    MediaQuery.of(context).size.height * 0.04, // Adjust height
                width: MediaQuery.of(context).size.width * 0.25, // Adjust width
                decoration: BoxDecoration(
                  color: Mystyles.blueColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(5),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
