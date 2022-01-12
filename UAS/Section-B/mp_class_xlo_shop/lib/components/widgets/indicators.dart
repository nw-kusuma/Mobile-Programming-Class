import 'package:flutter/material.dart';

import '../constants/themes.dart';

showProgressDialog(BuildContext context, String? label){
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context){
      return AlertDialog(
        content: Row(
          children: [
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(COLOR_DARK)),
            SizedBox(width: 10.0),
            Text('$label. Please wait..', 
              style: TextStyle(color: COLOR_DARK)),
        ]),
      );
  });
}
