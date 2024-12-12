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
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25),
              ),
            ),
            padding: EdgeInsets.all(35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: screenWidth * 0.1,
                      child: ClipOval(
                        child: Image.asset("assets/Asset 11@10x.png"),
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Good Morning,",
                            style: Mystyles.titlesize(Mystyles.grey)),
                        Text("Mahmoud",
                            style: Mystyles.Datasize(Mystyles.blackColor)),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  "How are you feeling today?",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // Categories Section
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Categories",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15),
                SizedBox(
                  height: screenHeight * 0.15,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      InkWell(
                        onTap: () {
                          print("Hospitals tapped");
                        },
                        child: Column(
                          children: [
                            ClipOval(
                              child: Image.asset(
                                'assets/Asset 16@10x.png',
                                width: 60,
                                height: 60,
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(height: 15),
                            Text("Hospitals", style: TextStyle(fontSize: 12)),
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      AddPillScreen())); // Example navigation
                        },
                        child: Column(
                          children: [
                            ClipOval(
                              child: Image.asset(
                                'assets/Asset 17@10x.png',
                                width: 60,
                                height: 60,
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(height: 15),
                            Text("Blood Donation",
                                style: TextStyle(fontSize: 12)),
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      InkWell(
                        onTap: () {
                          print("Clinics tapped");
                        },
                        child: Column(
                          children: [
                            ClipOval(
                              child: Image.asset(
                                'assets/Asset 28@10x.png',
                                width: 60,
                                height: 60,
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(height: 15),
                            Text("Clinics", style: TextStyle(fontSize: 12)),
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      InkWell(
                        onTap: () {
                          print("Radiology Centers tapped");
                        },
                        child: Column(
                          children: [
                            ClipOval(
                              child: Image.asset(
                                'assets/Asset 27@10x.png',
                                width: 60,
                                height: 60,
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(height: 15),
                            Text("Radiology Centers",
                                style: TextStyle(fontSize: 12)),
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      InkWell(
                        onTap: () {
                          print("Laboratories tapped");
                        },
                        child: Column(
                          children: [
                            ClipOval(
                              child: Image.asset(
                                'assets/Asset 30@10x.png',
                                width: 60,
                                height: 60,
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(height: 15),
                            Text("Laboratories",
                                style: TextStyle(fontSize: 12)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              children: [
                Text(
                  "Upcoming Appointment",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "No Upcoming Appointments",
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: screenHeight * 0.1),
                Text(
                  "Recent History",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "No History Found",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),

          // Main View Section
          Expanded(
            child: views[currentIndex],
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
