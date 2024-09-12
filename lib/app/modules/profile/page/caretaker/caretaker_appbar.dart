import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../add_profile_appbar_model.dart';

class CaretakerScreenAppBar extends ProfileAppbarModel {
  CaretakerScreenAppBar(double width, double height)
      : super(width, height, "CUIDADOR", FontAwesomeIcons.userNurse,
            Colors.transparent);
}
