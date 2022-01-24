import 'package:flutter/material.dart';
import 'package:mpclass_uas/export_packages.dart';
import 'package:mpclass_uas/export_screens.dart';

class DatabasePage 
  extends StatelessWidget {

  static const _descPageText = 
      "And yet another screen (question no. 03), lets called it the..";

  static const _descBodyText = [
      "And what exactly to notice here?",
      "\nWell.. Nothing, there are nothing concerning database to be observed in all these screens. However, another screen will shows how to deal with "
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
          SizedBox(height: 5.0),
          Text('Database Screen',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, 
              fontSize: 45, fontWeight: FontWeight.w700, 
          ),),
          SizedBox(height: 20.0),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: _descBodyText[0],
              style: TextStyle(color: Colors.indigo.shade900, 
                fontSize: 16, fontWeight: FontWeight.w500),
              children: [
                TextSpan(
                  text: _descBodyText[1],
                  style: TextStyle(color: Colors.black, fontSize: 14.5)),
                TextSpan(
                  text: "Firebase Real-time Database..",
                  style: TextStyle(color: Colors.indigo.shade900, fontSize: 14.5)),
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
                Text("So, lets do some data action", style: TextStyle(fontSize: 16.0)),
                SizedBox(width: 10.0),
                Icon(CupertinoIcons.chevron_right_2, size: 16.0),
              ],
            ),
            onPressed: (){
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) =>
                      FirebaseDBPage()));
            }, 
          )
        ],
      ),
    );
  }
}