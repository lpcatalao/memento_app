import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memento_app/app/modules/home/page/nav_content_card_item.dart';
import 'package:memento_app/models/Item.dart';
import 'package:memento_app/models/nav_option_card_base.dart';

class NavContentLayout extends StatefulWidget {
  final NavOptionCardBase model;

  NavContentLayout({this.model});

  @override
  _NavContentLayoutState createState() => _NavContentLayoutState();
}

class _NavContentLayoutState extends State<NavContentLayout> {
  final List<Item> items = [
    Item(text: 'Correr com o João', state: false),
    Item(text: 'Ler um livro', state: false),
    Item(text: 'Ligar para Filha', state: true),
    Item(text: 'Ligar para Filha', state: true),
    Item(text: 'Ligar para Filha', state: true),
    Item(text: 'Ligar para Filha', state: true),
    Item(text: 'Ligar para Filha', state: true),
    Item(text: 'Ligar para Filha', state: true),
    Item(text: 'Ligar para Filha', state: true),
    Item(text: 'Jogar Minecraft', state: true)
  ];

  @override
  Widget build(BuildContext context) {
    final NavOptionCardBase model = widget.model;

    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        children: [
          Container(
            height: constraints.maxHeight * .15,
            decoration: BoxDecoration(gradient: model.gradient),
          ),
          top(constraints, model),
          body(constraints, model)
        ],
      );
    });
  }

  Expanded body(BoxConstraints constraints, NavOptionCardBase model) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Container(
          decoration: BoxDecoration(color: Colors.transparent),
          width: constraints.maxWidth * .9,
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              final item = items[index];
              return NavContentCardItem(model, item);
            },
          ),
        ),
      ),
    );
  }

  Container top(BoxConstraints constraints, NavOptionCardBase model) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25))),
      width: constraints.maxWidth,
      height: constraints.maxHeight * .2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: constraints.maxWidth * .8,
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
            width: constraints.maxWidth * .8,
            height: (constraints.maxHeight * .13) * .2,
            child: buildProgressBar(constraints, model),
          )
        ],
      ),
    );
  }

  Container buildProgressBar(
      BoxConstraints constraints, NavOptionCardBase model) {
    var maxProgressBarWidth = constraints.maxWidth - 85;
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
              height: constraints.maxHeight,
              width: maxProgressBarWidth / model.taskStatus.percent)
        ],
      ),
    );
  }
}
