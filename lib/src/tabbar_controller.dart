import 'package:flutter/widgets.dart';

class TabbarController extends PageController {
  TabbarController();
  factory TabbarController.fromPageController(PageController controller) {
    return controller;
  }

  @override
  double get page => positions.isEmpty ? 0 : page;

  bool get isInitialized => positions.isNotEmpty;
  bool get isNotInitialized => positions.isEmpty;
}
