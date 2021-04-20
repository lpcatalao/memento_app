import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memento_app/constants%20/general_app_constants.dart';
import 'package:memento_app/models/Item.dart';
import 'package:memento_app/models/nav_option_card_base.dart';

class NavOptionBaseScreen extends StatefulWidget {
  final NavOptionCardBase model;

  NavOptionBaseScreen({this.model});

  @override
  _NavOptionBaseScreenState createState() => _NavOptionBaseScreenState();
}

class _NavOptionBaseScreenState extends State<NavOptionBaseScreen> {
  final List<Item> items = [
    Item(text: 'Correr com o João', state: false),
    Item(text: 'Ler um livro', state: false),
    Item(text: 'Ligar para Filha', state: true),
    Item(text: 'Jogar Minecraft', state: true)
  ];

  final checkBoxState = false;

  @override
  Widget build(BuildContext context) {
    final NavOptionCardBase model = widget.model;

    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
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
          ),
          Container(
            decoration: BoxDecoration(color: Colors.transparent),
            width: constraints.maxWidth,
            height: constraints.maxHeight * .75,
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                final item = items[index];
                return itemList(constraints, model, item);
              },
            ),
          )
        ],
      );
    });
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
              width: maxProgressBarWidth / 2)
        ],
      ),
    );
  }

  Container itemList(
      BoxConstraints constraints, NavOptionCardBase model, Item item) {
    var state = item.state;

    final double cardMaxWidth = constraints.maxWidth * .9;
    return Container(
      height: GeneralWidgetSize.cardMaxHight.h,
      width: cardMaxWidth,
      child: Opacity(
        opacity: state == true ? .5 : 1,
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              cardIcon(cardMaxWidth, model),
              cardBody(cardMaxWidth, item.text),
              Spacer(),
              cardCheckBox(cardMaxWidth, model, item.state),
            ],
          ),
        ),
      ),
    );
  }

  Container cardCheckBox(
      double cardMaxWidth, NavOptionCardBase model, bool checkBoxState) {
    var state = checkBoxState;

    return Container(
      height: GeneralWidgetSize.cardMaxHight.h,
      width: cardMaxWidth * .15,
      decoration: BoxDecoration(color: Colors.transparent),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Checkbox(
          onChanged: (bool value) {
            setState(() {
              state = value;
            });
          },
          value: checkBoxState,
          activeColor: model.checkBoxSelected,
        ),
      ),
    );
  }

  Container cardBody(double cardMaxWidth, String text) {
    return Container(
      height: GeneralWidgetSize.cardMaxHight.h,
      width: cardMaxWidth * .6,
      decoration: BoxDecoration(color: Colors.transparent),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: GeneralAppColor.black,
                fontWeight: FontWeight.w700,
                fontFamily: "Montserrat",
                fontStyle: FontStyle.normal,
                fontSize: 15.0.sp),
          ),
        ),
      ),
    );
  }

  Container cardIcon(
    double cardMaxWidth,
    NavOptionCardBase model,
  ) {
    return Container(
      height: GeneralWidgetSize.cardMaxHight.h,
      width: cardMaxWidth * .2,
      decoration: BoxDecoration(color: Colors.transparent),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(32)),
                  color: model.circleColor)),
          Icon(Icons.assignment_sharp)
        ],
      ),
    );
  }
}
