import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:memento_app/app/modules/profile/profile_store.dart';
import 'package:memento_app/shared/model/user_model.dart';
import 'package:mobx/mobx.dart';

class ProfileAppBarBottom extends StatelessWidget {
  final double width;
  final double height;

  final _profile = Modular.get<ProfileStore>();

  ProfileAppBarBottom(this.width, this.height);

  @override
  Widget build(BuildContext context) {
    final bottomHeight = height * .12;
    return Container(
      width: width * .8,
      height: bottomHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Observer(
            builder: (BuildContext context) {
              if (_profile.users.status == FutureStatus.fulfilled) {
                List<User> users = _profile.users.value;
                if (users.length == 0) {
                  return _buildAge(bottomHeight, 'Idade');
                } else {
                  _profile.setAge(users[0].birthDate);
                  return _buildAge(bottomHeight, _profile.age.toString());
                }
              }
              return _buildAge(bottomHeight, '${65}');
            },
          ),
          Observer(
            builder: (BuildContext context) {
              if (_profile.users.status == FutureStatus.fulfilled) {
                List<User> users = _profile.users.value;
                if (users.length == 0) {
                  return _buildAddress("Sua Morada");
                } else {
                  return _buildAddress(users[0].address);
                }
              }
              return _buildAddress("Sua Morada");
            },
          ),
        ],
      ),
    );
  }

  Column _buildAddress(String address) {
    return Column(
      children: [
        buildBottomTitle('Cidade/Morada'),
        Container(
          width: 180,
          child: Text("${address}",
              style: const TextStyle(
                  color: const Color(0xff000000),
                  fontWeight: FontWeight.w400,
                  fontFamily: "Poppins",
                  fontStyle: FontStyle.normal,
                  fontSize: 14.0),
              textAlign: TextAlign.left),
        )
      ],
    );
  }

  Widget buildBottomTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        child: Text(title,
            style: const TextStyle(
                color: const Color(0xffffffff),
                fontWeight: FontWeight.w700,
                fontFamily: "Poppins",
                fontStyle: FontStyle.normal,
                fontSize: 14.0),
            textAlign: TextAlign.left),
      ),
    );
  }

  Column _buildAge(double bottomHeight, String age) {
    return Column(
      children: [
        buildBottomTitle('Idade'),
        buildTitleContent(bottomHeight, age)
      ],
    );
  }

  Container buildTitleContent(double bottomHeight, String age) {
    return Container(
      width: 100,
      height: bottomHeight * .6,
      child: Center(
          child: Text(
        age,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      )),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(21)),
          color: const Color(0xffffffff)),
    );
  }
}
