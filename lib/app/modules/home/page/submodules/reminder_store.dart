import 'package:flutter/material.dart';
import 'package:memento_app/shared/model/task.dart';
import 'package:memento_app/shared/repository/task_repository.dart';
import 'package:memento_app/utilities/datetime_formatter.dart';
import 'package:mobx/mobx.dart';

part 'reminder_store.g.dart';

class ReminderStore = _ReminderStoreBase with _$ReminderStore;

abstract class _ReminderStoreBase with Store {
  final TaskRepository repository;

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

  @observable
  ObservableFuture<List<Task>> activitiesTasks = ObservableFuture.value([]);

  @observable
  ObservableFuture<List<Task>> activitiesTasksDone = ObservableFuture.value([]);

  @observable
  ObservableFuture<List<Task>> medicinesTasks = ObservableFuture.value([]);

  @observable
  ObservableFuture<List<Task>> medicinesTasksDone = ObservableFuture.value([]);

  @observable
  ObservableFuture<List<Task>> brainFitnessTasks = ObservableFuture.value([]);

  @observable
  ObservableFuture<List<Task>> brainFitnessTasksDone =
      ObservableFuture.value([]);

  @observable
  ObservableFuture<int> taskId = ObservableFuture.value(-1);

  @observable
  bool formStatus = false;

  _ReminderStoreBase(this.repository);

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

    if (reminderTextLength > 0) {
      formStatus = true;
    } else {
      formStatus = false;
    }
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

  @action
  fetchActivityTask() =>
      activitiesTasks = repository.findAllActivity().asObservable();

  @action
  fetchActivityTaskDone() =>
      activitiesTasksDone = repository.findAllActivityDone().asObservable();

  @action
  fetchMedicineTask() =>
      medicinesTasks = repository.findAllMedicine().asObservable();

  @action
  fetchMedicineTaskDone() =>
      medicinesTasksDone = repository.findAllMedicineDone().asObservable();

  @action
  fetchBrainFitnessTask() =>
      brainFitnessTasks = repository.findAllBrainFitness().asObservable();

  @action
  fetchBrainFitnessTaskDone() => brainFitnessTasksDone =
      repository.findAllBrainFitnessDone().asObservable();

  @action
  insertTask(Task task) {
    taskId = repository.insertTask(task).asObservable();
    fetchActivityTask();
    fetchMedicineTask();
    fetchBrainFitnessTask();
  }

  bool setFormStatus() => reminderText.length > 0 ? true : false;
}
