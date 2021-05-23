import 'package:flutter/material.dart';
import 'package:memento_app/app/modules/home/page/model_components/add_reminder/body/nav_add_day_time_model.dart';

class TimeOfDayWidget extends NavAddDayTimeModel {
  static final _TEXT = 'Definir Hora';
  static final _ICON = Icons.watch_later;
  TimeOfDay _timeOfDay =
      TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);

  TimeOfDayWidget() : super(_TEXT, _ICON, ReminderType.HOUR);

  @override
  Future pickTimeDay(BuildContext context) {
    return showTimePicker(context: context, initialTime: _timeOfDay);
  }
}
