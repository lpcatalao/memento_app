import 'package:flutter/material.dart';
import 'package:memento_app/constants%20/general_app_constants.dart';
import 'package:memento_app/models/Item.dart';
import 'package:memento_app/models/nav_option_card_base.dart';

class NavContentCardItem extends StatelessWidget {
  final NavOptionCardBase model;
  final Item item;

  NavContentCardItem(this.model, this.item);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: item.state == true ? .5 : 1,
      child: Card(
        child: ListTileTheme(
          child: ListTile(
            leading: buildIcon(model),
            title: buildText(item),
            subtitle: buildSubtitle(item),
            trailing: Checkbox(
              value: item.state,
              activeColor: model.checkBoxSelected,
              onChanged: (bool value) {},
            ),
          ),
        ),
      ),
    );
    ;
  }

  Stack buildIcon(NavOptionCardBase model) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(32)),
                color: model.circleColor)),
        Icon(Icons.assignment_sharp)
      ],
    );
  }

  Text buildText(Item item) {
    return Text(
      item.text,
      style: TextStyle(
          color: GeneralAppColor.black,
          fontWeight: FontWeight.w700,
          fontFamily: "Montserrat",
          fontStyle: FontStyle.normal,
          fontSize: 15.0),
    );
  }

  Row buildSubtitle(Item item) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [Text('12/03'), Text('15:00')],
    );
  }
}
