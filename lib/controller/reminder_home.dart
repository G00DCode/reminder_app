import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:reminder_app/controller/reminder_controller.dart';

import '../model/add_reminder.dart';

class ReminderHome extends StatelessWidget {
  final ReminderController reminderController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reminder App')),
      body: Center(child: Obx(() {
        if (reminderController.reminders.isEmpty) {
          return Text('No reminders yet!');
        } else {
          return ListView.builder(
            itemCount: reminderController.reminders.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(reminderController.reminders[index]['title']),
                subtitle: Text(reminderController.reminders[index]['date']),
              );
            },
          );
        }
      })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddReminder());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
