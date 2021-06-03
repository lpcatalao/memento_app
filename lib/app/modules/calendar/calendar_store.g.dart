// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CalendarStore on _CalendarStoreBase, Store {
  final _$calendarFormatAtom = Atom(name: '_CalendarStoreBase.calendarFormat');

  @override
  CalendarFormat get calendarFormat {
    _$calendarFormatAtom.reportRead();
    return super.calendarFormat;
  }

  @override
  set calendarFormat(CalendarFormat value) {
    _$calendarFormatAtom.reportWrite(value, super.calendarFormat, () {
      super.calendarFormat = value;
    });
  }

  final _$focusedDayAtom = Atom(name: '_CalendarStoreBase.focusedDay');

  @override
  DateTime get focusedDay {
    _$focusedDayAtom.reportRead();
    return super.focusedDay;
  }

  @override
  set focusedDay(DateTime value) {
    _$focusedDayAtom.reportWrite(value, super.focusedDay, () {
      super.focusedDay = value;
    });
  }

  final _$selectedDayAtom = Atom(name: '_CalendarStoreBase.selectedDay');

  @override
  DateTime get selectedDay {
    _$selectedDayAtom.reportRead();
    return super.selectedDay;
  }

  @override
  set selectedDay(DateTime value) {
    _$selectedDayAtom.reportWrite(value, super.selectedDay, () {
      super.selectedDay = value;
    });
  }

  final _$tasksAtom = Atom(name: '_CalendarStoreBase.tasks');

  @override
  ObservableFuture<List<Task>> get tasks {
    _$tasksAtom.reportRead();
    return super.tasks;
  }

  @override
  set tasks(ObservableFuture<List<Task>> value) {
    _$tasksAtom.reportWrite(value, super.tasks, () {
      super.tasks = value;
    });
  }

  final _$modelAtom = Atom(name: '_CalendarStoreBase.model');

  @override
  ListScreenModel get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(ListScreenModel value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  final _$_CalendarStoreBaseActionController =
      ActionController(name: '_CalendarStoreBase');

  @override
  void setCalendarFormat(CalendarFormat newCalendarFormat) {
    final _$actionInfo = _$_CalendarStoreBaseActionController.startAction(
        name: '_CalendarStoreBase.setCalendarFormat');
    try {
      return super.setCalendarFormat(newCalendarFormat);
    } finally {
      _$_CalendarStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFocusedDay(DateTime focusedDay) {
    final _$actionInfo = _$_CalendarStoreBaseActionController.startAction(
        name: '_CalendarStoreBase.setFocusedDay');
    try {
      return super.setFocusedDay(focusedDay);
    } finally {
      _$_CalendarStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedDay(DateTime selectedDay) {
    final _$actionInfo = _$_CalendarStoreBaseActionController.startAction(
        name: '_CalendarStoreBase.setSelectedDay');
    try {
      return super.setSelectedDay(selectedDay);
    } finally {
      _$_CalendarStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setModel(Task task) {
    final _$actionInfo = _$_CalendarStoreBaseActionController.startAction(
        name: '_CalendarStoreBase.setModel');
    try {
      return super.setModel(task);
    } finally {
      _$_CalendarStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void fetchTaskFromDate(DateTime dateTime) {
    final _$actionInfo = _$_CalendarStoreBaseActionController.startAction(
        name: '_CalendarStoreBase.fetchTaskFromDate');
    try {
      return super.fetchTaskFromDate(dateTime);
    } finally {
      _$_CalendarStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
calendarFormat: ${calendarFormat},
focusedDay: ${focusedDay},
selectedDay: ${selectedDay},
tasks: ${tasks},
model: ${model}
    ''';
  }
}
