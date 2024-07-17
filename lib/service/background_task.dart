import 'package:workmanager/workmanager.dart';

void scheduleBackgroundTask(String title, String description, String date, String time, int times) {
  Workmanager().registerOneOffTask(
    "1",
    "simpleTask",
    inputData: {
      'title': title,
      'description': description,
      'date': date,
      'time': time,
      'times': times,
    },
    initialDelay: Duration(minutes: 0),
  );
}
