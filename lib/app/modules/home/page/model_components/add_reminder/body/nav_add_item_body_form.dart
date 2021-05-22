import 'package:flutter/material.dart';
import 'package:memento_app/app/modules/home/page/model_components/add_reminder/body/nav_add_item_calendar.dart';
import 'package:memento_app/app/modules/home/page/model_components/add_reminder/body/nav_add_item_time.dart';
import 'package:memento_app/constants/memento_icons.dart';

class AddItemBodyFormWidget extends StatelessWidget {
  final double width;
  final double height;

  AddItemBodyFormWidget(this.width, this.height);

  @override
  Widget build(BuildContext context) {
    final maxWidth = width * .85;
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        width: maxWidth,
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildTitle('Título'),
              SizedBox(height: height * .01),
              // _buildTitleContent(),
              //TODO alterar para que se for medicine screen utilizar o autocomplete, se nao utilizar o buil titleContet
              MedicineAutoComplete(),
              SizedBox(height: height * .01),
              _buildLimitText(0, 200),
              SizedBox(height: height * .03),
              _buildTitle('Data'),
              SizedBox(height: height * .01),
              NavAddItemCalendar(),
              SizedBox(height: height * .01),
              _buildTitle('Hora'),
              SizedBox(height: height * .01),
              NavAddItemTime()
            ],
          ),
        ),
      ),
    ));
  }

  Padding _buildLimitText(int completed, int total) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: Text('${completed}/${total}',
            style: const TextStyle(
                color: const Color(0xff000000),
                fontWeight: FontWeight.w700,
                fontFamily: "Montserrat",
                fontStyle: FontStyle.normal,
                fontSize: 16.0),
            textAlign: TextAlign.left),
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(title,
            style: const TextStyle(
                color: const Color(0xff000000),
                fontWeight: FontWeight.w700,
                fontFamily: "Montserrat",
                fontStyle: FontStyle.normal,
                fontSize: 16.0),
            textAlign: TextAlign.left),
      ),
    );
  }

  TextField _buildTitleContent() {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        prefixIcon: Icon(MementoIcons.iconmapdoctor, color: Colors.black),
        hintText: "Medicamento para a tensão alta",
        labelText: "Medicamento",
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
    );
  }
}

class MedicineAutoComplete extends StatelessWidget {
  const MedicineAutoComplete({Key key}) : super(key: key);

  static const List<String> _kOptions = <String>[
    'anticolinesterásicos',
    'memantina',
    'antipsicótico',
    'ansiolítico',
    'antidepressivos',
  ];

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        return _kOptions.where((String option) {
          return option.contains(textEditingValue.text.toLowerCase());
        });
      },
      onSelected: (String selection) {
        print('You just selected $selection');
      },
    );
  }
}
