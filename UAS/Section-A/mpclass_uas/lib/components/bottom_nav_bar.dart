import 'package:flutter/material.dart';
import 'export_widgets.dart';

final screens = [
  HomePage(),
  SwitchPage(),
  NavigationPage(),
  DatabasePage(), 
];

Widget buildBotomNavBar(
  int _index,
  {required Function(int) onTap}
){
  final _items = <Widget>[
    Icon(Icons.home, size: 25,
      color: _index == 0 ? kPrimaryDark 
                         : kPrimaryLight),
    Icon(CupertinoIcons.arrow_right_arrow_left, size: 25,
      color: _index == 1 ? kPrimaryDark 
                         : kPrimaryLight),
    Icon(CupertinoIcons.arrow_swap, size: 25,
      color: _index == 2 ? kPrimaryDark 
                         : kPrimaryLight),
    Icon(CupertinoIcons.layers_fill, size: 25,
      color: _index == 3 ? kPrimaryDark 
                         : kPrimaryLight), 
  ];
  return CurvedNavigationBar(
    items: _items,
    height: 60,
    index: _index,
    animationCurve: Curves.easeInOut,
    animationDuration: Duration(milliseconds: 225),
    color: kPrimaryDark,
    backgroundColor: Colors.transparent,
    buttonBackgroundColor: kPrimaryColor,
    onTap: onTap,
  ); 
}