import 'package:flutter/material.dart';
import 'dart:ui';

import '../components/widgets/layouts.dart';



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
        body:  SizedBox(
          width: _size.width,
          height: _size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
                child: Image.asset('assets/images/UB_logo_01.png', width: 225),
              ),
              addVerticalSpace(10.0),
              _buildText('Mobile Programming Class', 25.0),
              addVerticalSpace(10.0),
              _buildDivider(Theme.of(context).primaryColorDark, _size.width),
              addVerticalSpace(10.0),
              _buildText(':: Flutter | Dart Programming ::', 20.0),
              addVerticalSpace(15.0),
              _buildText('Lecturer: \nHabibullah Akbar', 18.0),
              addVerticalSpace(10.0),
              _buildDivider(Theme.of(context).primaryColorDark, _size.width),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Wrap(
                    spacing: 18.0,
                    runSpacing: 18.0,
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.center,
                    children: [
                      buildCardView(context, 'Basic:', 'Layouts, Pages, Transitions'),
                      buildCardView(context, 'Navigation:', 'TabBar, Drawer, BottomNavBar'),
                      buildCardView(context, 'SQLite DB:', 'Basic CRUD Database'),
                      buildCardView(context, 'Firebase DB:', 'Real-time CRUD Database'),
                  ]),
                ),
              ),
          ]),
        ),
      ),
    );
  }
}

Widget _buildDivider(Color color, double size){
  return Divider(
    color: color,
    thickness: 1.5,
    indent: size * 0.09,
    endIndent: size * 0.09,
  );              
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