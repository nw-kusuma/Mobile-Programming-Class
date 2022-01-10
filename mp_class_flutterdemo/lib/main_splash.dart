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
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        constraints: BoxConstraints.expand(
          width: size.width, height: size.height),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [ Color.fromRGBO(254, 243, 172, 1.0),
                      Color.fromRGBO(234, 144, 45, 1.0),
                      Color.fromRGBO(133, 23, 26, 1.0) ],
            begin: Alignment.bottomCenter,
            end: Alignment.topRight,
            stops: const [0.1, 0.6, 0.9])),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 30.0),
                  child: Image.asset('assets/images/Logo_UB_Tengah.png',
                    height: 25.0,
                    fit: BoxFit.scaleDown,
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/images/Logo_UB.png',
                  width: _animation.value * 300,
                  height: _animation.value * 300,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}