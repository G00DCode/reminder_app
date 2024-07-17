import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:intl/intl.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

void scheduleNotification(String title, String description, String date, String time, int times) async {
  var androidDetails = AndroidNotificationDetails(
      'channelId', 'channelName', channelDescription: 'channelDescription');
  var generalNotificationDetails =
  NotificationDetails(android: androidDetails);

  DateTime scheduledDate = DateFormat('yyyy-MM-dd HH:mm').parse('$date $time');
  tz.TZDateTime tzScheduledDate = tz.TZDateTime.from(scheduledDate, tz.local);

  for (int i = 0; i < times; i++) {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        i,
        title,
        description,
        tzScheduledDate.add(Duration(hours: i * (24 ~/ times))),
        generalNotificationDetails,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime);
  }
}
