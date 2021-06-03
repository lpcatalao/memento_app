import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:memento_app/app/modules/profile/profile_store.dart';

class AddCaretakerBodyForm extends StatelessWidget {
  final double width;
  final double height;

  AddCaretakerBodyForm(this.width, this.height);

  @override
  Widget build(BuildContext context) {
    final _profile = Modular.get<ProfileStore>();

    final maxHeight = height * .6;
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: width * .8,
                    child: Column(
                      children: [
                        _buildTitle('Nome Completo'),
                        SizedBox(
                          height: maxHeight * .01,
                        ),
                        _buildTextField(
                            context: context,
                            onChanged: _profile.caretaker.setName,
                            type: TextInputType.text),
                        SizedBox(
                          height: maxHeight * .04,
                        ),
                        _buildTitle('Morada'),
                        SizedBox(
                          height: maxHeight * .01,
                        ),
                        _buildTextField(
                            context: context,
                            onChanged: _profile.caretaker.setAddress,
                            type: TextInputType.streetAddress),
                        SizedBox(
                          height: maxHeight * .04,
                        ),
                        _buildTitle('Cidade'),
                        SizedBox(
                          height: maxHeight * .01,
                        ),
                        _buildTextField(
                            context: context,
                            onChanged: _profile.caretaker.setCity,
                            type: TextInputType.streetAddress),
                        SizedBox(
                          height: maxHeight * .04,
                        ),
                        _buildTitle('Telefone'),
                        SizedBox(
                          height: maxHeight * .04,
                        ),
                        _buildTextField(
                            context: context,
                            onChanged: _profile.caretaker.setPhone,
                            type: TextInputType.phone),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text('${title}:',
            style: const TextStyle(
                color: const Color(0xff000000),
                fontWeight: FontWeight.w700,
                fontFamily: "Poppins",
                fontStyle: FontStyle.normal,
                fontSize: 14.0),
            textAlign: TextAlign.left),
      ),
    );
  }

  Widget _buildTextField(
      {BuildContext context, onChanged, TextInputType type}) {
    return Theme(
      data: Theme.of(context).copyWith(splashColor: Colors.transparent),
      child: TextField(
        keyboardType: type,
        inputFormatters: [LengthLimitingTextInputFormatter(25)],
        onChanged: onChanged,
        autofocus: false,
        style: TextStyle(fontSize: 16.0, color: Colors.black),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(25.7),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(25.7),
          ),
        ),
      ),
    );
  }
}
