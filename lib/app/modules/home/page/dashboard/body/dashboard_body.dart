import 'package:flutter/material.dart';
import 'package:memento_app/app/modules/home/page/dashboard/body/dashboard_body_title.dart';
import 'package:memento_app/app/modules/home/page/dashboard/body/dashboard_pageview_widget.dart';
import 'package:memento_app/shared/model/dashboard_pageview_item.dart';
import 'package:memento_app/shared/model/task_status.dart';

class DashboardBodyWidget extends StatelessWidget {
  final double width;
  final double height;
  final BoxConstraints constraints;

  DashboardBodyWidget({this.width, this.height, this.constraints});

  @override
  Widget build(BuildContext context) {
    //TODO remover essa logica  ---> logica que apenas um exemplo
    /**O banco de dados ira procurar um Lista de TaskStatus e inserir em uma outra lista de DashboardPageViewItem*/
    List<TaskStatus> status1 = [
      TaskStatus(5, 10),
      TaskStatus(3, 10),
      TaskStatus(1, 5)
    ];

    List<TaskStatus> status2 = [
      TaskStatus(5, 25),
      TaskStatus(3, 36),
      TaskStatus(1, 12)
    ];

    List<TaskStatus> status3 = [
      TaskStatus(5, 35),
      TaskStatus(3, 42),
      TaskStatus(1, 25)
    ];

    List<DashboardPageViewItem> pageViewItem = [
      DashboardPageViewItem(width, height, constraints, "Dia", status1),
      DashboardPageViewItem(width, height, constraints, "Semana", status2),
      DashboardPageViewItem(width, height, constraints, "Mês", status3)
    ];

    return Column(
      children: [
        DashboardBodyTitleWidget(constraints),
        Container(
          height: height * .7,
          width: width,
          child: DashboardPageViewWidget(pageViewItem),
        )
        // dayWeekMonth(),
      ],
    );
  }
}
