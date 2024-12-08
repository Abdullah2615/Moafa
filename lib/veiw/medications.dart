import 'package:flutter/material.dart';

class MedicationsPage extends StatefulWidget {
  @override
  _MedicationsPageState createState() => _MedicationsPageState();
}

class _MedicationsPageState extends State<MedicationsPage> {
  // Define the state for the checkboxes
  List<bool> _medicationStatus = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[100],
        title: Text(
          "Medications",
          style: TextStyle(fontSize: 22, color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "June, 2025",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              buildMedicationCard(
                  "8:00 AM",
                  [
                    "Panadol - 1 Tablet - Taken Before Eating",
                    "Whatever - 5 ml - Before Eating"
                  ],
                  0),
              buildMedicationCard(
                  "2:00 PM",
                  [
                    "Panadol - 1 Tablet - Before Eating",
                    "Whatever - 5 ml - Before Eating"
                  ],
                  2),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMedicationCard(
      String time, List<String> medications, int startIndex) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        color: Colors.lightBlue[50],
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                time,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Column(
                children: List.generate(
                  medications.length,
                  (index) => Row(
                    children: [
                      Checkbox(
                        value: _medicationStatus[startIndex + index],
                        onChanged: (value) {
                          setState(() {
                            _medicationStatus[startIndex + index] = value!;
                          });
                        },
                      ),
                      Expanded(
                        child: Text(
                          medications[index],
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
