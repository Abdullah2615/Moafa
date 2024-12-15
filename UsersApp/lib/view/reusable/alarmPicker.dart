import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Reusable Widget for Alarm
Widget pickAlarm(
  String label,
  RxString time,
  RxBool isEnabled,
  void Function() onTimeTap,
  double screenWidth,
  double screenHeight,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(
          fontSize: screenWidth * 0.035,
          color: Colors.grey,
        ),
      ),
      SizedBox(height: 8),
      Container(
        width: screenWidth * 0.45,
        height: screenHeight * 0.078,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          // color: Colors.grey[100],
          border: Border.all(
            color: const Color.fromARGB(255, 130, 130, 130),
          ),
          borderRadius: BorderRadius.circular(screenWidth * 0.02),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: onTimeTap,
              child: Obx(
                () => Text(
                  time.value,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Obx(
              () => Switch(
                value: isEnabled.value,
                activeColor: Colors.blue,
                onChanged: (value) {
                  isEnabled.value = value;
                },
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
