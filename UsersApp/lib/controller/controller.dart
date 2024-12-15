import 'package:get/get.dart';

class PillController extends GetxController {
  // Observable for the selected shape
  //var selectedShape = ''.obs;

  // List of shapes
  var selectedShape = "Tablets".obs;
  var selectedFrequency = "Every Day".obs;
  var selectedDuration = "1 Week".obs;
  var dosagePerTime = 1.obs;
  var dosagePerTime2 = 2.obs;

  void incrementDosage() {
    dosagePerTime.value++;
  }

  void decrementDosage() {
    if (dosagePerTime.value > 0) {
      dosagePerTime.value--;
    }
  }

  void incrementDosage2() {
    dosagePerTime2.value++;
  }

  void decrementDosage2() {
    if (dosagePerTime2.value > 0) {
      dosagePerTime2.value--;
    }
  }

  var alarmTime = "01:00 PM".obs; // Default time
  var isAlarmEnabled = false.obs;

  // Function to update the time
  void updateTime(String newTime) {
    alarmTime.value = newTime;
  }

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
}
