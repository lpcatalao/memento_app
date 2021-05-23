import 'package:flutter/material.dart';
import 'package:memento_app/utilities/datetime_formatter.dart';
import 'package:mobx/mobx.dart';

part 'reminder_store.g.dart';

class ReminderStore = _ReminderStoreBase with _$ReminderStore;

abstract class _ReminderStoreBase with Store {
  @observable
  String type = "";

  @observable
  String date = "";

  @observable
  String hour = "";

  @observable
  String reminderText = "";

  @observable
  int reminderTextLength = 0;

  @observable
  int dateMillisec = DateTime.now().millisecondsSinceEpoch;

  @observable
  int eventHour = DateTime.now().hour;

  @observable
  int eventMin = DateTime.now().minute;

  @action
  setTime(dynamic value) {
    if (value is DateTime) {
      dateMillisec = value.millisecondsSinceEpoch;
      date = formatDate(value);
    } else if (value is TimeOfDay) {
      eventHour = value.hour;
      eventMin = value.minute;
      hour = formatHour(value);
    }
  }

  @action
  setText(String txt) {
    this.reminderText = txt;
    this.reminderTextLength = this.reminderText.length;
  }

  @action
  setTextLength(int length) {
    this.reminderTextLength = length;
  }

  @action
  setType(String type) {
    this.type = type;
  }

  @action
  setDefaultDate(DateTime date) {
    this.date = formatDate(date);
  }

  @action
  setDefaultTime(TimeOfDay time) {
    this.hour = formatHour(time);
  }
}
