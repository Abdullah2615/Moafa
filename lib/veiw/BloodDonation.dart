import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Donation extends StatefulWidget {
  const Donation({super.key});

  @override
  State<Donation> createState() => _DonationState();
}

class _DonationState extends State<Donation> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: const Text("Blood Donation"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Banner
              Container(
                height: screenHeight * 0.2,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blueAccent,
                ),
                child: Padding(
                  padding: EdgeInsets.all(screenWidth * 0.04),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Donate Blood",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth * 0.07,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Save Lives",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: screenWidth * 0.05,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.03),
                      Container(
                        height: screenHeight * 0.18,
                        width: screenWidth * 0.35,
                        child: Image.asset(
                          'assets/Asset 37@10x.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),

              // Card Widget
              Column(
                children: [
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Container(
                          width: 50, // Small square
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Image.asset(
                              "assets/Asset 38@10x.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        "Donate",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      onTap: () {},
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Container(
                          width: 50, // Small square
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Image.asset(
                              "assets/Asset 38@10x.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        "Donate",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
