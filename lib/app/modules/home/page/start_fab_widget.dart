import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:memento_app/constants/general_app_constants.dart';

class StartFabWidget extends StatelessWidget {
  final bool visible;
  final int page;
  final Color color;

  StartFabWidget({this.visible, this.page, this.color});

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
          Modular.to.navigate("/home/add_activity");
        } else if (page == 2) {
          Modular.to.navigate("/home/add_medicine");
        } else if (page == 3) {
          Modular.to.navigate("/home/add_brain_fitness");
        }
      },
    );
  }

  Container buildCustomFab() {
    return Container(
      width: GeneralWidgetSize.fabWidth,
      height: GeneralWidgetSize.fabHeight,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(32)),
      ),
      child: Icon(Icons.add),
    );
  }
}
