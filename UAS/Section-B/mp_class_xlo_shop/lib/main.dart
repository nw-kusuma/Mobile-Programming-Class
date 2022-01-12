import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'components/constants/themes.dart';
import 'components/routes/routes.dart';
// import 'screens/signin_screen/signin_screen.dart';
// import 'screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp 
  extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FAST-SHOP',
      theme: ThemeData(
        primaryColor: COLOR_NORMAL,
        primaryColorDark: COLOR_DARK,
        primaryColorLight: COLOR_LIGHT),
      initialRoute: '/splash',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}