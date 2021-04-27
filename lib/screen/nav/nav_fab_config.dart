import 'package:flutter/material.dart';
import 'package:memento_app/constants/general_app_constants.dart';
import 'package:memento_app/screen/nav/model_components/add_reminder/nav_add_item_list_model.dart';

class MementoFab extends StatelessWidget {
  final bool visible;

  MementoFab({this.visible});

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
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => NavAddItemList()));
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
              begin: Alignment(0.5, 0),/**/
              end: Alignment(0.5, 1),
              colors: [
                GeneralAppColor.fabGradient1,
                GeneralAppColor.fabGradient2
              ])),
      child: Icon(Icons.add),
    );
  }
}
