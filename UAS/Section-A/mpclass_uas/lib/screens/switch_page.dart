import 'package:flutter/material.dart';
import '../export_packages.dart';
import '../export_screens.dart';

class SwitchPage 
  extends StatelessWidget {

  static const _descPageText = 
      "A different screen (the question no. 01), lets just named it the..";

  static const _descBodyText = [
      "Notice how the display changes when tapping on different buttons below?",
      "\nThese displays actually are each a different pages loaded into the body of this main screen.."
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(_descPageText,
            style: TextStyle(color: Colors.black,
              fontSize: 18, fontWeight: FontWeight.w500,
          ),),
          SizedBox(height: 5.0),
          Text('Switch-pages Screen',
            style: TextStyle(color: Colors.black, 
              fontSize: 45, fontWeight: FontWeight.w700, 
          ),),
          SizedBox(height: 25.0),
          RichText(
            text: TextSpan(
              text: _descBodyText[0],
              style: TextStyle(color: Colors.indigo.shade900, 
                fontSize: 16, fontWeight: FontWeight.w500),
              children: [TextSpan(
                text: _descBodyText[1],
                style: TextStyle(color: Colors.black, fontSize: 14.5)),
          ],),),
          SizedBox(height: 10.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).primaryColorDark,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
            ),),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("Lets PUSH in another page", style: TextStyle(fontSize: 16.0)),
                SizedBox(width: 10.0),
                Icon(CupertinoIcons.chevron_right_2, size: 16.0)
              ],
            ),
            onPressed: () => 
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) 
                        => SwitchFirstPage())), 
          ),
        ],
      ),
    );
  }
}
