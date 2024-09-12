import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:memento_app/app/modules/calendar/calendar_store.dart';
import 'package:table_calendar/table_calendar.dart';

class TableCalendarWidget extends StatefulWidget {
  @override
  _TableCalendarWidgetState createState() => _TableCalendarWidgetState();
}

class _TableCalendarWidgetState
    extends ModularState<TableCalendarWidget, CalendarStore> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Observer(
        builder: (BuildContext context) {
          return TableCalendar(
            locale: 'pt_BR',
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: store.focusedDay,
            calendarFormat: store.calendarFormat,
            selectedDayPredicate: (day) => isSameDay(store.selectedDay, day),
            calendarStyle: CalendarStyle(
                todayTextStyle: TextStyle(color: Colors.white),
                todayDecoration: BoxDecoration(
                    color: Color(0xFF00D0BE),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5.0)),
                selectedTextStyle: TextStyle(color: Colors.white),
                isTodayHighlighted: true,
                selectedDecoration: BoxDecoration(color: Colors.teal)),
            onDaySelected: (selectedDay, focusedDay) {
              store.isNotSameDay(selectedDay, focusedDay);
            },
            onFormatChanged: (format) => store.isDifferentFormat(format),
            onPageChanged: (focusedDay) => store.setFocusedDay(focusedDay),
          );
        },
      ),
    );
  }
}
