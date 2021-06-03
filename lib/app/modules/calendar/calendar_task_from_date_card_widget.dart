import 'package:flutter/material.dart';
import 'package:memento_app/app/modules/home/page/model_components/add_reminder/nav_option_card_base.dart';
import 'package:memento_app/constants/general_app_constants.dart';
import 'package:memento_app/shared/model/task.dart';
import 'package:memento_app/utilities/datetime_formatter.dart';

class TaskFromDateCardWidget extends StatelessWidget {
  ListScreenModel model;
  Task task;

  TaskFromDateCardWidget(this.model, this.task);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTileTheme(
        child: ListTile(
          leading: buildIcon(model),
          title: buildText(task),
          subtitle: buildSubtitle(task),
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(fromMillisToDate(task.dateMilli)),
        Text('${task.hour}:${task.min}'),
      ],
    );
  }
}
