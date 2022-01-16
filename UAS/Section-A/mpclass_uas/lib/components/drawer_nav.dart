import 'package:flutter/material.dart';

import '../main.dart';
import 'export_widgets.dart';


Widget buildAppDrawer(BuildContext context, Size size) {
  return Drawer(
    backgroundColor: kPrimaryLight,
    child: ListView(
      children: [
        buildDrawerHeader(size),
        buildDrawerItem(
          icon: Icons.home, 
          text: 'Homepage',
          onTap: () => Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (BuildContext context)
                              => MainScreen(0))),
        ),
        Divider(color: kPrimaryColor),
        buildDrawerItem(
          icon: CupertinoIcons.arrow_right_arrow_left, 
          text: 'Switch-page',
          onTap: () => Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (BuildContext context)
                              => MainScreen(1))),
        ),
        Divider(color: kPrimaryColor),
        buildDrawerItem(
          icon: CupertinoIcons.arrow_swap, 
          text: 'Navigation-page',
          onTap: () => Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (BuildContext context)
                              => MainScreen(2))),
        ),
        Divider(color: kPrimaryColor),
        buildDrawerItem(
          icon: CupertinoIcons.layers_fill, 
          text: 'Database-page',
          onTap: () => Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (BuildContext context)
                              => MainScreen(3))),
        ),
        Divider(color: kPrimaryColor),
    ],),
  );
}

Widget buildDrawerHeader(Size size) {
  return DrawerHeader(
    margin: EdgeInsets.zero,
    padding: EdgeInsets.only(top: 8.0),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [ kPrimaryLight,
                  kPrimaryColor,
                  kPrimaryDark ],
        begin: Alignment.bottomCenter,
        end: Alignment.topLeft,
        stops: const [0.4, 0.7, 0.9]
    ),),
    child: FittedBox(
      fit: BoxFit.scaleDown,
      child: Image.asset("assets/images/Logo_UB_Samping.png",
        width: size.width * 0.90),
    ),
  );
}

Widget buildDrawerItem({ 
  IconData? icon,  
  String? text,  
  GestureTapCallback? onTap,
}){
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon, color: kPrimaryDark),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(text!),
        )
      ],
    ),
    onTap: onTap,
  );
}