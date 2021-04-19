import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/painting/gradient.dart';
import 'package:flutter/src/widgets/icon.dart';
import 'package:memento_app/memento_icons.dart';
import 'package:memento_app/models/nav_option_base.dart';

class ActivityModel extends NavOptionCardBase {
  ActivityModel(
      {String title = 'Atividade e Lazer',
      double porcentage = 0,
      Icon icon = const Icon(MementoIcons.iconawesomewalking),
      LinearGradient gradient = const LinearGradient(
          begin: Alignment(0, 0.5),
          end: Alignment(1, 0.5),
          colors: [const Color(0xffef0081), const Color(0xffff006c)]),
      int total = 0,
      int completed = 0,
      Color circleColor = const Color(0xffffd5fd)})
      : super.name(
            title, porcentage, icon, gradient, total, completed, circleColor);
}
