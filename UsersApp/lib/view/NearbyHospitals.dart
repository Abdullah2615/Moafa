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
        backgroundColor: Mystyles.cyanColor,
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
            const SizedBox(height: 20),
            buildContainer(
              asset:
                  'assets/noor elshorouk.jpg', // Replace with your asset path
              title: 'Nour El Sherouk',
              subtitle: 'Private Hospital',
              location: 'Shrouk City',
              timeDistance: '15 min. | 1.5km',
              rating: '4.8 (1.3K+ Review)',
            ),
            const SizedBox(height: 15),
            buildContainer(
              asset: 'assets/SG hospital.jpg', // Replace with your asset path
              title: 'Suodi German',
              subtitle: 'Private Hospital',
              location: 'jossef tito street',
              timeDistance: '30 min. | 30km',
              rating: '4.8 (1.3K+ Review)',
            ),
            const SizedBox(height: 15),
            buildContainer(
              asset: ('assets/global medical center.jpg'),
              title: 'Global Medical Center',
              subtitle: 'Private Hospital',
              location: 'cairo - Ismalia Road ',
              timeDistance: '30 min. | 30km',
              rating: '4.8 (1.3K+ Review)',
            ),
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
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: isSelected ? Mystyles.blueColor : Mystyles.cyanColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          label,
          style: Mystyles.bold14(
            isSelected ? Mystyles.whiteColor : Mystyles.blueColor,
          ),
        ),
      ),
    );
  }

  Widget buildContainer({
    required String asset, // Renamed to follow Dart conventions
    required String title,
    required String subtitle,
    required String location,
    required String timeDistance,
    required String rating,
  }) {
    return InkWell(
      onTap: () {},
      child: Container(
          height: MediaQuery.of(context).size.height * 0.35,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: AssetImage(asset),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(children: [
            // Semi-transparent overlay

            // Content

            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              top: 150,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Mystyles.blueColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(
                      12.0), // Add padding to avoid clipping
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Mystyles.bold16(Mystyles.whiteColor),
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          Text(
                            subtitle,
                            style: Mystyles.bold12(Mystyles.whiteColor),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.42),
                          const Icon(Icons.star,
                              color: Colors.yellow, size: 16),
                          const SizedBox(width: 4),
                          Text(
                            rating,
                            style: Mystyles.bold12(Mystyles.whiteColor),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1,
                        color: Mystyles.whiteColor,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.location_on,
                              color: Colors.white, size: 16),
                          const SizedBox(width: 2),
                          Text(
                            location,
                            style: Mystyles.bold12(Mystyles.whiteColor),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(Icons.timer,
                              color: Colors.white, size: 16),
                          const SizedBox(width: 2),
                          Text(
                            timeDistance,
                            style: Mystyles.bold12(Mystyles.whiteColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ])),
    );
  }
}
