import 'package:flutter/material.dart';
import 'package:memento_app/app/modules/home/page/activity/activity_list_widget.dart';
import 'package:memento_app/app/modules/home/page/brain_fitness/brain_fitness_widget.dart';
import 'package:memento_app/app/modules/home/page/medicine/medicine_list.dart';
import 'package:memento_app/app/modules/home/page/model_components/add_reminder/nav_option_card_base.dart';
import 'package:memento_app/constants/general_app_constants.dart';
import 'package:memento_app/shared/model/task.dart';
import 'package:memento_app/shared/repository/task_repository.dart';
import 'package:memento_app/utilities/datetime_formatter.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  TaskRepository _taskRepository;

  HomeStoreBase(this._taskRepository);

  @observable
  int itemSelected = 0;

  @observable
  ObservableFuture<List<Task>> tasks = ObservableFuture.value([]);

  @observable
  ListScreenModel model;

  @action
  void setItemSelected(int index) {
    itemSelected = index;
  }

  @action
  void fetchTodayData(DateTime date) {
    tasks = _taskRepository.findAllFromDate(formatDate(date)).asObservable();
  }

  @action
  void setModel(Task task) {
    if (task.type == 'Atividade') {
      model = ActivityListWidget();
    } else if (task.type == 'Medicamento') {
      model = MedicineListWidget();
    } else if (task.type == 'BrainFitness') {
      model = BrainFitnessListWidget();
    }
  }

  bool get isFabVisible {
    if (itemSelected > 0) {
      return true;
    }
    return false;
  }

  Color get changeColor {
    if (itemSelected == 1) {
      return GeneralAppColor.activityBar2;
    } else if (itemSelected == 2) {
      return GeneralAppColor.medicineBar2;
    } else if (itemSelected == 3) {
      return GeneralAppColor.brainBar1;
    }
  }
}
