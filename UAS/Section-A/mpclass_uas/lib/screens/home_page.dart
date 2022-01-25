import 'package:flutter/material.dart';
import '../export_widgets.dart';

class HomePage 
  extends StatelessWidget {

  static const _descPageText = "This is the home screen, and aptly dubbed";

  static const _descBodyText = [
      "Nothing in particular to observes here.",
      "\nThis page is just a simple ",
      " that display some plain old texts."
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(_descPageText,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, 
              fontSize: 18, fontWeight: FontWeight.w500, 
          ),),
          SizedBox(height: 10.0),
          buildSubtitleRow('the', 20.0, color: Colors.black),
          Text('Homepage',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, 
              fontSize: 60, fontWeight: FontWeight.w700, 
          ),),
          SizedBox(height: 30.0),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: _descBodyText[0],
              style: TextStyle(color: Colors.indigo.shade900, 
                fontSize: 18, fontWeight: FontWeight.w500),
              children: [
                TextSpan(
                  text: _descBodyText[1],
                  style: TextStyle(color: Colors.black, fontSize: 16,)),
                TextSpan(
                  text: "StatelessWidget",
                  style: TextStyle(color: Colors.indigo.shade900, fontSize: 16,)),
                TextSpan(
                  text: _descBodyText[2],
                  style: TextStyle(color: Colors.black, fontSize: 16,)),
          ],),),
        ],
      ),
    );
  }
}