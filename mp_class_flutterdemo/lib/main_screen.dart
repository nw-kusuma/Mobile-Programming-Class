import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';

import 'components/widgets/drawernav.dart';
import 'pages/homepage.dart';
import 'pages/tabbardemo.dart';
import 'pages/contactview.dart';
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
    HomePage(),
    TabBarDemo(),
    ContactView(),
    FirebaseRTDemo(),
  ];

  String title(int _idx){
    List<String> _tittle = [
      'Flutter Basic Demo',
      'TabBar Navigation Demo',
      'SQLiteDB CRUD Demo',
      'Firebase Real-time Demo'
    ];
    return ((_idx >= 0) ? _tittle[_idx] : _tittle[0]);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(title: Text(title(_currentIndex))),
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ), 
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10.0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).primaryColor,
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
            icon: Icon(Icons.calculate), 
            tooltip: title(1), 
            label: 'Counter'),
          BottomNavigationBarItem(
            icon: Icon(Icons.people), 
            tooltip: title(2), 
            label: 'Contact'),
          BottomNavigationBarItem(
            icon: Icon(Icons.person), 
            tooltip: title(3), 
            label: 'Firebase'),
        ],
      ),
    );
  }
}
