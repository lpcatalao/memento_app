import 'package:flutter/material.dart';
import 'package:memento_app/constants/general_app_constants.dart';
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
            Padding(
              padding: EdgeInsets.only(
                  top: _pageViewItem.height * .05,
                  bottom: _pageViewItem.height * .05),
              child: Text(
                'Meta ${_pageViewItem.period}',
                style: TextStyle(
                    color: GeneralAppColor.dashboardTitleBrown,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            // DashboardBodyCardItemWidget(
            //     BrainFitnessListWidget(), _pageViewItem.width),
            // DashboardBodyCardItemWidget(
            //     ActivityListWidget(), _pageViewItem.width),
            // DashboardBodyCardItemWidget(
            //     MedicineListWidget(), _pageViewItem.width),
          ],
        ),
      ),
    );
  }
}
