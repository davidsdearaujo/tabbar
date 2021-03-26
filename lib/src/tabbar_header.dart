import 'package:flutter/material.dart';
import 'page_controller_tabbar_extension.dart';

import 'tabbar_indicator.dart';

class TabbarHeader extends StatelessWidget {
  final PageController controller;
  final List<Tab> tabs;
  final Color? indicatorColor;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const TabbarHeader({
    Key? key,
    required this.controller,
    required this.tabs,
    this.backgroundColor,
    this.indicatorColor,
    this.foregroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconTheme(
      data: Theme.of(context).iconTheme.copyWith(
          color: foregroundColor ?? Theme.of(context).primaryIconTheme.color),
      child: DefaultTextStyle(
        style: Theme.of(context).textTheme.bodyText2!.copyWith(
            color: foregroundColor ?? Theme.of(context).primaryIconTheme.color),
        child: Container(
          color: backgroundColor ?? Theme.of(context).primaryColor,
          child: Column(
            children: <Widget>[
              Row(
                children: tabs
                    .map((item) => Expanded(
                          child: InkWell(
                            child: item,
                            onTap: () {
                              if (controller.isInitialized)
                                controller.animateToPage(
                                  tabs.indexOf(item),
                                  // tabs.indexWhere((tab) => tab.text == item.text),
                                  curve: Curves.easeInOut,
                                  duration: Duration(milliseconds: 500),
                                );
                            },
                          ),
                        ))
                    .toList(),
                mainAxisSize: MainAxisSize.min,
              ),
              TabbarIndicator(
                controller: controller,
                color: indicatorColor,
                tabs: tabs,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
