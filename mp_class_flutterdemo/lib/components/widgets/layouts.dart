import 'package:flutter/material.dart';

Widget buildCardView(
  BuildContext context, 
  String title, 
  String desc,
){
  return Card(
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0)),
    elevation: 5.0,
    shadowColor: Theme.of(context).primaryColor,
    child: Container(
      width: 150.0,
      height: 100.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColorLight,
            Theme.of(context).primaryColorDark],
          begin: Alignment.topLeft,
          end: Alignment.bottomCenter,
        ),
      ),
      padding: EdgeInsets.only(left: 15.0, top: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, 
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
              fontWeight: FontWeight.bold
            ),
          ),
          Text(desc, 
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
    color: Theme.of(context).primaryColor,
    shadowColor: Theme.of(context).primaryColorDark,
    margin: EdgeInsets.symmetric(vertical: 10.0),
    child: ListTile(
      horizontalTitleGap: 1.0,
      leading: Icon(icon, 
        color: Colors.white),
      title: FittedBox(
        fit: BoxFit.fitWidth,
        child: Text(text, 
          style: TextStyle(
            fontSize: 18.0, 
            fontWeight: FontWeight.bold, 
            color: Colors.white,
          ),
        ),
      ) 
    ),
  );
}

Widget buildTextFormField(
  BuildContext _context, 
  TextEditingController _controller,
  TextInputType _keyType,
  String _label,
  String _hint,
  IconData _icon, 
{ 
  bool autoFocus = false,
  TextCapitalization caps = TextCapitalization.none,
}){
  // controller.addListener(() => setState(() {}));
  return Padding (
    padding: EdgeInsets.only(top: 5.0, bottom:10.0),
    child: TextFormField(
      autofocus: autoFocus,
      controller: _controller,
      keyboardType: _keyType,
      textCapitalization: caps,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0)),
        hintText: _hint,
        labelText: _label,
        suffixIcon: Icon(_icon),
        // suffixIcon: controller.text.isEmpty
        //   ? Icon(icon)
        //   : IconButton(
        //       icon: Icon(Icons.close),
        //       onPressed: () => controller.clear(),
        //     ),
      ),
      // onChanged: (value) {},
    ),
  );
}

Widget addVerticalSpace(double _height){
  return SizedBox(height: _height);
}

Widget addHorizontalSpace(double _width){
  return SizedBox(width: _width);
}