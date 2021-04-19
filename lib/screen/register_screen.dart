import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:memento_app/screen/nav_controller.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: ElevatedButton(
        onPressed: () {
          // push
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Nav()));
        },
        child: Text('Concluir'),
      ),
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                    labelText: 'Nome',
                    border: OutlineInputBorder(),
                    hintText: 'José'),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                    labelText: 'Sobrenome',
                    border: OutlineInputBorder(),
                    hintText: 'Silva'),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                    labelText: 'Telemóvel',
                    border: OutlineInputBorder(),
                    hintText: '000-000-000'),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
