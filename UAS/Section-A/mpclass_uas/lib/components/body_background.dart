import 'package:flutter/material.dart';
import '../export_widgets.dart';

class AppBodyBackground 
  extends StatelessWidget {
    final int _flexTop, _flexBottom;
    final double _radius;
    final bool _left;
    final Widget topChild, bottomChild;
  const AppBodyBackground(
    this._flexTop, 
    this._flexBottom, 
    this._radius, 
    this._left,
  { required this.topChild, required this.bottomChild});

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Expanded(flex: _flexTop,
          child: Container(
            color: kPrimaryDark,
            child: Container(width: _size.width,
              decoration: BoxDecoration(
                borderRadius: 
                  _left ? BorderRadius.only(bottomLeft: Radius.circular(_radius))
                        : BorderRadius.only(bottomRight: Radius.circular(_radius)),
                color: kPrimaryLight,
              ),
              child: topChild,
        ),),),
        Expanded(flex: _flexBottom,
          child: Container(
            color: kPrimaryLight,
            child: Container(width: _size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [ kPrimaryLight,
                            kPrimaryColor,
                            kPrimaryDark ],
                  begin: Alignment.bottomCenter,
                  end: _left ? Alignment.topLeft : Alignment.topRight,
                  stops: const [0.1, 0.6, 0.9]),
                borderRadius: 
                  _left ? BorderRadius.only(topRight: Radius.circular(_radius))
                        : BorderRadius.only(topLeft: Radius.circular(_radius)),
              ),
              child: bottomChild,
        ),),),
    ],);
  }
}