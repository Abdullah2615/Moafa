import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:doctor/model/used_styles.dart';

class NearbyScreens extends StatefulWidget {
  const NearbyScreens({super.key});

  @override
  State<NearbyScreens> createState() => _NearbyScreensState();
}

class _NearbyScreensState extends State<NearbyScreens> {
  String selectedSegment = "Hospitals";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Mystyles.maybeCyanColor,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: Text(
          'Nearby',
          style: Mystyles.headersize(Mystyles.blackColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildSegmentButton("All", selectedSegment),
                  _buildSegmentButton("Hospitals", selectedSegment),
                  _buildSegmentButton("Clinics", selectedSegment),
                  _buildSegmentButton("Labs", selectedSegment),
                  _buildSegmentButton("Radiology", selectedSegment),
                ],
              ),
            ),
            // Placeholder for the rest of the content
            SizedBox(height: 20),
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 0.9,
              color: Mystyles.grey,
              child: Center(
                child: Text(
                  'List of Nearby Locations',
                  style: Mystyles.bold18(Mystyles.blackColor),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSegmentButton(String label, String currentSelection) {
    bool isSelected = label == currentSelection;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSegment = label;
          Mystyles.blueColor;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          label,
          style: Mystyles.bold14(
            isSelected ? Mystyles.whiteColor : Mystyles.blackColor,
          ),
        ),
      ),
    );
  }
}
