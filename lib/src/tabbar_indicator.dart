import 'package:flutter/material.dart';
import 'page_controller_tabbar_extension.dart';

class TabbarIndicator extends StatefulWidget {
  final PageController controller;
  final List<Tab> tabs;
  final Color? color;

  const TabbarIndicator({
    Key? key,
    required this.controller,
    required this.tabs,
    this.color,
  }) : super(key: key);

  @override
  _TabbarIndicatorState createState() => _TabbarIndicatorState();
}

class _TabbarIndicatorState extends State<TabbarIndicator> {
  var containerKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((duration) {
      setState(() {
        contentWidth = containerKey.currentContext?.size?.width ??
            MediaQuery.of(context).size.width;
      });
    });
  }

  double contentWidth = 100;

  double get padding {
    if (widget.controller.isNotInitialized)
      return 1;
    else {
      var response = (widget.controller.offset) *
          (contentWidth - barWidth) /
          (widget.controller.position.maxScrollExtent);

      if (response <= 0 || response.isNaN) {
        return 0;
      } else if (widget.controller.offset >
          widget.controller.position.maxScrollExtent) {
        return widget.controller.position.maxScrollExtent *
            (contentWidth - barWidth) /
            widget.controller.position.maxScrollExtent;
      }
      return response;
    }
  }

  double get barWidth => contentWidth / widget.tabs.length;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, snapshot) {
        return Container(
          key: containerKey,
          width: double.infinity,
          height: 2,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: padding),
                color: widget.color ?? Theme.of(context).primaryIconTheme.color,
                width: barWidth,
                height: 2,
              ),
            ],
          ),
        );
      },
    );
  }
}
