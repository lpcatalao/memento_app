import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:memento_app/app/modules/home/page/activity/activity_list_widget.dart';
import 'package:memento_app/app/modules/home/page/model_components/start_item_list_screen_widget.dart';
import 'package:memento_app/app/modules/home/page/model_components/start_list_screen_widget.dart';

class ActivityScreen extends ListScreenWidget {
  ActivityScreen() : super(model: ActivityListWidget());

  @override
  Widget undoneList() {
    reminder.fetchActivityTask();

    return Observer(
      builder: (BuildContext context) {
        final tasks = reminder.activitiesTasks.value;

        if (tasks != null) {
          return MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (BuildContext context, int index) {
                final t = tasks[index];
                return ItemListScreenWidget(model, t);
              },
            ),
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

  @override
  Widget doneList() {
    reminder.fetchActivityTaskDone();

    return Observer(
      builder: (BuildContext context) {
        final tasks = reminder.activitiesTasksDone.value;

        if (tasks != null) {
          return MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (BuildContext context, int index) {
                final t = tasks[index];
                return ItemListScreenWidget(model, t);
              },
            ),
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
