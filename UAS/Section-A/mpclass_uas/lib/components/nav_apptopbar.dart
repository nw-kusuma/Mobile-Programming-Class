import 'package:flutter/material.dart';
import '../export_widgets.dart';

class AppTopBar 
  extends AppBar{
    final String titleText;
    final List<Widget>? action;
    final bool showBack, hasAction;
    final TabBar? appTabBar;
    final double tabBarOpacity;

  AppTopBar({
    this.titleText = '', 
    this.showBack = false, 
    this.hasAction = false,
    this.action,
    this.appTabBar,
    this.tabBarOpacity = 0.0, 
  });

  @override
  _AppTopBarState createState() 
      => _AppTopBarState();
}

class _AppTopBarState 
  extends State<AppTopBar> {
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leadingWidth: 25.0,
      leading: widget.showBack 
        ? IconButton(icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop())
        : null,
      actions: widget.hasAction
        ? widget.action!
        : null,
      iconTheme: IconThemeData(color: kPrimaryDark),
      title: Text(widget.titleText, 
        style: TextStyle(color: kPrimaryDark),),
      bottom: widget.appTabBar,
      bottomOpacity: widget.tabBarOpacity,
    );
  }
}