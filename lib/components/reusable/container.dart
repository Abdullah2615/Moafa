import 'package:flutter/material.dart';
import 'package:doctor/utils/styles/used_styles.dart';

Widget MyContainer({
  required BuildContext context,
  required String name,
  required String location,
  required String bloodType,
  required VoidCallback onDonateTap,
}) {
  return Padding(
    padding: const EdgeInsets.all(18),
    child: Container(
      height: MediaQuery.of(context).size.height * 0.18,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: MyStyles.Lightgrey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left Column
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Icon(Icons.person, color: MyStyles.blueColor, size: 30),
                    const SizedBox(width: 5),
                    Text(name, style: MyStyles.bold18(MyStyles.blackColor)),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Icon(Icons.location_on,
                        color: MyStyles.blueColor, size: 30),
                    const SizedBox(width: 5),
                    Text(location, style: MyStyles.bold18(MyStyles.blackColor)),
                  ],
                ),
              ],
            ),

            // Right Column
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Icon(Icons.water_drop, size: 70, color: MyStyles.blueColor),
                    Text(bloodType,
                        style: MyStyles.bold18(MyStyles.whiteColor)),
                  ],
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: onDonateTap,
                  child: Text(
                    "Donate",
                    style: MyStyles.Datasize(MyStyles.blackColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
