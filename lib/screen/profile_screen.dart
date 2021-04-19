import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memento_app/screen/register_screen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => RegisterScreen()));
              })
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(color: Colors.redAccent),
        child: LayoutBuilder(builder: (context, constraints) {
          return Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildImage(constraints),
                  buildBody(constraints),
                  Spacer(),
                  buildBottomButton(context, constraints)
                ],
              ),
            ],
          );
        }),
      ),
    );
  }

  Container buildBottomButton(
      BuildContext context, BoxConstraints constraints) {
    return Container(
      width: constraints.maxWidth,
      height: constraints.maxHeight * .1,
      decoration: BoxDecoration(color: Colors.blue),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => RegisterScreen()));
        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: Center(
            child: Text(
              'Adicionar Cuidador(a)',
              style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  Container buildBody(BoxConstraints constraints) {
    return Container(
      width: constraints.maxWidth,
      height: constraints.maxHeight * .4,
      decoration: BoxDecoration(color: Colors.blue),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('José Souze Silva' + ','),
              SizedBox(
                width: 5,
              ),
              Text('65')
            ],
          ),
          Text('Maria Conceição'),
          Text('Rua ABC, n22, Bairro ABC'),
          Text('Vila Real'),
          Text('Portugal'),
        ],
      ),
    );
  }

  Container buildImage(BoxConstraints constraints) {
    return Container(
      width: constraints.maxWidth,
      height: constraints.maxHeight * .4,
      decoration: BoxDecoration(color: Colors.white),
    );
  }
}
