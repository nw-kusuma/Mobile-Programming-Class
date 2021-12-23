import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/screens/bmicalculator.dart';
import '../components/screens/clickcounter.dart';



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
    final Color _colorLight = Color.fromRGBO(234, 243, 172, 1.0);
    final Color _colorDark = Color.fromRGBO(234, 144, 45, 1.0);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              height: 55,
              color: _colorDark,
              child: TabBar(
                labelColor: Theme.of(context).primaryColorDark,
                unselectedLabelColor: _colorLight,
                padding: EdgeInsets.only(
                  top: 10.0, 
                  left: 5.0, 
                  right: 5.0, 
                  bottom: 8.0,
                ),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  color: _colorLight,
                ),
                tabs: <Widget>[
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(Icons.call_to_action_outlined),
                        SizedBox(width: 8.0),
                        Text('Click Counter', textScaleFactor: 1.25)
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(Icons.calculate_outlined),
                        SizedBox(width: 8.0),
                        Text('BMI Calculator', textScaleFactor: 1.25)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(flex: 2,
              child: TabBarView(
                children: <Widget>[
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