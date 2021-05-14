import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memento_app/constants/general_app_constants.dart';

class ProfileAppbarPhoto extends StatelessWidget {
  final double width;
  final double height;

  ProfileAppbarPhoto(this.width, this.height);

  @override
  Widget build(BuildContext context) {
    // os dois são hight multiplicados por 20% do tamanho total da screen
    // para poder fazer um quadro de lados iguais.
    return Container(
      width: height * .4,
      height: height * .4,
      child: Stack(
        children: [_buildPhoto(), _buildAddPhotoIcon()],
      ),
    );
  }

  Align _buildAddPhotoIcon() {
    return Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(36)),
            ),
            width: 50,
            height: 50,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.add_a_photo),
              color: Colors.white,
            ),
          ),
        ));
  }

  Widget _buildPhoto() {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          gradient: LinearGradient(
              begin: Alignment(1, 0),
              end: Alignment(0, 0.61),
              colors: [
                GeneralAppColor.customAppBar1,
                GeneralAppColor.customAppBar2
              ]),
          borderRadius: BorderRadius.all(Radius.circular(500)),
          color: Colors.white54,
        image: DecorationImage(image: AssetImage('images/profile_sample.png'))
      ),
    );
  }
}
