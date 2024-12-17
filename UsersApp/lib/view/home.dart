import 'package:doctor/model/used_styles.dart';
import 'package:doctor/view/add_pill.dart';
import 'package:doctor/view/profile.dart';
import 'package:doctor/view/reports.dart';
import 'package:doctor/view/vitals.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> views = [
    VitalScreen(),
    AddPillScreen(),
    ReportsScreen(),
    ProfileScreen(),
  ];
  // data for the categories
  List<Map<String?, String?>> theCategoriesData = [
    {'name': 'Hospitals', 'image': 'assets/Asset 16@10x.png'},
    {'name': 'Blood Donation', 'image': 'assets/Asset 17@10x.png'},
    {'name': 'Clinics', 'image': 'assets/Asset 28@10x.png'},
    {'name': 'Radiology Centers', 'image': 'assets/Asset 27@10x.png'},
    {'name': 'Laboratories', 'image': 'assets/Asset 30@10x.png'},
  ];

  Widget categoryItemBuilder(String name, String image) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0),
          child: CircleAvatar(
            minRadius: 30,
            backgroundColor: Mystyles.cyanColor,
            child: Image.asset(
              image,
              scale: 2.5,
            ),
          ),
        ),
        Text(
          name,
          style: Mystyles.smallItemColor(Mystyles.blackColor),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          // Header Section
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Mystyles.cyanColor,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(25),
              ),
            ),
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    // profile pic
                    CircleAvatar(
                      radius: screenWidth * 0.05,
                      child: ClipOval(
                        child: Image.asset("assets/Asset 11@10x.png"),
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    // Greeting + name
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Good Morning,",
                            style: Mystyles.light16(Mystyles.grey)),
                        Text("Mahmoud",
                            style: Mystyles.bold16(Mystyles.blackColor)),
                      ],
                    ),
                    const Spacer(),
                    // the location
                    Text(
                      'Cairo, Egypt',
                      style: Mystyles.bold14(Mystyles.maybeCyanColor),
                    ),
                    SizedBox(width: screenWidth * 0.01),

                    Icon(
                      Icons.location_pin,
                      color: Mystyles.maybeCyanColor,
                      size: 18,
                    )
                  ],
                ),
              ],
            ),
          ),

          // The Upcoming appointment part

          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                // the title
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Upcoming Appointment',
                      style: Mystyles.bold18(Mystyles.blackColor),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'See All',
                          style: Mystyles.bold12(Mystyles.maybeCyanColor),
                        ))
                  ],
                ),
                SizedBox(
                  height: screenWidth * 0.03,
                ),
                // the card
                Container(
                  height: screenHeight * 0.20,
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                      color: Mystyles.cyanColor,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Column(
                    children: [
                      // top part
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Mystyles.maybeCyanColor,
                            radius: screenWidth * 0.04,
                          ),
                          SizedBox(
                            width: screenWidth * 0.02,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Alfa Labs',
                                style: Mystyles.bold14(Mystyles.blackColor),
                              ),
                              Text(
                                'Blood Test',
                                style:
                                    Mystyles.semiLight10(Mystyles.blackColor),
                              )
                            ],
                          ),
                          const Spacer(),
                          CircleAvatar(
                            backgroundColor: Mystyles.maybeCyanColor,
                            radius: screenWidth * 0.03,
                            child: Icon(
                              Icons.call,
                              color: Mystyles.whiteColor,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screenHeight * 0.04,
                      ),
                      Container(
                        height: screenHeight * 0.06,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Mystyles.maybeCyanColor),
                        child: Row(
                          children: [
                            const Spacer(),
                            Icon(
                              Icons.calendar_month,
                              color: Mystyles.whiteColor,
                            ),
                            SizedBox(
                              width: screenWidth * 0.01,
                            ),
                            Text(
                              'Monday, 31 November',
                              style: Mystyles.bold12(Mystyles.whiteColor),
                            ),
                            const Spacer(),
                            Container(
                              width: 3,
                              color: Mystyles.whiteColor,
                              margin: EdgeInsets.symmetric(vertical: 8),
                            ),
                            const Spacer(),
                            Icon(
                              Icons.access_time_filled,
                              color: Mystyles.whiteColor,
                            ),
                            SizedBox(
                              width: screenWidth * 0.01,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '09:00',
                                  style: Mystyles.bold16(Mystyles.whiteColor),
                                ),
                                Text(
                                  ' PM',
                                  style: Mystyles.bold8(Mystyles.whiteColor),
                                )
                              ],
                            ),
                            const Spacer(),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),

          // Categories Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Categories", style: Mystyles.bold18(Mystyles.blackColor)),
                SizedBox(height: 15),
                SizedBox(
                  height: screenHeight * 0.15,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                          theCategoriesData.length,
                          (index) => categoryItemBuilder(
                              theCategoriesData[index]['name']!,
                              theCategoriesData[index]['image']!))),
                ),
              ],
            ),
          ),
        ],
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomAppBar(
        color: Mystyles.whiteColor,
        shape: CircularNotchedRectangle(),
        notchMargin: 4.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                setState(() {
                  currentIndex = 0;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.paste_rounded),
              onPressed: () {
                setState(() {
                  currentIndex = 1;
                });
              },
            ),
            SizedBox(width: 40), // Spacer for the notch
            IconButton(
              icon: Icon(Icons.monitor_heart_outlined),
              onPressed: () {
                setState(() {
                  currentIndex = 2;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                setState(() {
                  currentIndex = 3;
                });
              },
            ),
          ],
        ),
      ),

      // Floating Action Button
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddPillScreen()));
        },
        backgroundColor: Mystyles.maybeCyanColor,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
