import 'package:flutter/material.dart';
import 'components/export_widgets.dart';


// initialized connection to the frebase database
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
      title: 'UAS Mobile programming',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
              primaryColor: kPrimaryColor,
              primaryColorDark: kPrimaryDark,
              primaryColorLight: kPrimaryLight),
      home: MainScreen(0),
    );
  }
}

class MainScreen 
  extends StatefulWidget {
  final int _index;
  const MainScreen(this._index);
  
  @override
  State<MainScreen> createState() 
      => _MainScreenState();
}

class _MainScreenState 
  extends State<MainScreen> {
    int _index = 0;

  @override
  void initState() {
    _index = widget._index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
      body: buildBodyBackground(size, 2, 5, 60.0, true,
        topChild: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),
            child: Column(
              children: 
                <Widget>[
                  SizedBox(height: 10.0),
                  Align(
                    child: Image.asset("assets/images/Logo_UB_Samping.png",
                      width: size.width * 0.90,
                  ),),
                  buildTitleText("UAS Mobile Programming", 25.0, color: Colors.black),
                  buildSubtitleRow("Section A", 18.0, color: Colors.black),
                  SizedBox(height: 5.0),
            ],),),
        bottomChild: Padding(
            padding: const EdgeInsets.symmetric(horizontal:25.0),
            child: Column(
              children: 
                <Widget>[
                  SizedBox(height: 20.0),
                  buildTitleText("Nanang Wijaya Kusuma - 1202922001", 18.0),
                  SizedBox(height: 5.0),
                  buildSubtitleRow("Lecturer:", 16.0),
                  SizedBox(height: 3.0),
                  buildTitleText("Habibullah Akbar", 18.0),
                  Expanded(child: screens[_index]),
            ],),)
      ),
      bottomNavigationBar: buildBotomNavBar(_index, 
         onTap: (index) => setState(() => _index = index)),
    );
  }
}
