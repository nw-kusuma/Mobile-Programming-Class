import 'package:flutter/material.dart';
import 'dart:ui';



class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        _createHeader(),
        _createDrawerItem(
          icon: Icons.home, 
          text: 'Home',
          onTap: () => Navigator.of(context).pushNamed('/home'),
        ),
        Divider(color: Colors.pink[900]),
        _createDrawerItem(
          icon: Icons.wb_cloudy, 
          text: 'TabBar Widget Demo',
          onTap: () => Navigator.of(context).pushNamed('/tabdemo', arguments: 1),
        ),
        Divider(color: Colors.pink[900]),
        _createDrawerItem(
          icon: Icons.people, 
          text: 'Contact Form Demo',
          onTap: () => Navigator.of(context).pushNamed('/ccdemo', arguments: 2),
        ),
        Divider(color: Colors.pink[900]),
         _createDrawerItem(
          icon: Icons.person, 
          text: 'Firebase Real-time Demo',
          onTap: () => Navigator.of(context).pushNamed('/firebase', arguments: 3),
        ),
        Divider(color: Colors.pink[900]),
       // _createDrawerItem(
        //   icon: Icons.perm_identity, 
        //   text: 'BMI Calculator Demo',
        //   onTap: () => Navigator.of(context).pushNamed('/bmi', arguments: 3),
        // ),
        // Divider(color: Colors.pink[900]),
      ],
    ),
  );
}

Widget _createHeader() {
  return DrawerHeader(
    margin: EdgeInsets.zero,
    padding: EdgeInsets.zero,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.orange, Colors.orangeAccent],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      image: DecorationImage(
        fit: BoxFit.scaleDown,
        scale: 0.5,
        image:  AssetImage('assets/images/UB_logo_02.png'),
      ),
    ),
    child: Stack(
      children: <Widget>[
        Positioned(
          bottom: 12.0,
          left: 16.0,
          child: Text("Flutter Drawer Demo",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _createDrawerItem({ 
  IconData? icon,  
  String? text,  
  GestureTapCallback? onTap,
}){
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(text!),
        )
      ],
    ),
    onTap: onTap,
  );
}