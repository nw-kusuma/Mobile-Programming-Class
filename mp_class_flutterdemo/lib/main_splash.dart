import 'package:flutter/material.dart';
import 'dart:async';



class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> 
  with SingleTickerProviderStateMixin {
  
  var _visible = true;
  late AnimationController _animationController;
  late Animation<double> _animation;

  startTime() async {
    var _duration = Duration(seconds: 2);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() => Navigator.of(context).pushNamed('/home');

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this, 
      duration: Duration(seconds: 10),
    );
    
    _animation = CurvedAnimation(
      parent: _animationController, 
      curve: Curves.easeOut,
    );

    _animation.addListener(() => setState(() {}));
    _animationController.forward();

    setState(() => _visible = !_visible);
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 30.0),
                child: Image.asset('assets/images/UB_SI_logo.png',
                  height: 25.0,
                  fit: BoxFit.scaleDown,
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/UB_logo_01.png',
                width: _animation.value * 250,
                height: _animation.value * 250,
              ),
            ],
          ),
        ],
      ),
    );
  }
}