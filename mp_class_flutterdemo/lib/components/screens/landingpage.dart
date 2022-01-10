import 'package:flutter/material.dart';

import '../widgets/layouts.dart';



class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(254, 243, 172, 1.0),
        body:  SizedBox(
          width: _size.width,
          height: _size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 15.0),
                child: Image.asset('assets/images/Logo_UB.png', width: 225),
              ),
              addVerticalSpace(10.0),
              _buildText('Mobile Programming Class', 25.0),
              addVerticalSpace(10.0),
              addDivider(Theme.of(context).primaryColorDark, _size.width),
              addVerticalSpace(10.0),
              _buildText(':: Flutter | Dart Programming ::', 20.0),
              addVerticalSpace(15.0),
              _buildText('Lecturer: \nHabibullah Akbar', 18.0),
              addVerticalSpace(10.0),
              addDivider(Theme.of(context).primaryColorDark, _size.width),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Wrap(
                    spacing: 15.0,
                    runSpacing: 15.0,
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.center,
                    children: [
                      InkWell(
                        onTap: () => Navigator.of(context).pushNamed('/home'),
                        child: buildCardView(context, 
                          'Basic Layout & Navigation:', 
                          'Classes, Widgets, Routes, Transitions\nTabBar, Drawer, BottomNavBar',
                          width: 320.0,
                          )),
                      InkWell(
                        onTap: () => Navigator.of(context).pushNamed('/sqlite', arguments: 1),
                        child: buildCardView(context, 'SQLite DB:', 'Basic CRUD Database')),
                      InkWell(
                        onTap: () => Navigator.of(context).pushNamed('/firebase', arguments: 2),
                        child: buildCardView(context, 'Firebase DB:', 'Real-time CRUD Database')),
                  ]),
                ),
              ),
          ]),
        ),
      ),
    );
  }
}

Widget _buildText(String text, double size){
  return Text(text,
    textAlign: TextAlign.center, 
    style: TextStyle(
      fontSize: size,
      fontWeight: FontWeight.bold,
    ),
  );
}