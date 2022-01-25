import 'dart:math';

import 'package:flutter/material.dart';
import '../export_packages.dart';
import '../export_widgets.dart';

const double buttonSize = 55.0;

class AppFABMenu 
  extends StatefulWidget {

  @override
  _AppFABMenuState createState() 
      => _AppFABMenuState();
}

class _AppFABMenuState 
  extends State<AppFABMenu>
  with SingleTickerProviderStateMixin {
    late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: Duration(microseconds: 225),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Flow(
      delegate: FlowMenuDelegate(controller: _controller),
      children: <IconData>[
        Icons.call,
        Icons.mail,
        Icons.sms,
        Icons.notifications,
        CupertinoIcons.chat_bubble_2,
      ].map<Widget>(buildFAB).toList(),
    );
  }

  Widget buildFAB(IconData _icon) {
    return FloatingActionButton(
      heroTag: null,
      backgroundColor: kPrimaryDark,
      elevation: 3.0,
      splashColor: kPrimaryColor,
      child: Icon(_icon, color: kPrimaryLight, size: 30),
      onPressed: (){
        if (_controller.status == AnimationStatus.completed){
          _controller.reverse();
        } else {
          _controller.forward();
        }
      }
    );
  }
}

class FlowMenuDelegate 
  extends FlowDelegate {
    final Animation<double> controller;

  const FlowMenuDelegate({required this.controller})
        : super(repaint: controller);

  @override
  void paintChildren(FlowPaintingContext context) {
    final _size = context.size;
    final _xStart = _size.width - buttonSize;
    final _yStart = _size.height - buttonSize;

    final n = context.childCount;
    for (int i = 0; i < n; i++) {
      final _isLastItem = i == context.childCount - 1;
      setValue(value) => _isLastItem ? 0.0 : value;

      final _radius = 180 * controller.value / 1.5;

      final _theta = i * pi * 0.5 / (n - 2);
      final x = _xStart - setValue(_radius * cos(_theta));
      final y = _yStart - setValue(_radius * sin(_theta));

      context.paintChild(i,
        transform: Matrix4.identity()
          ..translate(x, y, 0)
          ..translate(buttonSize / 2, buttonSize / 2)
          ..rotateZ(_isLastItem ? 0.0 : 180 * (1 - controller.value) * pi / 180)
          ..scale(_isLastItem ? 1.0 : max(controller.value, 0.25))
          ..translate(-buttonSize / 2, -buttonSize / 2),
      );
    }
  }

  @override
  bool shouldRepaint(FlowMenuDelegate oldDelegate) => false;
}