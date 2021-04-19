import 'package:flutter/src/painting/gradient.dart';
import 'package:flutter/src/widgets/icon.dart';
import 'package:memento_app/memento_icons.dart';
import 'package:memento_app/models/nav_option_base.dart';
import 'package:flutter/material.dart';

class BrainFitnessModel extends NavOptionCardBase {
  BrainFitnessModel(
      {String title = 'Brain Fitness',
      double porcentage = 0,
      Icon icon = const Icon(MementoIcons.bxshomeheart),
      LinearGradient gradient = const LinearGradient(
          begin: Alignment(0, 0.5),
          end: Alignment(1, 0.5),
          colors: [const Color(0xffffba00), const Color(0xffffd93b)]),
      int total = 0,
      int completed = 0,
      Color circleColor = const Color(0xfffdeebb)})
      : super.name(title, porcentage, icon, gradient, total, completed, circleColor);
}
