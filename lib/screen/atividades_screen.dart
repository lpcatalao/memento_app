import 'package:flutter/material.dart';
import 'package:memento_app/screen/option_base_screen.dart';

import 'add_activity_screen.dart';

class ActivitiesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Container(
      width: _size.width,
      height: _size.height,
      decoration: BoxDecoration(color: Colors.green),
      child: OptionBaseScreen(title: 'Atividade'),
    );
  }
}
