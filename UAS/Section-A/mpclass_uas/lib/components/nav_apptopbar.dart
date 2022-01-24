import 'package:flutter/material.dart';
import '../export_widgets.dart';

class AppTopBar 
  extends AppBar{
    final String titleText;
    final List<Widget>? action;
    final bool showBack, hasAction;

  AppTopBar({
    this.titleText = '', 
    this.showBack = false, 
    this.hasAction = false,
    this.action 
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
    );
  }
}