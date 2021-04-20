import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:memento_app/constants%20/general_app_constants.dart';
import 'package:memento_app/constants%20/memento_icons.dart';
import 'package:memento_app/models/nav_option_card_base.dart';
import 'package:memento_app/models/task_status.dart';

class ActivityCardModel extends NavOptionCardBase {
  static const _TITLE = 'Atividade e Lazer';
  static const Icon _ICON = Icon(MementoIcons.iconawesomewalking);
  static const LinearGradient _GRADIENT = LinearGradient(
      begin: Alignment(0, 0.5),
      end: Alignment(1, 0.5),
      colors: [GeneralAppColor.activityBar1, GeneralAppColor.activityBar2]);
  static const Color _CIRCLE_COLOR = GeneralAppColor.activityCircle;
  static const Color _CHECK_BOX_COLOR = Colors.red;

  ActivityCardModel({TaskStatus taskStatus})
      : super.name(_TITLE, _ICON, _GRADIENT, _CIRCLE_COLOR, _CHECK_BOX_COLOR,
            taskStatus);
}
