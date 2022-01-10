import 'package:flutter/material.dart';



class ClickCounter extends StatefulWidget {
  @override
  State<ClickCounter> createState() => _ClickCounterState();
}

class _ClickCounterState extends State<ClickCounter> 
  with AutomaticKeepAliveClientMixin<ClickCounter>{

  int _counter = 0;
  void _incrementCounter() => setState(() => _counter++);
  void _resetCount() => setState(() => _counter = 0);

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() => super.initState();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(254, 243, 172, 1.0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have clicked the button \nthis many times:', 
              style: TextStyle(fontSize: 20), 
              textAlign: TextAlign.center),
            Text('$_counter', 
              style: Theme.of(context).textTheme.headline1),
            TextButton(
              onPressed: _resetCount, 
              child: Text('Reset count', 
                style: TextStyle(
                  fontSize: 18, 
                  color: Colors.blue[900], 
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(133, 23, 26, 1.0),
        heroTag: null,
        onPressed: _incrementCounter,
        tooltip: 'Click Me!',
        child: const Icon(Icons.add),
      ),
    );
  }
}