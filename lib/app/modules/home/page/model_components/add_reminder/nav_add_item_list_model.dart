import 'package:flutter/material.dart';
import 'package:memento_app/app/modules/home/page/model_components/add_reminder/body/nav_add_item_body_form.dart';
import 'package:memento_app/app/modules/home/page/model_components/add_reminder/nav_add_item_fab.dart';
import 'package:memento_app/app/modules/home/page/model_components/add_reminder/nav_add_item_top.dart';
import 'package:memento_app/app/modules/home/page/model_components/add_reminder/nav_item_lis_mid.dart';
import 'package:memento_app/constants/general_app_constants.dart';

abstract class AddItemModel extends StatelessWidget {
  final String title;
  final String image;
  final IconData icon;
  final Color appBarColor;

  AddItemModel(this.title, this.image, this.icon, this.appBarColor);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final width = _size.width;
    final height = _size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        color: GeneralAppColor.appBackgroundGray,
        child: Column(
          children: [
            AddItemAppBarWidget(width, height, title, appBarColor, icon),
            AddItemImageWidget(width, height, image),
            AddItemBodyFormWidget(width, height)
          ],
        ),
      ),
      floatingActionButton: AddItemFabWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
