import 'package:flutter/widgets.dart';

class TabbarController extends PageController{
final double initialOffset;

  TabbarController(this.initialOffset);
  @override
  double get offset => positions.isEmpty ? initialOffset : position.pixels;
}