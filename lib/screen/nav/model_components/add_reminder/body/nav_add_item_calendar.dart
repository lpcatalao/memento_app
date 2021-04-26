import 'package:flutter/material.dart';
import 'package:memento_app/screen/nav/model_components/add_reminder/body/nav_add_day_time_model.dart';

class NavAddItemCalendar extends NavAddDayTimeModel {
  static final _TEXT = 'Definir data';
  static final _ICON = Icons.calendar_today_sharp;
  NavAddItemCalendar() : super(_TEXT, _ICON);

}
