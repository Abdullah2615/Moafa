import 'package:doctor/model/used_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget dropdownPill({
  required String label,
  required RxString selectedValue,
  required List<String> items,
  required double screenWidth,
  required double screenHeight,
}) {
  return Flexible(
    flex: 1,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: screenWidth * 0.035,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: screenHeight * 0.01),
        Obx(() => DropdownButtonFormField<String>(
              value: selectedValue.value.isEmpty ? null : selectedValue.value,
              items: items
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      ))
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  selectedValue.value = value;
                }
              },
              decoration: InputDecoration(
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(screenWidth * 0.02),
                ),
              ),
            )),
      ],
    ),
  );
}

Widget dosageAdjuster({
  required String label,
  required RxInt dosageValue,
  required VoidCallback onIncrement,
  required VoidCallback onDecrement,
  required double screenWidth,
  required double screenHeight,
}) {
  return Flexible(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: screenWidth * 0.035,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: screenHeight * 0.01),
        Container(
          width: screenWidth * 0.6,
          height: screenHeight * 0.078,
          decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(255, 130, 130, 130),
              ),
              //color: const Color.fromARGB(255, 241, 240, 240),
              borderRadius: BorderRadius.circular(screenWidth * 0.02)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: onDecrement,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue[100],
                  shape: CircleBorder(),
                ),
                child: Icon(Icons.remove, color: Mystyles.blackColor),
              ),
              Obx(() => Text(
                    '${dosageValue.value}',
                    style: TextStyle(
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              ElevatedButton(
                onPressed: onIncrement,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue[100],
                  shape: CircleBorder(),
                ),
                child: Icon(Icons.add, color: Mystyles.blackColor),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
