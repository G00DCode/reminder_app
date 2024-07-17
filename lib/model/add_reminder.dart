import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/reminder_controller.dart';
import '../service/background_task.dart';

class AddReminder extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();
  final _timesController = TextEditingController();
  final ReminderController reminderController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Reminder')),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextFormField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            TextFormField(
              controller: _dateController,
              decoration: InputDecoration(labelText: 'Date'),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
                if (pickedDate != null) {
                  _dateController.text = pickedDate.toString().split(' ')[0];
                }
              },
            ),
            TextFormField(
              controller: _timeController,
              decoration: InputDecoration(labelText: 'Time'),
              onTap: () async {
                TimeOfDay? pickedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (pickedTime != null) {
                  _timeController.text = pickedTime.format(context);
                }
              },
            ),
            TextFormField(
              controller: _timesController,
              decoration: InputDecoration(labelText: 'Number of Times in a Day'),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  var reminder = {
                    'title': _titleController.text,
                    'description': _descriptionController.text,
                    'date': _dateController.text,
                    'time': _timeController.text,
                    'times': int.parse(_timesController.text),
                  };
                  reminderController.addReminder(reminder);
                  scheduleBackgroundTask(
                    _titleController.text,
                    _descriptionController.text,
                    _dateController.text,
                    _timeController.text,
                    int.parse(_timesController.text),
                  );
                  Get.back();
                }
              },
              child: Text('Add Reminder'),
            ),
          ],
        ),
      ),
    );
  }
}
