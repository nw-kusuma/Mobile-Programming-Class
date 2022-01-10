import 'package:flutter/material.dart';



class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        _createHeader(),
        _createDrawerItem(
          icon: Icons.home, 
          text: 'Home - Layout & Navigation Demo',
          onTap: () => Navigator.of(context).pushNamed('/home'),
        ),
        Divider(color: Colors.pink[900]),
        _createDrawerItem(
          icon: Icons.people, 
          text: 'SQlite Basic DB CRUD Demo',
          onTap: () => Navigator.of(context).pushNamed('/sqlite', arguments: 1),
        ),
        Divider(color: Colors.pink[900]),
         _createDrawerItem(
          icon: Icons.person, 
          text: 'Firebase Realtime DB CRUD Demo',
          onTap: () => Navigator.of(context).pushNamed('/firebase', arguments: 2),
        ),
        Divider(color: Colors.pink[900]),
       _createDrawerItem(
          icon: Icons.video_library, 
          text: 'Splash screen',
          onTap: () => Navigator.of(context).pushNamed('/'),
        ),
        Divider(color: Colors.pink[900]),
      ],
    ),
  );
}

Widget _createHeader() {
  return DrawerHeader(
    margin: EdgeInsets.zero,
    padding: EdgeInsets.only(top: 8.0),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [ Color.fromRGBO(133, 23, 26, 0.9),
                  Color.fromRGBO(234, 144, 45, 1.0),
                  Color.fromRGBO(254, 243, 172, 1.0) ],
        begin: Alignment.bottomCenter,
        end: Alignment.topLeft,
        stops: const [0.2, 0.7, 0.9],
      ),
      image: DecorationImage(
        fit: BoxFit.scaleDown,
        alignment: Alignment.topCenter,
        scale: 0.5,
        image:  AssetImage('assets/images/Logo_UB_Samping_(dasar_gelap).png'),
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