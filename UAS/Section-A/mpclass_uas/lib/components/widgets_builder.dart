import 'package:flutter/material.dart';
import 'export_widgets.dart';


Widget buildBodyBackground(
  Size _size,
  int _flexTop, _flexBottom,
  double _radius,
  bool _left,
{ required Widget topChild,
  required Widget bottomChild }) {
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
    ],
  );
}

Widget buildTextFormField(
  TextEditingController _controller,
  TextInputType _keyType,
  Color _decoColor,
  String _label,
  IconData _icon, 
{ bool isPrefix = false,
  bool autoFocus = false,
  TextCapitalization caps = TextCapitalization.none,
}){
  return Padding (
    padding: EdgeInsets.only(top: 20.0, bottom:10.0),
    child: TextFormField(
      autofocus: autoFocus,
      controller: _controller,
      keyboardType: _keyType,
      textCapitalization: caps,
      style: TextStyle(color: _decoColor),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: _decoColor)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: _decoColor)),
        filled: true,
        fillColor: kPrimaryColor,
        labelText: _label,
        labelStyle: TextStyle(color: _decoColor),
        prefixIcon: isPrefix ? Icon(_icon, color: _decoColor) : null,
        suffixIcon: isPrefix ? null : Icon(_icon, color: _decoColor),
      ),
      // onChanged: (value) {},
    ),
  );
}

AppBar buildAppBar(_title) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    iconTheme: IconThemeData(color: kPrimaryDark),
    title: Text(_title, 
      style: TextStyle(color: kPrimaryDark),),
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