import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pill extends StatefulWidget {
  const Pill({super.key});

  @override
  State<Pill> createState() => _PillState();
}

class _PillState extends State<Pill> {
  String selectedShape = "Tablets";
  String selectedFrequency = "Every Day";
  String selectedDuration = "1 Week";
  int dosagePerTime = 1;

  List<String> shapes = ["Tablets", "Capsules", "Syrup", "Injection"];
  List<String> frequencies = [
    "Every Day",
    "Every 6 Hours",
    "Every 12 Hours",
    "Every 8 Hours",
    "Every Week",
    "Every Month"
  ];
  List<String> durations = [
    "1 Week",
    "2 Weeks",
    "1 Month",
    "6 Months",
    "1 Year"
  ];

  void incrementDosage() {
    setState(() {
      dosagePerTime++;
    });
  }

  void decrementDosage() {
    setState(() {
      if (dosagePerTime > 1) dosagePerTime--;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: Text(
          'Add Pill Schedule',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: Column(
        children: [
          // Pill Name
          Text(
            "Pill Name",
            style: TextStyle(fontSize: screenWidth * 0.035, color: Colors.grey),
          ),
          SizedBox(height: screenHeight * 0.01),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Pill name",
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(screenWidth * 0.02),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.02),

          // Shape and Frequency Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Shape
              Flexible(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Shape",
                      style: TextStyle(
                          fontSize: screenWidth * 0.035, color: Colors.grey),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    DropdownButtonFormField<String>(
                      value: selectedShape,
                      items: shapes
                          .map((shape) => DropdownMenuItem<String>(
                                value: shape,
                                child: Text(shape),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedShape = value!;
                        });
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(screenWidth * 0.02),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: screenWidth * 0.02),

              // Frequency
              Flexible(
                flex: 1,
                child: Column(
                  children: [
                    Text(
                      "Frequency",
                      style: TextStyle(
                          fontSize: screenWidth * 0.035, color: Colors.grey),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    DropdownButtonFormField<String>(
                      value: selectedFrequency,
                      items: frequencies
                          .map((freq) => DropdownMenuItem<String>(
                                value: freq,
                                child: Text(freq),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedFrequency = value!;
                        });
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.grey[200],
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(screenWidth * 0.02),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.02),

          // Duration
          Text(
            "Duration",
            style: TextStyle(fontSize: screenWidth * 0.035, color: Colors.grey),
          ),
          SizedBox(height: screenHeight * 0.01),
          Row(
            children: [
              DropdownButtonFormField<String>(
                value: selectedDuration,
                items: durations
                    .map((duration) => DropdownMenuItem<String>(
                          value: duration,
                          child: Text(duration),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedDuration = value!;
                  });
                },
                decoration: InputDecoration(
                  fillColor: Colors.grey[200],
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.02),
                  ),
                ),
              ),
              SizedBox(width: screenWidth * 0.02),

              // Dosage Per Time Counter
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dosage Per Time",
                    style: TextStyle(
                        fontSize: screenWidth * 0.035, color: Colors.grey),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: decrementDosage,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlue[100],
                          shape: CircleBorder(),
                        ),
                        child: Icon(Icons.remove, color: Colors.black),
                      ),
                      SizedBox(width: 20),
                      Text(
                        '$dosagePerTime',
                        style: TextStyle(
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: incrementDosage,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlue[100],
                          shape: CircleBorder(),
                        ),
                        child: Icon(Icons.add, color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
