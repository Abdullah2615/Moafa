import 'package:doctor/main.dart';
import 'package:doctor/model/used_styles.dart';
import 'package:flutter/material.dart';

class MeasurementScreen extends StatefulWidget {
  const MeasurementScreen({super.key});

  @override
  State<MeasurementScreen> createState() => _MeasurementScreenState();
}

class _MeasurementScreenState extends State<MeasurementScreen> {
  String? selectedMeasurement;
  String? selectedUnit;

  final List<String> measurements = [
    "Heart rate",
    "Height",
    "Weight",
    "Sugar rate"
  ];
  final List<String> units = [
    "BPM",
    "C.M",
    "K.G",
    "MG/DL",
  ];

  @override
  void initState() {
    super.initState();
    selectedMeasurement = measurements[0];
    selectedUnit = units[0];
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Mystyles.whiteColor,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: screenHeight * 0.1),
                  Text(
                    "Add Measurement",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Mystyles.blueColor,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  buildDropdown(
                    icon: Icons.show_chart_rounded,
                    hinttext: "Measurement",
                    value: selectedMeasurement,
                    items: measurements,
                    onChanged: (value) {
                      setState(() => selectedMeasurement = value);
                    },
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Row(
                    children: [
                      Expanded(
                        child: buildRecordField(hintText: "Record"),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: buildDropdown(
                          icon: Icons.straighten,
                          hinttext: "Unit",
                          value: selectedUnit,
                          items: units,
                          onChanged: (value) {
                            setState(() => selectedUnit = value);
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  buildNotesField(),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
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
          ),
        ],
      ),
    );
  }

  Widget buildDropdown({
    required IconData icon,
    required String hinttext,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Icon(icon, color: Mystyles.blueColor),
      const SizedBox(height: 8),
      DropdownButtonFormField<String>(
        decoration: InputDecoration(
          hintText: hinttext,
          fillColor: Mystyles.Lightgrey,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    ]);
  }

  Widget buildRecordField({required String hintText}) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: Mystyles.Lightgrey,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Mystyles.blueColor),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          style: Mystyles.bold16(Mystyles.blackColor)),
    ]);
  }

  Widget buildNotesField() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        children: [
          Icon(Icons.note, color: Mystyles.blueColor),
          const SizedBox(width: 8),
          Text(
            "Notes",
            style: Mystyles.bold16(Mystyles.grey),
          ),
        ],
      ),
      const SizedBox(height: 8),
      TextField(
        maxLines: 4,
        decoration: InputDecoration(
          fillColor: Mystyles.Lightgrey,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: "Add notes here...",
        ),
      ),
    ]);
  }
}
