import 'package:doctor/controller/controller.dart';
import 'package:doctor/model/used_styles.dart';
import 'package:doctor/view/reusable/alarmPicker.dart';
import 'package:doctor/view/reusable/dropDownPill.dart';
import 'package:doctor/view/reusable/textFieldsLoginSignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPillScreen extends StatefulWidget {
  const AddPillScreen({super.key});

  @override
  State<AddPillScreen> createState() => _AddPillScreenState();
}

class _AddPillScreenState extends State<AddPillScreen> {
  final PillController controller = Get.put(PillController());

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Mystyles.whiteColor,
      appBar: AppBar(
        backgroundColor: Mystyles.lightBlue,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: const Text(
          'Add Pill Schedule',
          style: TextStyle(fontSize: 18),
        ),
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
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              pillTextField(screenWidth, "Pill name"),
              SizedBox(height: screenHeight * 0.02),

              // Shape and Frequency Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Shape
                  dropdownPill(
                      label: "Shape",
                      selectedValue: controller.selectedShape,
                      items: controller.shapes,
                      screenWidth: screenWidth,
                      screenHeight: screenHeight),

                  SizedBox(width: screenWidth * 0.02),

                  // Frequency
                  dropdownPill(
                      label: "Frequency",
                      selectedValue: controller.selectedFrequency,
                      items: controller.frequencies,
                      screenWidth: screenWidth,
                      screenHeight: screenHeight),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),

              // Duration and Dosage
              Row(
                children: [
                  dropdownPill(
                      label: "Duration",
                      selectedValue: controller.selectedDuration,
                      items: controller.durations,
                      screenWidth: screenWidth,
                      screenHeight: screenHeight),
                  SizedBox(width: screenWidth * 0.02),

                  // Dosage Per Time Counter
                  dosageAdjuster(
                    label: "Dosage Per Time",
                    dosageValue: controller.dosagePerTime,
                    onIncrement: controller.incrementDosage,
                    onDecrement: controller.decrementDosage,
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),

              Row(
                children: [
                  dosageAdjuster(
                    label: "Dosage Per day",
                    dosageValue: controller.dosagePerTime2,
                    onIncrement: controller.incrementDosage2,
                    onDecrement: controller.decrementDosage2,
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  pickAlarm(
                    "Next Alarm",
                    controller.alarmTime,
                    controller.isAlarmEnabled,
                    () {
                      // Open a time picker when tapped
                      showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      ).then((selectedTime) {
                        if (selectedTime != null) {
                          // Update time in the controller
                          controller.updateTime(selectedTime.format(context));
                        }
                      });
                    },
                    screenWidth,
                    screenHeight,
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                "Notes",
                style: TextStyle(
                  fontSize: screenWidth * 0.035,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              pillTextField(screenWidth, "Any notes")
            ],
          ),
        ),
      ),
    );
  }
}
