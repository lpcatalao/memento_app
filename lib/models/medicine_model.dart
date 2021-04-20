import 'dart:ui';

import 'package:flutter/src/painting/gradient.dart';
import 'package:flutter/src/widgets/icon.dart';
import 'package:memento_app/constants%20/general_app_constants.dart';
import 'package:memento_app/models/nav_option_card_base.dart';
import 'package:flutter/material.dart';
import 'package:memento_app/constants%20/memento_icons.dart';
import 'package:memento_app/models/task_status.dart';

class MedicineCardModel extends NavOptionCardBase {
  static const String _TITLE = 'Medicamento';
  static const Icon _ICON = Icon(MementoIcons.iconmapdoctor);
  static const LinearGradient _GRADIENT = const LinearGradient(
      begin: Alignment(0, 0.5),
      end: Alignment(1, 0.5),
      colors: [GeneralAppColor.medicineBar1, GeneralAppColor.medicineBar2]);
  static const Color _CIRCLE_COLOR = GeneralAppColor.medicineCircle;
  static const Color _CHECK_BOX_COLOR = Colors.lightGreen;

  MedicineCardModel(
      {double porcentage = 0,
      int total = 0,
      int completed = 0,
      TaskStatus taskStatus})
      : super.name(_TITLE, _ICON, _GRADIENT, _CIRCLE_COLOR, _CHECK_BOX_COLOR,
            taskStatus);
}
