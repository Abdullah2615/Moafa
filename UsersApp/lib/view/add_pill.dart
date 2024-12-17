import 'package:doctor/model/used_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPillScreen extends StatefulWidget {
  AddPillScreen({super.key});

  @override
  State<AddPillScreen> createState() => _PillState();
}

class _PillState extends State<AddPillScreen> {
  String selectedShape = "Tablets";
  String selectedFrequency = "Every Day";
  String selectedDuration = "1 Week";
  int dosagePerTime = 1;
  int timesPerDay = 1;
  TimeOfDay selectedTime = TimeOfDay(hour: 13, minute: 00);
  bool alarmEnabled = true;

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

  void incrementCounter(String type) {
    setState(() {
      if (type == "dosage") dosagePerTime++;
      if (type == "times") timesPerDay++;
    });
  }

  void decrementCounter(String type) {
    setState(() {
      if (type == "dosage" && dosagePerTime > 1) dosagePerTime--;
      if (type == "times" && timesPerDay > 1) timesPerDay--;
    });
  }

  Future<void> pickTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (pickedTime != null) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Mystyles.whiteColor,
      appBar: AppBar(
        backgroundColor: Mystyles.maybeCyanColor,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: Text(
          'Add Pill Schedule',
          style: Mystyles.bold18(Mystyles.blackColor),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Pill Name
              Text(
                "Pill Name",
                style: Mystyles.notessize(Mystyles.grey),
              ),
              SizedBox(height: screenHeight * 0.01),
              TextFormField(
                initialValue: "Panadol",
                decoration: InputDecoration(
                  fillColor: Mystyles.whiteColor,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),

              // Shape and Frequency
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildDropdown("Shape", selectedShape, shapes, (value) {
                    setState(() => selectedShape = value!);
                  }),
                  SizedBox(
                    width: screenWidth * 0.02,
                  ),
                  buildDropdown("Frequency", selectedFrequency, frequencies,
                      (value) {
                    setState(() => selectedFrequency = value!);
                  }),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),

              // Duration and Dosage
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildDropdown("Duration", selectedDuration, durations,
                      (value) {
                    setState(() => selectedDuration = value!);
                  }),
                  SizedBox(
                    width: screenWidth * 0.03,
                  ),
                  buildCounter("Dosage Per Time", dosagePerTime, "dosage"),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),

              // Times Per Day and Next Alarm
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildCounter("Times Per Day", timesPerDay, "times"),
                  SizedBox(
                    width: screenWidth * 0.03,
                  ),
                  buildTimePicker(),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),

              // Notes
              Text(
                "Notes",
              ),
              SizedBox(height: screenHeight * 0.01),
              TextFormField(
                maxLines: 3,
                decoration: InputDecoration(
                  fillColor: Mystyles.whiteColor,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDropdown(String label, String value, List<String> items,
      ValueChanged<String?> onChanged) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
          ),
          SizedBox(height: 8),
          DropdownButtonFormField<String>(
            value: value,
            items: items
                .map((item) => DropdownMenuItem(value: item, child: Text(item)))
                .toList(),
            onChanged: onChanged,
            decoration: InputDecoration(
              fillColor: Mystyles.whiteColor,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCounter(String label, int count, String type) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildCounterButton(Icons.remove, () => decrementCounter(type)),
              Text(
                '$count',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              buildCounterButton(Icons.add, () => incrementCounter(type)),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildCounterButton(IconData icon, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(8),
          shape: CircleBorder(),
          backgroundColor: Mystyles.maybeCyanColor),
      child: Icon(icon, color: Colors.black),
    );
  }

  Widget buildTimePicker() {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Next Alarm",
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: pickTime,
                child: Text(
                  selectedTime.format(context),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Switch(
                value: alarmEnabled,
                onChanged: (value) {
                  setState(() {
                    alarmEnabled = value;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
