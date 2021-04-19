import 'dart:ui';

import 'package:flutter/src/painting/gradient.dart';
import 'package:flutter/src/widgets/icon.dart';
import 'package:memento_app/models/nav_option_base.dart';
import 'package:flutter/material.dart';
import 'package:memento_app/memento_icons.dart';

class MedicineModel extends NavOptionCardBase {
  MedicineModel(
      {String title = 'Medicamento',
      double porcentage = 0,
      Icon icon = const Icon(MementoIcons.iconmapdoctor),
      LinearGradient gradient = const LinearGradient(
          begin: Alignment(0, 0.5),
          end: Alignment(1, 0.5),
          colors: [const Color(0xffafef00), const Color(0xff0aff00)]),
      int total = 0,
      int completed = 0,
      Color circleColor = const Color(0xffd5ffe0)})
      : super.name(
            title, porcentage, icon, gradient, total, completed, circleColor);
}
