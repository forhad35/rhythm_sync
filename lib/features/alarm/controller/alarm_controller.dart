import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/alarm_model.dart';
import '../service/alarm_service.dart';

import 'package:hive/hive.dart';

class AlarmController extends GetxController {
  var alarms = <AlarmModel>[].obs;
  late Box<AlarmModel> alarmBox;

  @override
  void onInit() {
    super.onInit();
    alarmBox = Hive.box<AlarmModel>('alarms');
    alarms.value = alarmBox.values.toList();
  }

  Future<void> pickDateTime(BuildContext context) async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (date == null) return;

    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time == null) return;

    final DateTime dateTime = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );

    final alarm = AlarmModel(time: dateTime, enabled: true);
    await alarmBox.add(alarm);
    alarms.add(alarm);

    AlarmService.scheduleAlarm(dateTime, 'Alarm', 'Your scheduled alarm');
  }

  void toggleAlarm(int index, bool value) {
    final alarm = alarms[index];
    alarm.enabled = value;
    alarm.save(); // Update in Hive

    alarms[index] = alarm;

    if (value) {
      AlarmService.scheduleAlarm(alarm.time, 'Alarm', 'Your scheduled alarm');
    } else {
      AlarmService.cancelAlarm(alarm.time.hashCode);
    }
  }



  String formatDateTime(DateTime dateTime) {
    return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')} - ${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }
}
