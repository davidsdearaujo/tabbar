import 'package:flutter/material.dart';

class TabbarContent extends StatelessWidget {
  final PageController controller;
  final List<Widget> children;
  final ScrollPhysics? physics;
  final bool isSnnaping;

  const TabbarContent({
    Key? key,
    required this.controller,
    required this.children,
    this.physics,
    this.isSnnaping = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      children: children,
      pageSnapping: isSnnaping,
      physics: physics,
    );
  }
}
