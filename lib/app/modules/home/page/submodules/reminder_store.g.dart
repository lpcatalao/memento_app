// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ReminderStore on _ReminderStoreBase, Store {
  final _$typeAtom = Atom(name: '_ReminderStoreBase.type');

  @override
  String get type {
    _$typeAtom.reportRead();
    return super.type;
  }

  @override
  set type(String value) {
    _$typeAtom.reportWrite(value, super.type, () {
      super.type = value;
    });
  }

  final _$dateAtom = Atom(name: '_ReminderStoreBase.date');

  @override
  String get date {
    _$dateAtom.reportRead();
    return super.date;
  }

  @override
  set date(String value) {
    _$dateAtom.reportWrite(value, super.date, () {
      super.date = value;
    });
  }

  final _$hourAtom = Atom(name: '_ReminderStoreBase.hour');

  @override
  String get hour {
    _$hourAtom.reportRead();
    return super.hour;
  }

  @override
  set hour(String value) {
    _$hourAtom.reportWrite(value, super.hour, () {
      super.hour = value;
    });
  }

  final _$reminderTextAtom = Atom(name: '_ReminderStoreBase.reminderText');

  @override
  String get reminderText {
    _$reminderTextAtom.reportRead();
    return super.reminderText;
  }

  @override
  set reminderText(String value) {
    _$reminderTextAtom.reportWrite(value, super.reminderText, () {
      super.reminderText = value;
    });
  }

  final _$reminderTextLengthAtom =
      Atom(name: '_ReminderStoreBase.reminderTextLength');

  @override
  int get reminderTextLength {
    _$reminderTextLengthAtom.reportRead();
    return super.reminderTextLength;
  }

  @override
  set reminderTextLength(int value) {
    _$reminderTextLengthAtom.reportWrite(value, super.reminderTextLength, () {
      super.reminderTextLength = value;
    });
  }

  final _$dateMillisecAtom = Atom(name: '_ReminderStoreBase.dateMillisec');

  @override
  int get dateMillisec {
    _$dateMillisecAtom.reportRead();
    return super.dateMillisec;
  }

  @override
  set dateMillisec(int value) {
    _$dateMillisecAtom.reportWrite(value, super.dateMillisec, () {
      super.dateMillisec = value;
    });
  }

  final _$eventHourAtom = Atom(name: '_ReminderStoreBase.eventHour');

  @override
  int get eventHour {
    _$eventHourAtom.reportRead();
    return super.eventHour;
  }

  @override
  set eventHour(int value) {
    _$eventHourAtom.reportWrite(value, super.eventHour, () {
      super.eventHour = value;
    });
  }

  final _$eventMinAtom = Atom(name: '_ReminderStoreBase.eventMin');

  @override
  int get eventMin {
    _$eventMinAtom.reportRead();
    return super.eventMin;
  }

  @override
  set eventMin(int value) {
    _$eventMinAtom.reportWrite(value, super.eventMin, () {
      super.eventMin = value;
    });
  }

  final _$_ReminderStoreBaseActionController =
      ActionController(name: '_ReminderStoreBase');

  @override
  dynamic setTime(dynamic value) {
    final _$actionInfo = _$_ReminderStoreBaseActionController.startAction(
        name: '_ReminderStoreBase.setTime');
    try {
      return super.setTime(value);
    } finally {
      _$_ReminderStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setText(String txt) {
    final _$actionInfo = _$_ReminderStoreBaseActionController.startAction(
        name: '_ReminderStoreBase.setText');
    try {
      return super.setText(txt);
    } finally {
      _$_ReminderStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTextLength(int length) {
    final _$actionInfo = _$_ReminderStoreBaseActionController.startAction(
        name: '_ReminderStoreBase.setTextLength');
    try {
      return super.setTextLength(length);
    } finally {
      _$_ReminderStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setType(String type) {
    final _$actionInfo = _$_ReminderStoreBaseActionController.startAction(
        name: '_ReminderStoreBase.setType');
    try {
      return super.setType(type);
    } finally {
      _$_ReminderStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDefaultDate(DateTime date) {
    final _$actionInfo = _$_ReminderStoreBaseActionController.startAction(
        name: '_ReminderStoreBase.setDefaultDate');
    try {
      return super.setDefaultDate(date);
    } finally {
      _$_ReminderStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDefaultTime(TimeOfDay time) {
    final _$actionInfo = _$_ReminderStoreBaseActionController.startAction(
        name: '_ReminderStoreBase.setDefaultTime');
    try {
      return super.setDefaultTime(time);
    } finally {
      _$_ReminderStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
type: ${type},
date: ${date},
hour: ${hour},
reminderText: ${reminderText},
reminderTextLength: ${reminderTextLength},
dateMillisec: ${dateMillisec},
eventHour: ${eventHour},
eventMin: ${eventMin}
    ''';
  }
}
