import 'package:workmanager/workmanager.dart';

import 'notfication_service.dart';

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) {
    // Schedule notification here
    scheduleNotification(
      inputData!['title'],
      inputData['description'],
      inputData['date'],
      inputData['time'],
      inputData['times'],
    );
    return Future.value(true);
  });
}
