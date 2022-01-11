import 'package:flutter/material.dart';

import '../../main_screen.dart';
import '../../main_splash.dart';



class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final _args = settings.arguments;
    switch (settings.name) {
//       case '/':
//           return MaterialPageRoute(builder: (_) => SplashScreen());
//           return MaterialPageRoute(builder: (_) => HomeScreen(idx: 0));
      case '/home':
          return MaterialPageRoute(builder: (_) => HomeScreen(idx: 0));
      case '/sqlite':
        if (_args is int){
          return MaterialPageRoute(builder: (_) => HomeScreen(idx: _args));
        } return _errorRoute();
      case '/firebase':
        if (_args is int){
          return MaterialPageRoute(builder: (_) => HomeScreen(idx: _args));
        } return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text('Error'),
          // leading: IconButton(
          //   icon: Icon(Icons.arrow_back),
          //   onPressed: (){},
          // ),
        ),
        body: Center(child: Text('ERROR')),
      ),
    );
  }
}
