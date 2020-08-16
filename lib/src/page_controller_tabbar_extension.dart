import 'package:flutter/widgets.dart';

extension TabbarPageControllerExtension on PageController {
  double get page => positions.isEmpty ? 0 : page;

  bool get isInitialized => positions.isNotEmpty;
  bool get isNotInitialized => positions.isEmpty;
}
