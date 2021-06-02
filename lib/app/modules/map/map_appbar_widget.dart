import 'package:flutter/material.dart';
import 'package:memento_app/app/modules/profile/page/add_profile_appbar_model.dart';

class MapAppbarWidget extends ProfileAppbarModel {
  MapAppbarWidget(double width, double height)
      : super(width, height, "MARCAÇÃO DE \nPERÍMETRO", Icons.map_outlined,
      Colors.transparent);
}
