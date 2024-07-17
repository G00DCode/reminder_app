import 'package:get/get.dart';
import 'package:hive/hive.dart';

class ReminderController extends GetxController {
  var reminders = <Map<dynamic, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadReminders();
  }

  void loadReminders() {
    var box = Hive.box('reminders');
    reminders.value = box.values.cast<Map<dynamic, dynamic>>().toList();
  }

  void addReminder(Map reminder) {
    var box = Hive.box('reminders');
    box.add(reminder);
    reminders.add(reminder);
  }
}
