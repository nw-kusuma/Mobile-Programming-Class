import 'package:flutter/material.dart';
import '../export_packages.dart';
import '../export_screens.dart';

class NavigationPage 
  extends StatelessWidget {
  
  static const _descPageText = 
      "And another screen (question no. 02), might as well named it the..";

  static const _descBodyText = [
      "Notice the neat row of icons below?",
      "\nThat's one kind of the navigation/menu in dart, it's called "
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(_descPageText,
            textAlign: TextAlign.right,
            style: TextStyle(color: Colors.black, 
              fontSize: 18, fontWeight: FontWeight.w500, 
          ),),
          SizedBox(height: 5.0),
          Text('Navigation Screen',
            textAlign: TextAlign.right,
            style: TextStyle(color: Colors.black, 
              fontSize: 45, fontWeight: FontWeight.w700, 
          ),),
          SizedBox(height: 25.0),
          RichText(
            textAlign: TextAlign.right,
            text: TextSpan(
              text: _descBodyText[0],
              style: TextStyle(color: Colors.indigo.shade900, 
                fontSize: 16, fontWeight: FontWeight.w500),
              children: [
                TextSpan(
                  text: _descBodyText[1],
                  style: TextStyle(color: Colors.black, fontSize: 14.5,)),
                TextSpan(
                  text: "BottomNavigationBar..",
                  style: TextStyle(color: Colors.indigo.shade900, fontSize: 14.5,))
          ],),),
          SizedBox(height: 10.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).primaryColorDark,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
            ),),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("Lets see some other kind", style: TextStyle(fontSize: 16.0)),
                SizedBox(width: 10.0),
                Icon(CupertinoIcons.chevron_right_2, size: 16.0),
              ],
            ),
            onPressed: () => 
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) 
                        => NavExamplePage())), 
          ),
        ],
      ),
    );
  }
}