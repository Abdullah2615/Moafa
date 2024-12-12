import 'package:doctor/veiw/BloodDonation.dart';
import 'package:doctor/veiw/addpills.dart';
import 'package:doctor/veiw/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    List views = [
      HomeView(screenHeight: screenHeight, screenWidth: screenWidth),
      Profile(),
    ];

    return Scaffold(
      body: views[currentIndex],
      // Bottom Navigation Bar
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
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
                }),
            IconButton(
                icon: Icon(Icons.paste_rounded),
                onPressed: () {
                  setState(() {
                    currentIndex = 1;
                  });
                }),
            SizedBox(width: 40),
            IconButton(
                icon: Icon(Icons.monitor_heart_outlined),
                onPressed: () {
                  setState(() {
                    currentIndex = 2;
                  });
                }),
            IconButton(
                icon: Icon(Icons.person),
                onPressed: () {
                  setState(() {
                    currentIndex = 3;
                  });
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        onPressed: () {
          Get.to(Pill());
        },
        backgroundColor: Color.fromARGB(255, 179, 229, 252),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Header Section
          Container(
            height: screenHeight * 0.25,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
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
                      //backgroundImage: AssetImage('assets/Asset 11@10x.png'),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Good Morning,",
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                        Text(
                          "Mahmoud",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
          Padding(
            padding: EdgeInsets.all(15.0),
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
                          Get.to(Donation());
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
          // Recent History Section
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
        ],
      ),
    );
  }
}
