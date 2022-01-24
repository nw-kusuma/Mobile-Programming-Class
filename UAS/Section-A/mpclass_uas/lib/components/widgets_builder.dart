import 'package:flutter/material.dart';
import '../export_widgets.dart';


// -----------------------------------------------------------------------
// Form Fields
// -----------------------------------------------------------------------
Widget buildTextFormField(
  TextEditingController _controller,
  TextInputType _keyType,
  String _label,
  IconData _icon,
{ double padding = 10.0,
  bool isReadOnly = false,
  bool autoFocus = false,
  TextCapitalization caps = TextCapitalization.none }
) {
  return Padding (
    padding: EdgeInsets.symmetric(vertical: padding),
    child: TextFormField(
      // onChanged: (value) {},
      readOnly: isReadOnly,
      autofocus: autoFocus,
      controller: _controller,
      keyboardType: _keyType,
      textCapitalization: caps,
      style: TextStyle(color: kPrimaryDark, fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 5.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: kPrimaryDark)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: kPrimaryDark)),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: kPrimaryDark)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: kPrimaryDark)),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        filled: true,
        fillColor: kPrimaryLight,
        labelText: _label,
        labelStyle: TextStyle(color: kPrimaryDark, fontWeight: FontWeight.w500),
        prefixIcon: Icon(_icon, color: kPrimaryDark),
      ),
    ),
  );
}

Widget buildDropDownFormField(
  String _label,
  IconData _icon,
{ required List<DropdownMenuItem<String>> itemLists,
  required Function(String?) onValueChanged }
){
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: DropdownButtonFormField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 5.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: kPrimaryDark)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: kPrimaryDark)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: kPrimaryDark)),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        filled: true,
        fillColor: kPrimaryLight,
        labelText: _label,
        labelStyle: TextStyle(color: kPrimaryDark, fontWeight: FontWeight.w500),
        prefixIcon: Icon(_icon, color: kPrimaryDark),
      ),
      dropdownColor: kPrimaryColor,
      iconEnabledColor: kPrimaryDark,
      iconSize: 36.0,
      style: TextStyle(color: kPrimaryDark, fontWeight: FontWeight.w500),
      items: itemLists,
      onChanged: onValueChanged,
    ),
  );
}

// -----------------------------------------------------------------------
// Dialog Boxes
// -----------------------------------------------------------------------
enum ConfirmDelete {cancel, delete}  
Future<ConfirmDelete?> confirmDeleteDialog(BuildContext context) async {  
  return showDialog<ConfirmDelete>(  
    context: context,  
    barrierDismissible: false, 
    builder: (BuildContext context) {  
      return AlertDialog(  
        title: Text("Delete Student Data?", 
          style: TextStyle(color: kPrimaryDark)),
        content: Text('Are you sure you want to delete this Student Data?'),
        actions: [  
          TextButton(
            child: Text('Cancel',  
              style: TextStyle(
                color: kPrimaryDark,
                fontWeight: FontWeight.bold, 
                fontSize: 18)), 
            onPressed: () => Navigator.of(context).pop(ConfirmDelete.cancel),  
          ),  
          TextButton(
            child: Text('Delete',
              style: TextStyle(
                color: kPrimaryDark,
                fontWeight: FontWeight.bold, 
                fontSize: 18)), 
            onPressed: () => Navigator.of(context).pop(ConfirmDelete.delete),  
          ),
        ],  
      );
    },  
  );  
}

showSuccessDialog(
  BuildContext context,
  String _title, _message,
){
  return showDialog(
    context: context, 
    builder: (BuildContext context){
      return AlertDialog(
        title: Text(_title, style: TextStyle(color: kPrimaryDark)),
        content: Text(_message, style: TextStyle(color: kPrimaryDark)),
        backgroundColor: kPrimaryLight,
        actions: <Widget>[
          TextButton(
            child: Text('OK', textAlign: TextAlign.center),
            style: TextButton.styleFrom(
              textStyle: TextStyle(
                color: kPrimaryDark,
                fontWeight: FontWeight.bold, 
                fontSize: 18.0,
              )),
            onPressed: () => Navigator.pop(context), 
          ),
        ],
      );
    }
  );
}


// -----------------------------------------------------------------------
// Text Decorations
// -----------------------------------------------------------------------
Text buildTitleText(
  String _text, 
  double _size,
{ Color color = Colors.white }
) { 
  return Text(_text, 
    style: TextStyle(
      color: color, 
      fontSize: _size, 
      fontWeight: FontWeight.w700),
    textAlign: TextAlign.center,
  );
}

Row buildSubtitleRow(
  String _text, 
  double _size,
{ Color color = Colors.white }
) { 
  return Row(
    children: <Widget>[
      Expanded(child: Container(height: 1.0, color: color)),
      Padding(
        padding: EdgeInsets.symmetric(horizontal:10.0),
        child: Text(_text, 
          style: TextStyle(
            color: color, 
            fontSize: _size, 
            fontWeight: FontWeight.w500,
      ),),),
      Expanded(child: Container(height: 1.0, color: color)),
  ],);
}