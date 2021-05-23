import 'package:flutter/material.dart';
import 'package:memento_app/constants/general_app_constants.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  int itemSelected = 0;

  @action
  void setItemSelected(int index) {
    itemSelected = index;
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
