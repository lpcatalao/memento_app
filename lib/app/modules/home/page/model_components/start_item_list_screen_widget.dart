import 'package:flutter/material.dart';
import 'package:memento_app/app/modules/home/page/model_components/add_reminder/nav_option_card_base.dart';
import 'package:memento_app/constants/general_app_constants.dart';
import 'package:memento_app/shared/model/task.dart';
import 'package:memento_app/utilities/datetime_formatter.dart';

class ItemListScreenWidget extends StatefulWidget {
  final ListScreenModel model;
  final Task task;

  ItemListScreenWidget(this.model, this.task);

  @override
  _ItemListScreenWidgetState createState() => _ItemListScreenWidgetState();
}

class _ItemListScreenWidgetState extends State<ItemListScreenWidget> {
  bool state = false;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: state == true ? .5 : 1,
      child: Card(
        child: ListTileTheme(
          child: ListTile(
            leading: buildIcon(widget.model),
            title: buildText(widget.task),
            subtitle: buildSubtitle(widget.task),
            trailing: Checkbox(
              value: state,
              activeColor: widget.model.checkBoxSelected,
              onChanged: (bool value) {
                setState(() {
                  print(value);
                  state = value;
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  Stack buildIcon(ListScreenModel model) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(32)),
                color: model.circleColor)),
        model.icon
      ],
    );
  }

  Text buildText(Task task) {
    return Text(
      task.text,
      style: TextStyle(
          color: GeneralAppColor.black,
          fontWeight: FontWeight.w700,
          fontFamily: "Montserrat",
          fontStyle: FontStyle.normal,
          fontSize: 15.0),
    );
  }

  Row buildSubtitle(Task task) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(fromMillisToDate(task.dateMilli)),
        Text('${task.hour}:${task.min}'),
      ],
    );
  }
}
