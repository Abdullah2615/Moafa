import 'package:flutter/material.dart';

class Mystyles {
  static final Color blueColor = Color(0xff3058a6);
  static final Color blackColor = Color(0xff0b0d0e);
  static final Color whiteColor = Colors.white;
  static final Color cyanColor = Color(0xffcce3ff);
  static final Color maybeCyanColor = Color(0xff5689d6);
  static final Color grey = Color(0xff687483);
  static final Color lightBlue = Colors.lightBlueAccent;

  static TextStyle headersize(Color c) =>
      TextStyle(fontSize: 32, color: c, fontWeight: FontWeight.bold);
  static TextStyle notessize(Color c) => TextStyle(color: c, fontSize: 18);
  static TextStyle Datasize(Color c) => TextStyle(fontSize: 20);

  static TextStyle semiLight10(Color c) =>
      TextStyle(fontSize: 10, color: c, fontWeight: FontWeight.w200);

  static TextStyle light16(Color c) =>
      TextStyle(fontSize: 16, color: c, fontWeight: FontWeight.w100);

  static TextStyle bold12(Color c) =>
      TextStyle(fontSize: 12, color: c, fontWeight: FontWeight.bold);

  static TextStyle bold8(Color c) =>
      TextStyle(fontSize: 8, color: c, fontWeight: FontWeight.bold);

  static TextStyle bold14(Color c) =>
      TextStyle(fontSize: 14, color: c, fontWeight: FontWeight.bold);

  static TextStyle bold16(Color c) =>
      TextStyle(fontSize: 16, color: c, fontWeight: FontWeight.bold);

  static TextStyle light18(Color c) =>
      TextStyle(fontSize: 18, color: c, fontWeight: FontWeight.w100);

  static TextStyle bold18(Color c) =>
      TextStyle(fontSize: 18, color: c, fontWeight: FontWeight.bold);

  static TextStyle socialsize(Color c) => TextStyle(
        fontSize: 16,
        color: c,
      );
  static TextStyle smallItemColor(Color c) => TextStyle(
        fontSize: 12,
        color: c,
      );
  static TextStyle buttonsize(Color c) => TextStyle(
        fontSize: 28,
        color: c,
      );
}
