import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';

import 'components/routes/drawernav.dart';
import 'pages/basicnavdemo.dart';
import 'pages/sqlitedemo.dart';
import 'pages/firebasedemo.dart';



class HomeScreen extends StatefulWidget {
  final int idx;
  const HomeScreen({required this.idx});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int _currentIndex;
  
  @override
  void initState() {
    super.initState();

    _currentIndex = (widget.idx > 0) ? widget.idx : 0;

    // Firebase.initializeApp().whenComplete(() { 
    //   // print("completed");
    //   setState(() {});
    // });
  } 

    final _screens = [
    TabBarDemo(),
    ContactView(),
    FirebaseRTDemo(),
  ];

  String title(int _idx){
    List<String> _tittle = [
      'Basic Layout & Navigation Demo',
      'SQLite Database CRUD Demo',
      'Firebase Realtime DB CRUD Demo'
    ];
    return ((_idx >= 0) ? _tittle[_idx] : _tittle[0]);
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          titleSpacing: 1.0,
          titleTextStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          title: Text(title(_currentIndex)),
          backgroundColor: Color.fromRGBO(133, 23, 26, 1.0)),
        body: IndexedStack(
          index: _currentIndex,
          children: _screens,
        ), 
        bottomNavigationBar: BottomNavigationBar(
          elevation: 10.0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color.fromRGBO(133, 23, 26, 1.0),
          // selectedItemColor: Color.fromRGBO(234, 243, 172, 1.0),
          selectedItemColor: Colors.white,
          unselectedItemColor: Theme.of(context).primaryColorLight,
          iconSize: 25,
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              tooltip: title(0), 
              label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.people), 
              tooltip: title(1), 
              label: 'SQLite'),
            BottomNavigationBarItem(
              icon: Icon(Icons.person), 
              tooltip: title(2), 
              label: 'Firebase'),
          ],
        ),
      ),
    );
  }
}
