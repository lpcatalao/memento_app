import 'package:flutter/material.dart';
import 'package:memento_app/app/modules/home/page/dashboard/body/dashboard_body_card.dart';
import 'package:memento_app/constants/general_app_constants.dart';
import 'package:memento_app/models/activity_model.dart';
import 'package:memento_app/models/brain_fitness_model.dart';
import 'package:memento_app/models/medicine_model.dart';
import 'package:memento_app/shared/model/dashboard_pageview_item.dart';

class DashboardBodyItemWidget extends StatelessWidget {
  final DashboardPageViewItem _pageViewItem;

  DashboardBodyItemWidget(this._pageViewItem);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _pageViewItem.width,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Meta do ${_pageViewItem.period}',
              style: TextStyle(
                  color: GeneralAppColor.dashboardTitleBrown,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            DashboardBodyCardItemWidget(
                BrainFitnessCardModel(taskStatus: _pageViewItem.status[0]),
                _pageViewItem.constraints),
            DashboardBodyCardItemWidget(
                ActivityCardModel(taskStatus: _pageViewItem.status[1]),
                _pageViewItem.constraints),
            DashboardBodyCardItemWidget(
                MedicineCardModel(taskStatus: _pageViewItem.status[2]),
                _pageViewItem.constraints),
          ],
        ),
      ),
    );
  }

  Widget dayWeekMonth() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 21.0),
      child: Container(
          width: _pageViewItem.constraints.maxWidth * .8,
          height: 34,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(46)),
              color: const Color(0xff292929))),
    );
  }
}
