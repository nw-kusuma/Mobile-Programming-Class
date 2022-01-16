import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../components/widgets/layouts.dart';
import '../components/constants/colors.dart';

class SplashScreen 
  extends StatefulWidget {

  @override
  State<SplashScreen> createState() 
      => _SplashScreenState();
}

class _SplashScreenState 
  extends State<SplashScreen> {

  @override
  void initState() {
    Timer(Duration(seconds: 5), () { 
      FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) { 
          if (user == null) { 
            Navigator.of(context).pushReplacementNamed('/sign-in');
          } else {
            Navigator.of(context)
              .pushReplacementNamed('/location', arguments: user); }
      });
    });
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Container(
        alignment: Alignment.center,
        constraints: BoxConstraints.expand(
          width: size.width, height: size.height),
        decoration: _bgBoxDecoration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _imgLogo(size),
            addVerticalSpace(10.0),
            _animatedShopText(
              // onFinish: () => Navigator.of(context).pushNamed('/sign-in')
            ),
        ]),
      ),
    ),
    );
  }

  static const _colorizeTextStyle = TextStyle(
    fontSize: 45.0,
    fontFamily: 'Lato',
    fontWeight: FontWeight.bold,
  );
    
  static const _colorizeColors = [
    Colors.white,
    COLOR_LIGHT,
    COLOR_NORMAL,
    COLOR_DARKACCENT,
    Colors.transparent,
  ];

  final Decoration _bgBoxDecoration = BoxDecoration(
    gradient: LinearGradient(
      colors: [ _colorizeColors[1],
                _colorizeColors[2],
                _colorizeColors[3] ],
      begin: Alignment.topLeft,
      end: Alignment.bottomCenter,
      stops: const [0.3, 0.6, 0.9],
    ),
  );

// ------------------------------------------------------------------
  Image _imgLogo(Size size){
    return Image.asset('assets/images/Fast_Shop_logo.png',
      filterQuality: FilterQuality.medium,
      width: size.width * 0.50,
    );
  }

  AnimatedTextKit _animatedShopText(
    // {required Function() onFinish}
  ){
    return AnimatedTextKit(
      isRepeatingAnimation: false,
      // onFinished: onFinish,
      animatedTexts: [
        ColorizeAnimatedText('FAST-SHOP',
          textStyle: _colorizeTextStyle,
          colors: [ _colorizeColors[0],
                    _colorizeColors[2],
                    _colorizeColors[4] ],
          // speed: Duration(milliseconds: 135)
        ),
    ]);
  }
}