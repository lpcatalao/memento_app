import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memento_app/utilities/datetime_formatter.dart';

//TODO adicionar o resultado dos dados para dentro do banco de dados interno
//TODO botao para Navigator.pop uma vez que o utilizador não quiser adcionar nada

class AddActivityScreen extends StatefulWidget {
  @override
  _AddActivityScreenState createState() => _AddActivityScreenState();
}

class _AddActivityScreenState extends State<AddActivityScreen> {
  //TODO logica de pegar _dateTime e _timeOfDay passar para a arquitetura BLoC
  DateTime _dateTime;
  TimeOfDay _timeOfDay =
      TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildImage(_size),
            buildBody(context, _size),
          ],
        ),
      ),
    );
  }

  Padding buildBody(BuildContext context, Size _size) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Container(
        height: _size.height * .6,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textFieldBuilder(),
            rowDateAndTimePicker(context),
            Expanded(
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: buildDoneButton(context, _size)),
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector buildDoneButton(BuildContext context, Size _size) {
    final _orientation = MediaQuery.of(context).orientation;

    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        height: _orientation == Orientation.portrait
            ? _size.height * .14
            : _size.height * .23,
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.blue),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 40.0),
          child: Center(
            child: Text(
              'Concluir',
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  Container buildImage(Size _size) {
    return Container(
      height: _size.height * .4,
      width: double.infinity,
      color: Colors.red,
      child: Center(child: Text('Imagem Aqui')),
    );
  }

  Row rowDateAndTimePicker(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [buildDatePicker(context), buildTimePicker(context)],
    );
  }

  GestureDetector buildTimePicker(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showTimePicker(context: context, initialTime: _timeOfDay).then((time) {
          setState(() {
            if (time != null) {
              _timeOfDay = time;
            }
          });
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Container(
          width: MediaQuery.of(context).size.width / 3,
          decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: Colors.grey,
                width: 1.h,
              ),
              borderRadius: BorderRadius.circular(4)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.access_time,
                  color: Colors.blueGrey,
                ),
                Text(formatHour(_timeOfDay),
                    style: TextStyle(fontSize: 24.sp, color: Colors.blueGrey))
              ],
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector buildDatePicker(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2021),
                lastDate: DateTime(2099))
            .then((date) {
          //TODO mudar o tipo de arquitetura para BLoC
          setState(() {
            _dateTime = date;
          });
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: Colors.grey,
                width: 1.h,
              ),
              borderRadius: BorderRadius.circular(4)),
          width: MediaQuery.of(context).size.width / 2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.calendar_today,
                  color: Colors.blueGrey,
                ),
                Text(
                  formatDate(_dateTime == null ? DateTime.now() : _dateTime),
                  style: TextStyle(fontSize: 24.sp, color: Colors.blueGrey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding textFieldBuilder() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        maxLines: 5,
        scrollPadding: const EdgeInsets.only(bottom: 32.0),
        decoration: InputDecoration(
          hintText: 'Caminha com o João na Praça.',
          labelText: 'Atividade',
          border: OutlineInputBorder(),
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
