import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memento_app/app/modules/home/home_store.dart';
import 'package:memento_app/app/modules/home/page/model_components/add_reminder/nav_option_card_base.dart';
import 'package:memento_app/shared/model/task_status.dart';

//TODO Arrumar uma maneira de remover esse constrainsts
class DashboardBodyCardItemWidget extends StatelessWidget {
  final ListScreenModel _model;
  final _width;

  final _home = Modular.get<HomeStore>();

  DashboardBodyCardItemWidget(
    this._model,
    this._width,
  );

  @override
  Widget build(BuildContext context) {
    // TaskStatus status = _model.taskStatus;
    return Container(
      width: _width * .9,
      child: Card(
        child: ListTileTheme(
          iconColor: Colors.black,
          child: ListTile(
            leading: buildIcon(_model),
            title: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _model.title,
                    style: configTextStyle(),
                  ),
                  Observer(
                    builder: (BuildContext context) {
                      TaskStatus status = _home.fechTaskStatus(_model.type);
                      return Text(
                        '${status.completed}/${status.total}',
                        style: configTextStyle(),
                      );
                    },
                  )
                ],
              ),
            ),
            subtitle: buildProgressBar(_model, _width),
          ),
        ),
      ),
    );
  }

  TextStyle configTextStyle() {
    return TextStyle(
        color: Color(0xff292929),
        fontWeight: FontWeight.w500,
        fontFamily: "Poppins",
        fontStyle: FontStyle.normal,
        fontSize: 17.sp);
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

  Widget buildProgressBar(ListScreenModel model, double width) {
    return Observer(
      builder: (BuildContext context) {
        final status = _home.fechTaskStatus(model.type);
        double maxWidth =
            _home.checkProgressbarDivision((width * .7), status.percent);
        var gradientStatus = maxWidth == 0.0 ? false : true;
        _home.findTaskStatus();

        return Stack(
          children: [
            Container(
              height: 9,
              decoration: configProgressBar(gradientStatus: false),
            ),
            Container(
              height: 9,
              width: maxWidth,
              decoration: configProgressBar(
                  model: model, gradientStatus: gradientStatus),
            ),
          ],
        );
      },
    );
  }

  BoxDecoration configProgressBar(
      {ListScreenModel model, bool gradientStatus}) {
    return BoxDecoration(
        gradient: gradientStatus == false ? null : model.gradient,
        borderRadius: BorderRadius.all(Radius.circular(18)),
        boxShadow: [
          BoxShadow(
              color: Color(0x0bffffff),
              offset: Offset(0, 1),
              blurRadius: 0,
              spreadRadius: 0)
        ],
        color: Color(0xffeaeaea));
  }
}
