import 'dart:math';

import 'package:flutter/material.dart';
import 'package:memento_app/app/modules/home/page/dashboard/body/dashboard_pageview_item_widget.dart';
import 'package:memento_app/shared/model/dashboard_pageview_item.dart';

class DashboardPageViewWidget extends StatefulWidget {
  List<DashboardPageViewItem> pageViewItems;

  DashboardPageViewWidget(this.pageViewItems);

  @override
  _DashboardPageViewWidgetState createState() =>
      _DashboardPageViewWidgetState();
}

class _DashboardPageViewWidgetState extends State<DashboardPageViewWidget> {
  PageController _pageController;
  double viewportFraction = 0.9;
  double pageOffset = 0;

  @override
  void initState() {
    super.initState();
    _pageController =
        PageController(initialPage: 0, viewportFraction: viewportFraction);
    _pageController.addListener(() {
      setState(() {
        pageOffset = _pageController.page;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      itemCount: widget.pageViewItems.length,
      itemBuilder: (context, index) {
        DashboardPageViewItem pgi = widget.pageViewItems[index];
        double scale = max(viewportFraction,
            (1 - (pageOffset - index).abs()) + viewportFraction);
        return Padding(
          padding: EdgeInsets.only(
              right: 15,
              top: (MediaQuery.of(context).size.width * .05) - scale * 11),
          child: Container(
            child: DashboardBodyItemWidget(pgi),
            width: MediaQuery.of(context).size.width,
          ),
        );
      },
    );
  }
}
