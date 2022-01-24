import 'package:flutter/material.dart';
import '../export_packages.dart';
import '../export_widgets.dart';

class AppBottomBar 
  extends StatefulWidget {
    final int index;
    final Function(int) onTap;
  const AppBottomBar(this.index, { required this.onTap });

  @override
  _AppBottomBarState createState() 
      => _AppBottomBarState();
}

class _AppBottomBarState 
  extends State<AppBottomBar> {
    
  @override
  Widget build(BuildContext context) {
    final _items = <Widget>[
      Icon(Icons.home, size: 25,
        color: widget.index == 0 
                            ? kPrimaryDark 
                            : kPrimaryLight),
      Icon(CupertinoIcons.arrow_right_arrow_left, size: 25,
        color: widget.index == 1 
                            ? kPrimaryDark 
                            : kPrimaryLight),
      Icon(CupertinoIcons.arrow_swap, size: 25,
        color: widget.index == 2 
                            ? kPrimaryDark 
                            : kPrimaryLight),
      Icon(CupertinoIcons.layers_fill, size: 25,
        color: widget.index == 3 
                            ? kPrimaryDark 
                            : kPrimaryLight), 
    ];
    return CurvedNavigationBar(
      items: _items,
      height: 60,
      index: widget.index,
      animationCurve: Curves.easeInOut,
      animationDuration: Duration(milliseconds: 225),
      color: kPrimaryDark,
      backgroundColor: Colors.transparent,
      buttonBackgroundColor: kPrimaryColor,
      onTap: widget.onTap,
    );
  }
}