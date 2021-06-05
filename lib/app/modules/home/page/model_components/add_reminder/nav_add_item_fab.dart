import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:memento_app/app/modules/home/home_store.dart';
import 'package:memento_app/app/modules/home/page/submodules/reminder_store.dart';
import 'package:memento_app/shared/model/task.dart';

class AddItemFabWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _reminder = Modular.get<ReminderStore>();
    final _home = Modular.get<HomeStore>();

    return Observer(builder: (context) {
      final status = _reminder.formStatus;
      return FloatingActionButton.extended(
          backgroundColor: status ? Color(0xff43d836) : Colors.grey,
          icon: Icon(Icons.add),
          onPressed: status
              ? () {
                  Navigator.pop(context);

                  final task = Task(
                      _reminder.reminderText,
                      _reminder.dateMillisec,
                      _reminder.eventHour,
                      _reminder.eventMin,
                      _reminder.date,
                      _reminder.type);

                  _reminder.insertTask(task);
                  _home.findTaskStatus();
                }
              : null,
          label: Text('Adicionar'));
    });
  }
}
