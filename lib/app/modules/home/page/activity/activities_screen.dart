import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:memento_app/app/modules/home/page/activity/activity_list_widget.dart';
import 'package:memento_app/app/modules/home/page/model_components/start_item_list_screen_widget.dart';
import 'package:memento_app/app/modules/home/page/model_components/start_list_screen_widget.dart';
import 'package:memento_app/shared/model/task_status.dart';

class ActivityScreen extends ListScreenWidget {
  ActivityScreen()
      : super(model: ActivityListWidget(taskStatus: TaskStatus(3, 100)));

  @override
  Widget taskList() {
    reminder.fetchActivityTask();

    return Observer(
      builder: (BuildContext context) {
        final tasks = reminder.activitiesTasks.value;

        if (tasks != null) {
          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (BuildContext context, int index) {
              final t = tasks[index];
              return ItemListScreenWidget(model, t);
            },
          );
        }
        return Center(
            child: Column(
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 10),
            Text("Loading...")
          ],
        ));
      },
    );
  }
}
