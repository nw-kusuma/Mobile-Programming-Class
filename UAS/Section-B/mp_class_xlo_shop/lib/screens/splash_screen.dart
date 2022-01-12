import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../components/widgets/layouts.dart';
import '../components/constants/themes.dart';

class SplashScreen 
  extends StatelessWidget {

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
              onFinish: () => Navigator.of(context).pushNamed('/sign-in')),
        ]),
      ),
    ),
    );
  }


// ------------------------------------------------------------------
// constants --------------------------------------------------------
// ------------------------------------------------------------------
  static const colorizeTextStyle = TextStyle(
    fontSize: 45.0,
    fontFamily: 'Lato',
    fontWeight: FontWeight.bold,
  );
    
  static const colorizeColors = [
    Colors.white,
    COLOR_LIGHT,
    COLOR_NORMAL,
    COLOR_DARKACCENT,
    Colors.transparent,
  ];

  final Decoration _bgBoxDecoration = BoxDecoration(
    gradient: LinearGradient(
      colors: [ colorizeColors[1],
                colorizeColors[2],
                colorizeColors[3] ],
      begin: Alignment.topLeft,
      end: Alignment.bottomCenter,
      stops: const [0.3, 0.6, 0.9],
    ),
  );


// ------------------------------------------------------------------
// widgets builders -------------------------------------------------
// ------------------------------------------------------------------
  Image _imgLogo(Size size){
    return Image.asset('assets/images/Fast_Shop_logo.png',
      filterQuality: FilterQuality.medium,
      width: size.width * 0.50,
    );
  }

  AnimatedTextKit _animatedShopText(
    {required Function() onFinish}
  ){
    return AnimatedTextKit(
      isRepeatingAnimation: false,
      onFinished: onFinish,
      animatedTexts: [
        ColorizeAnimatedText('FAST-SHOP',
          textStyle: colorizeTextStyle,
          colors: [ colorizeColors[0],
                    colorizeColors[2],
                    colorizeColors[4] ],
          speed: Duration(milliseconds: 135)
        ),
    ]);
  }
}