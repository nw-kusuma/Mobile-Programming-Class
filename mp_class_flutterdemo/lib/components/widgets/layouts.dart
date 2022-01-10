import 'package:flutter/material.dart';

Widget buildCardView(
  BuildContext context, 
  String _title, 
  String _desc,
  {double width = 150.0, double height = 90.0}
){
  return Card(
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0)),
    elevation: 5.0,
    shadowColor: Theme.of(context).primaryColor,
    child: Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [ Color.fromRGBO(133, 23, 26, 0.9),
                    Color.fromRGBO(234, 144, 45, 1.0) ],
          begin: Alignment.bottomCenter,
          end: Alignment.topRight,
          stops: const [0.3, 0.9],
        ),
      ),
      padding: EdgeInsets.only(left: 15.0, top: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(_title, 
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.amberAccent,
              fontWeight: FontWeight.bold
            ),
          ),
          Text(_desc, 
            style: TextStyle(
              fontSize: 17.0,
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          ),
      ]),
    ),
  );
}

Widget buildCardDetail(
  BuildContext context, 
  String text, 
  IconData icon,
){
  return Card(
    color: Color.fromRGBO(133, 23, 26, 1.0),
    shadowColor: Color.fromRGBO(234, 144, 45, 1.0),
    margin: EdgeInsets.symmetric(vertical: 10.0),
    elevation: 5.0,
    child: ListTile(
      horizontalTitleGap: 1.0,
      leading: Icon(icon, 
        color: Color.fromRGBO(254, 243, 172, 1.0)),
      title: FittedBox(
        fit: BoxFit.fitWidth,
        child: Text(text, 
          style: TextStyle(
            fontSize: 18.0, 
            fontWeight: FontWeight.bold, 
            color: Color.fromRGBO(254, 243, 172, 1.0),
          ),
        ),
      ) 
    ),
  );
}

Widget buildTab(
  String _label,
  IconData _icon,
){
  return Tab(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(_icon),
        SizedBox(width: 2.25),
        Text(_label, textScaleFactor: 1.15)
      ],
    ),
  );
}

Widget addDivider(Color color, double size){
  return Divider(
    color: color,
    thickness: 1.5,
    indent: size * 0.05,
    endIndent: size * 0.05,
  );              
}

Widget addVerticalSpace(double _height){
  return SizedBox(height: _height);
}

Widget addHorizontalSpace(double _width){
  return SizedBox(width: _width);
}