import 'package:doctor/model/used_styles.dart';
import 'package:flutter/material.dart';

class DonationrequestScreen extends StatefulWidget {
  const DonationrequestScreen({super.key});

  @override
  State<DonationrequestScreen> createState() => _DonationrequestScreenState();
}

class _DonationrequestScreenState extends State<DonationrequestScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(children: [
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05), // 5% of screen width
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight * 0.1), // 10% of screen height
                Text(
                  "Donation Request",
                  style: Mystyles.headersize(Mystyles.maybeCyanColor),
                ),
                SizedBox(height: screenHeight * 0.05), // 5% of screen height
                textformfield(
                  labeltext: "City",
                  icon: Icons.location_on,
                ),
                SizedBox(height: screenHeight * 0.02), // 2% of screen height
                textformfield(
                  labeltext: "Hospital",
                  icon: Icons.local_hospital_rounded,
                ),
                SizedBox(height: screenHeight * 0.02),
                textformfield(
                  labeltext: "Blood Type",
                  icon: Icons.water_drop_sharp,
                ),
                SizedBox(height: screenHeight * 0.02),
                textformfield(
                  labeltext: "Notes",
                  icon: Icons.sticky_note_2_rounded,
                  maxLines: 3,
                ),
              ],
            ),
          ),
        ),
        Container(
          height: screenHeight * 0.1,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Mystyles.maybeCyanColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: Center(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.2,
                ),
                backgroundColor: Mystyles.whiteColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: Text(
                "Submit",
                style: Mystyles.headersize(Mystyles.maybeCyanColor),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Widget textformfield({
    required String labeltext,
    required IconData icon,
    int? maxLines,
  }) {
    return TextFormField(
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: labeltext,
        prefixIcon: Icon(
          icon,
          color: Mystyles.blueColor,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Mystyles.blueColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Mystyles.blueColor),
        ),
      ),
    );
  }
}
