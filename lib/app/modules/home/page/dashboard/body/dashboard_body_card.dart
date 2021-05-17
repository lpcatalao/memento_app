import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memento_app/models/nav_option_card_base.dart';
import 'package:memento_app/models/task_status.dart';


//TODO Arrumar uma maneira de remover esse constrainsts 
class DashboardBodyCardItemWidget extends StatelessWidget {
  final NavOptionCardBase _model;
  final BoxConstraints _constraints;

  DashboardBodyCardItemWidget(
    this._model,
    this._constraints,
  );

  @override
  Widget build(BuildContext context) {
    TaskStatus status = _model.taskStatus;
    return Container(
      width: _constraints.maxWidth * .9,
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
                  Text(
                    '${status.completed}/${status.total}',
                    style: configTextStyle(),
                  )
                ],
              ),
            ),
            subtitle: buildProgressBar(_model, _constraints.maxWidth),
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
        model.icon
      ],
    );
  }

  Widget buildProgressBar(NavOptionCardBase model, double width) {
    var status = model.taskStatus;
    var percentToDivide = checkDivision(status.completed, status.total);
    var maxWidth = (width * .7) / percentToDivide;

    var gradientStatus = maxWidth == 0.0 ? false : true;

    return Stack(
      children: [
        Container(
          height: 9,
          decoration: configProgressBar(gradientStatus: false),
        ),
        Container(
          height: 9,
          width: maxWidth,
          decoration:
              configProgressBar(model: model, gradientStatus: gradientStatus),
        ),
      ],
    );
  }

  BoxDecoration configProgressBar(
      {NavOptionCardBase model, bool gradientStatus}) {
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


  //TODO colocar dentro do taskStatus
  double checkDivision(int completed, int total) {
    var division = total / completed;
    if (division.toString() == double.nan.toString()) {
      return 0;
    }

    return division;
  }
}
