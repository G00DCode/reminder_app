class Reminder {
  String name;
  String date;
  String time;
  String dosage;
  int notificationTime;
  int timesPerDay;
  String additionalMembers;

  Reminder({
    required this.name,
    required this.date,
    required this.time,
    required this.dosage,
    required this.notificationTime,
    required this.timesPerDay,
    required this.additionalMembers,
  });
}
