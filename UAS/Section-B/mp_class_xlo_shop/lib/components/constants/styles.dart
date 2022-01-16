import 'package:flutter/material.dart';

import 'colors.dart';

const headerBoxDecoration = BoxDecoration(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(75.0), 
        bottomRight: Radius.circular(75.0),
      ),
      color: COLOR_WHITE,
);

const headerTextStyle = TextStyle(
      fontSize: 36.0,
      fontWeight: FontWeight.bold,
      color: COLOR_DARK,
);

const titleTextStyle = TextStyle(
      fontSize: 28.0,
      fontWeight: FontWeight.bold,
      color: COLOR_DARK,
);

const subtitleTextStyle = TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: COLOR_DARK,
);

const labelTextStyle = TextStyle(
      fontSize: 18.0, 
      fontWeight: FontWeight.bold,
      color: COLOR_DARK,
);

const buttonTextStyle = TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w700,
      color: COLOR_WHITE,  
);

const normalTextStyle = TextStyle(
      fontSize: 16.0,
      color: COLOR_DARKACCENT,
);

const normalLinkStyle = TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
      decoration: TextDecoration.underline,
      color: COLOR_DARK,
);

const footerTextStyle = TextStyle(
      fontSize: 13.5,
      color: COLOR_LIGHT,
);

const footerLinkStyle = TextStyle(
      fontSize: 13.5,
      decoration: TextDecoration.underline,
      color: COLOR_WHITE,
);

const hintTextStyle = TextStyle(
      fontSize: 12.5, 
      color: Colors.blueGrey,
);

const errorTextStyle = TextStyle(
      fontSize: 13.5, 
      color: Colors.red,
);