import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:memento_app/constants/general_app_constants.dart';

class MementoFab extends StatelessWidget {
  final bool visible;
  final int page;

  MementoFab({this.visible, this.page});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: buildFloatActionButton(context),
    );
  }

  FloatingActionButton buildFloatActionButton(BuildContext context) {
    return FloatingActionButton(
      child: buildCustomFab(),
      onPressed: () {
        if (page == 1) {
          Modular.to.navigate("/add_activity");
        } else if (page == 2) {
          Modular.to.navigate("/add_medicine");
        } else if (page == 3) {
          Modular.to.navigate("/add_brain_fitness");
        }
      },
    );
  }

  Container buildCustomFab() {
    return Container(
      width: GeneralWidgetSize.fabWidth,
      height: GeneralWidgetSize.fabHeight,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(32)),
          gradient: LinearGradient(
              begin: Alignment(0.5, 0),
              end: Alignment(0.5, 1),
              colors: [
                GeneralAppColor.fabGradient1,
                GeneralAppColor.fabGradient2
              ])),
      child: Icon(Icons.add),
    );
  }
}
