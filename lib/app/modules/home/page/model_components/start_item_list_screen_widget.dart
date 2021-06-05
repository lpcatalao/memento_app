import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:memento_app/app/modules/home/page/model_components/add_reminder/nav_option_card_base.dart';
import 'package:memento_app/app/modules/home/page/submodules/reminder_store.dart';
import 'package:memento_app/constants/general_app_constants.dart';
import 'package:memento_app/shared/model/task.dart';
import 'package:memento_app/utilities/datetime_formatter.dart';

class ItemListScreenWidget extends StatefulWidget {
  final ListScreenModel model;
  final Task task;
  final _reminder = Modular.get<ReminderStore>();

  ItemListScreenWidget(this.model, this.task);

  @override
  _ItemListScreenWidgetState createState() => _ItemListScreenWidgetState();
}

class _ItemListScreenWidgetState extends State<ItemListScreenWidget> {
  bool state = false;

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: Opacity(
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
                      int status = 0;
                      if (value) {
                        status = 1;
                      } else {
                        status = 0;
                      }

                      widget._reminder.updateTaskStatus(widget.task.id, status);
                      Future.delayed(const Duration(milliseconds: 800), () {
                        if (widget.task.type == "Atividade") {
                          widget._reminder.fetchActivityTask();
                          widget._reminder.fetchActivityTaskDone();
                        } else if (widget.task.type == "Medicine") {
                          widget._reminder.fetchMedicineTask();
                          widget._reminder.fetchMedicineTaskDone();
                        } else if (widget.task.type == "BrainFitness") {
                          widget._reminder.fetchBrainFitnessTask();
                          widget._reminder.fetchBrainFitnessTaskDone();
                        }
                      });

                      state = value;
                    });
                  },
                ),
              ),
            ),
          ),
        ));
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
