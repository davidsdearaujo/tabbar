import 'package:flutter/widgets.dart';

extension TabbarPageControllerExtension on PageController {
  @override
  double get page => positions.isEmpty ? 0 : page;

  bool get isInitialized => positions.isNotEmpty;
  bool get isNotInitialized => positions.isEmpty;
}
