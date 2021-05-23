import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memento_app/app/modules/home/page/model_components/add_reminder/nav_option_card_base.dart';
import 'package:memento_app/app/modules/home/page/model_components/start_item_list_screen_widget.dart';
import 'package:memento_app/shared/model/item.dart';

abstract class ListScreenWidget extends StatefulWidget {
  final ListScreenModel model;
  final List<Item> items;

  ListScreenWidget({this.model, this.items});

  @override
  _ListScreenWidgetState createState() => _ListScreenWidgetState();
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
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Container(
          decoration: BoxDecoration(color: Colors.transparent),
          width: size.width * .9,
          child: ListView.builder(
            itemCount: widget.items.length,
            itemBuilder: (BuildContext context, int index) {
              final item = widget.items[index];
              return ItemListScreenWidget(model, item);
            },
          ),
        ),
      ),
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
          Container(
            decoration: BoxDecoration(color: Colors.transparent),
            width: size.width * .8,
            height: (size.height * .13) * .2,
            child: buildProgressBar(size, model),
          )
        ],
      ),
    );
  }

  Container buildProgressBar(Size size, ListScreenModel model) {
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
          Container(
              decoration: BoxDecoration(
                  gradient: model.gradient,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              height: size.height,
              width: maxProgressBarWidth / model.taskStatus.percent)
        ],
      ),
    );
  }
}
