import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:memento_app/app/modules/home/page/model_components/add_reminder/nav_option_card_base.dart';
import 'package:memento_app/constants/general_app_constants.dart';
import 'package:memento_app/constants/memento_icons.dart';
import 'package:memento_app/shared/model/task_status.dart';

class MedicineListWidget extends ListScreenModel {
  static const String _TITLE = 'Medicamento';
  static const Icon _ICON = Icon(MementoIcons.iconmapdoctor);
  static const LinearGradient _GRADIENT = const LinearGradient(
      begin: Alignment(0, 0.5),
      end: Alignment(1, 0.5),
      colors: [GeneralAppColor.medicineBar1, GeneralAppColor.medicineBar2]);
  static const Color _CIRCLE_COLOR = GeneralAppColor.medicineCircle;
  static const Color _CHECK_BOX_COLOR = Colors.lightGreen;
  static const Color _DEFAULT_COLOR = GeneralAppColor.fabGradient1;

  MedicineListWidget(
      {double porcentage = 0,
      int total = 0,
      int completed = 0,
      TaskStatus taskStatus})
      : super.name(_TITLE, _ICON, _GRADIENT, _CIRCLE_COLOR, _CHECK_BOX_COLOR,
            taskStatus, _DEFAULT_COLOR);
}
