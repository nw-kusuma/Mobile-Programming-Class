import 'package:flutter/material.dart';

import '../constants/colors.dart';

showProgressDialog(BuildContext context, String? _label){
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
            Text('$_label. Please wait..', 
              style: TextStyle(color: COLOR_DARK)),
        ]),
      );
  });
}
