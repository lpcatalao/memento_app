import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:memento_app/app/modules/home/page/model_components/add_reminder/nav_option_card_base.dart';
import 'package:memento_app/constants/general_app_constants.dart';
import 'package:memento_app/constants/memento_icons.dart';
import 'package:memento_app/shared/model/task_status.dart';

class ActivityListWidget extends ListScreenModel {
  static const _TITLE = 'Atividade e Lazer';
  static const Icon _ICON = Icon(MementoIcons.iconawesomewalking);
  static const LinearGradient _GRADIENT = LinearGradient(
      begin: Alignment(0, 0.5),
      end: Alignment(1, 0.5),
      colors: [GeneralAppColor.activityBar1, GeneralAppColor.activityBar2]);
  static const Color _CIRCLE_COLOR = GeneralAppColor.activityCircle;
  static const Color _CHECK_BOX_COLOR = Colors.red;
  static const Color _DEFAULT_COLOR = GeneralAppColor.defaultColor;

  ActivityListWidget({TaskStatus taskStatus})
      : super.name(_TITLE, _ICON, _GRADIENT, _CIRCLE_COLOR, _CHECK_BOX_COLOR,
            taskStatus, _DEFAULT_COLOR);
}
