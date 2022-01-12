import 'package:flutter/material.dart';
import 'export_widgets.dart';


Widget buildBodyBackground(
  Size _size,
  int _flexTop, _flexBottom,
{ required Widget topChild,
  required Widget bottomChild }) {
  return Column(
    children: <Widget>[
      Expanded(flex: _flexTop,
        child: Container(
          color: kPrimaryDark,
          child: Container(width: _size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(60)),
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
                end: Alignment.topLeft,
                stops: const [0.1, 0.6, 0.9]),
              borderRadius: BorderRadius.only(topRight: Radius.circular(60)),
            ),
            child: bottomChild,
      ),),),
    ],
  );
}

Text buildTitleText(
  String _text, 
  double _size,
{ Color color = Colors.white }) { 
  return Text(_text, 
    style: TextStyle(
      color: color, 
      fontSize: _size, 
      fontWeight: FontWeight.w700),
    textAlign: TextAlign.center,
  );
}

Row buildSubtitleRow(
  String _text, 
  double _size,
{ Color color = Colors.white }) { 
  return Row(
    children: <Widget>[
      Expanded(child: Container(height: 1.0, color: color)),
      Padding(
        padding: EdgeInsets.symmetric(horizontal:10.0),
        child: Text(_text, 
          style: TextStyle(
            color: color, 
            fontSize: _size, 
            fontWeight: FontWeight.w500,
      ),),),
      Expanded(child: Container(height: 1.0, color: color)),
    ],
  );
}