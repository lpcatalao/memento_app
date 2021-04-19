import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memento_app/blocs/nav_bloc.dart';
import 'package:memento_app/repository/nav_screen_state_repository.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();

    final _size = MediaQuery.of(context).size;
    return Container(
      color: Colors.yellow,
      width: _size.width,
      height: _size.height,
      child: LayoutBuilder(builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight * .5;
        return Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(15))),
              width: width,
              height: height,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.red,
                      width: width * .8,
                      height: height / 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Olá José',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Bem vindo, você já olhou as suas fotos antigas hoje?',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.orange,
                      width: width,
                      height: height / 3,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          horizontalList(1, Colors.white),
                          horizontalList(2, Colors.red),
                          horizontalList(3, Colors.blue),
                          horizontalList(4, Colors.greenAccent),
                          horizontalList(5, Colors.pink)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.green,
              width: width,
              height: height,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Container(
                    height: 100,
                    color: Colors.white,
                    child: Text('Conteudo 1'),
                  ),
                  Container(
                      height: 100,
                      color: Colors.red,
                      child: Text('Conteudo 2')),
                  Container(
                      height: 100,
                      color: Colors.blue,
                      child: Text('Conteudo 3')),
                  Container(
                      height: 100,
                      color: Colors.greenAccent,
                      child: Text('Conteudo 4')),
                  Container(
                      height: 100,
                      width: 100,
                      color: Colors.pink,
                      child: Text('Conteudo 5')),
                ],
              ),
            )
          ],
        );
      }),
    );
  }

  Padding horizontalList(int index, Color color) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.all(Radius.circular(12))),
        width: 100,
        child: Text('Conteudo ${index}'),
      ),
    );
  }
}
