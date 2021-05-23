import 'package:flutter/material.dart';
import 'package:memento_app/app/modules/home/page/model_components/add_reminder/body/nav_add_day_time_model.dart';

class CalendarWidget extends NavAddDayTimeModel {
  static final _TEXT = 'Definir data';
  static final _ICON = Icons.calendar_today_sharp;

  CalendarWidget() : super(_TEXT, _ICON, ReminderType.DATE);

  @override
  Future pickTimeDay(BuildContext context) {
    // TODO: implement pickTimeDay
    return showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2021),
        lastDate: DateTime(2099));
    ;
  }
}
