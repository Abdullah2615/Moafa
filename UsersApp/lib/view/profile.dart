import 'package:doctor/view/vitals.dart';
import 'package:flutter/material.dart';
import 'package:doctor/model/used_styles.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Variable to track the switch state
  bool _isAvailableForDonate = true;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section
            _buildHeader(screenHeight, screenWidth),

            SizedBox(height: 20),

            // Vitals and Allergies Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: _infoCard(
                            "Vitals",
                            ["Weight", "Pulse"],
                            ["70 KG", "70 BPM"],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: _infoCard(
                            "Allergies",
                            ["Peanut Allergy", "Perfume Allergy"],
                            ["", ""],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Menu Items
            _menuItem("Appointments"),
            _menuItem("Medications"),
            _menuItem("Medical History"),
            _menuItem("Family"),

            SizedBox(height: 10),

            // Toggle Switch
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListTile(
                title: Text(
                  "Available for Donate",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: Switch(
                  value: _isAvailableForDonate,
                  onChanged: (val) {
                    setState(() {
                      _isAvailableForDonate = val; // Update the switch state
                    });
                  },
                  activeColor: Mystyles.blueColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Header Section
  Widget _buildHeader(double screenHeight, double screenWidth) {
    return Container(
      height: screenHeight * 0.25,
      decoration: BoxDecoration(
        color: Mystyles.maybeCyanColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: screenHeight * 0.05,
            backgroundImage: AssetImage('assets/Doctor.png'),
          ),
          SizedBox(width: screenWidth * 0.05),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Mahmoud Mostafa",
                style: Mystyles.Datasize(Mystyles.blackColor),
              ),
              SizedBox(height: 5),
              Text("23 Years Old",
                  style: Mystyles.notessize(Mystyles.blackColor)),
              SizedBox(height: 5),
              Text("Male", style: Mystyles.notessize(Mystyles.blackColor)),
              Text("Diabetes Patient",
                  style: Mystyles.notessize(Mystyles.blueColor)),
            ],
          ),
          Spacer(),
          Stack(
            alignment: Alignment.center,
            children: [
              Icon(Icons.water_drop, size: 70, color: Mystyles.blueColor),
              Text("A+", style: Mystyles.bold18(Mystyles.whiteColor)),
            ],
          ),
        ],
      ),
    );
  }

  // Reusable Card Widget
  Widget _infoCard(String title, List<String> labels, List<String> values) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(title, style: Mystyles.Datasize(Mystyles.blackColor)),
                Spacer(),
                IconButton(
                  onPressed: () {
                    Get.to(() => VitalScreen());
                  },
                  icon: Icon(Icons.arrow_forward_ios_rounded),
                ),
              ],
            ),
            SizedBox(height: 10),
            ...List.generate(
              labels.length,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(labels[index]),
                    Text(
                      values[index],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // Menu Item Widget
  Widget _menuItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Card(
        elevation: 1,
        child: ListTile(
          title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {},
        ),
      ),
    );
  }
}
