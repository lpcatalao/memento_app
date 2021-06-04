import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memento_app/app/modules/home/home_store.dart';
import 'package:memento_app/app/modules/home/page/model_components/add_reminder/nav_option_card_base.dart';
import 'package:memento_app/app/modules/home/page/submodules/reminder_store.dart';
import 'package:memento_app/shared/model/task_status.dart';

abstract class ListScreenWidget extends StatefulWidget {
  final ListScreenModel model;

  final reminder = Modular.get<ReminderStore>();
  final _home = Modular.get<HomeStore>();

  ListScreenWidget({this.model});

  @override
  _ListScreenWidgetState createState() => _ListScreenWidgetState();

  Widget undoneList();

  Widget doneList();
}

class _ListScreenWidgetState extends State<ListScreenWidget> {
  @override
  Widget build(BuildContext context) {
    final ListScreenModel model = widget.model;
    final _size = MediaQuery.of(context).size;

    return Container(
      width: _size.width,
      height: _size.height,
      decoration: BoxDecoration(color: Color(0xffd5dce6)),
      child: Column(
        children: [
          Container(
            height: _size.width * .25,
            decoration: BoxDecoration(gradient: model.gradient),
          ),
          top(_size, model),
          body(_size, model)
        ],
      ),
    );
  }

  Expanded body(Size size, ListScreenModel model) {
    final _controller = PageController(initialPage: 0);

    return Expanded(
      child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Container(
            width: size.width * .9,
            child: PageView(
              controller: _controller,
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.transparent),
                  child: widget.undoneList(),
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.transparent),
                  child: widget.doneList(),
                ),
              ],
            ),
          )),
    );
  }

  Container top(Size size, ListScreenModel model) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25))),
      width: size.width,
      height: size.height * .2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: size.width * .8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  model.title,
                  style: TextStyle(
                      color: Color(0xff292929),
                      fontWeight: FontWeight.bold,
                      fontSize: 24.sp),
                ),
                Stack(
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
                )
              ],
            ),
          ),
          Column(
            children: [
              Container(
                width: size.width * .8,
                height: 20,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Observer(
                    builder: (BuildContext context) {
                      final status =
                          widget._home.fechTaskStatus(widget.model.type);

                      return Text(
                        "${status.completed}/${status.total}",
                        style: TextStyle(fontSize: 20.0),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: (size.height * .1) * .1,
              ),
              Container(
                width: size.width * .8,
                height: (size.height * .1) * .2,
                child: _buildProgressBar(size, model),
              ),
            ],
          )
        ],
      ),
    );
  }

  Container _buildProgressBar(Size size, ListScreenModel model) {
    var maxProgressBarWidth = size.width - 85;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(18)),
          boxShadow: [
            BoxShadow(
                color: Color(0x0bffffff),
                offset: Offset(0, 1),
                blurRadius: 0,
                spreadRadius: 0)
          ],
          color: const Color(0xffeaeaea)),
      child: Stack(
        children: [
          Observer(
            builder: (BuildContext context) {
              TaskStatus status =
                  widget._home.fechTaskStatus(widget.model.type);
              return Container(
                  decoration: BoxDecoration(
                      gradient: model.gradient,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  height: size.height,
                  width: widget._home.checkProgressbarDivision(
                      maxProgressBarWidth, status.percent));
            },
          )
        ],
      ),
    );
  }
}
