import 'package:flutter/material.dart';

import '../components/widgets/layouts.dart';
import '../components/screens/landingpage.dart';
import '../components/screens/clickcounter.dart';
import '../components/screens/bmicalculator.dart';



class TabBarDemo extends StatefulWidget {
  @override
  State<TabBarDemo> createState() => _TabBarDemoState();
}

class _TabBarDemoState extends State<TabBarDemo>
  with AutomaticKeepAliveClientMixin<TabBarDemo>{
  
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() => super.initState();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final Color _colorLight = Color.fromRGBO(254, 243, 172, 1.0);
    final Color _colorDark = Color.fromRGBO(133, 23, 26, 1.0);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              height: 40,
              color: _colorLight,
              child: TabBar(
                labelColor: _colorLight,
                unselectedLabelColor: _colorDark,
                padding: EdgeInsets.only(
                  top: 5.0, 
                  left: 8.0, 
                  right: 8.0, 
                  bottom: 5.0,
                ),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  color: _colorDark,
                ),
                tabs: <Widget>[
                  buildTab('Home', Icons.home_outlined),
                  buildTab('Counter', Icons.call_to_action_outlined),
                  buildTab('BMI-Calc', Icons.calculate_outlined),
                ],
              ),
            ),
            Expanded(flex: 3,
              child: TabBarView(
                children: <Widget>[
                  Center(
                    child: HomePage()),
                  Center(
                    child: ClickCounter()),
                  Center(
                    child: BMIPage()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}