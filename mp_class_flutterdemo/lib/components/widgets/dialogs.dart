import 'package:flutter/material.dart';

showEmptyAlert(BuildContext context){
  return showDialog(
    context: context, 
    builder: (param){
      return AlertDialog(
        title: Text('Empty Data!'),
        content: Text('''Please provide either firstname or lastname. 
                       \nPhone and email fields must not empty too.'''),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            style: TextButton.styleFrom(
              textStyle: TextStyle(
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

enum ConfirmDelete {Cancel, Delete}  
Future<ConfirmDelete?> confirmDeleteDialog(BuildContext context) async {  
  return showDialog<ConfirmDelete>(  
    context: context,  
    barrierDismissible: false, 
    builder: (BuildContext context) {  
      return AlertDialog(  
        title: Text('Delete Contact?'),
        content: Text('Are you sure you want to delete this contact?'),
        actions: [  
          TextButton(
            child: Text('Cancel'),  
            style: TextButton.styleFrom(
              textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)), 
            onPressed: () => Navigator.of(context).pop(ConfirmDelete.Cancel),  
          ),  
          TextButton(
            child: Text('Delete'),
            style: TextButton.styleFrom(
              textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)), 
            onPressed: () => Navigator.of(context).pop(ConfirmDelete.Delete),  
          ),
        ],  
      );
    },  
  );  
}

enum DetailEdit {Edit, Delete, Close}  
Future<DetailEdit?> showDetailDialog(
  BuildContext context, 
  Widget content) async {  
  return showDialog<DetailEdit>(  
    context: context,  
    barrierDismissible: false, 
    builder: (BuildContext context) {  
      return AlertDialog( 
        content: content,
        actionsAlignment: MainAxisAlignment.center,
        actions: [  
          TextButton(
            child: Text('Edit'),  
            style: TextButton.styleFrom(
              textStyle: TextStyle(
                fontWeight: FontWeight.bold, 
                fontSize: 18)), 
            onPressed: () => Navigator.of(context).pop(DetailEdit.Edit),  
          ),  
          TextButton(
            child: Text('Delete'),  
            style: TextButton.styleFrom(
              textStyle: TextStyle(
                fontWeight: FontWeight.bold, 
                fontSize: 18)), 
            onPressed: () => Navigator.of(context).pop(DetailEdit.Delete),  
          ),  
          TextButton(
            child: Text('Close'),
            style: TextButton.styleFrom(
              textStyle: TextStyle(
                fontWeight: FontWeight.bold, 
                fontSize: 18)), 
            onPressed: () => Navigator.of(context).pop(DetailEdit.Close),  
          ),
        ],  
      );
    },  
  );  
}
