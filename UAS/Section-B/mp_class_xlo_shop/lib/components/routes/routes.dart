import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../screens/home_screen.dart';
import '../../screens/splash_screen.dart';
import '../../screens/signin_screen.dart';
import '../../screens/location_screen.dart';
import '../../screens/authentications/otp_screen.dart';
import '../../screens/authentications/phoneauth_screen.dart';

// final Map<String, WidgetBuilder> routes = {
//   SplashScreen.id: (context) => SplashScreen(),
//   SignInScreen.id: (context) => SignInScreen(),
//   PhoneAuthScreen.id: (context) => PhoneAuthScreen(),
// }

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final Object? _args = settings.arguments;
    // final args2 = settings.arguments;
    switch (settings.name) {
      case '/splash':
          return MaterialPageRoute(builder: (context) => SplashScreen());
      case '/sign-in':
          return MaterialPageRoute(builder: (context) => SignInScreen());
      case '/phone-auth':
          return MaterialPageRoute(builder: (context) => PhoneAuthScreen());
      case '/otp-ver':
          if (_args is List<String>) {
            return MaterialPageRoute(builder: (context) 
                => OTPScreen(phoneNumber: _args[0], verId: _args[1]));
          } return _errorRoute();
      case '/location':
          if (_args is User) {
            return MaterialPageRoute(builder: (context) => LocationScreen(user: _args));
          } return _errorRoute();
      case '/home':
          if (_args is String) {
            return MaterialPageRoute(builder: (context) => HomeScreen(currAdrress: _args));
          } return _errorRoute();
     default:
        return _errorRoute();
    }
  }
  
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
            color: Color.fromRGBO(35, 69, 97, 1.0)),
          title: Text('ERROR', 
            style: TextStyle(
              color: Color.fromRGBO(35, 69, 97, 1.0),
            ),
          ),
        ),
        body: Center(child: Text('Something went wrong!')),
      ),
    );
  }
}


