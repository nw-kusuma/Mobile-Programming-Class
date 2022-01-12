import 'package:flutter/material.dart';

import 'themes.dart';

const headerBoxDecoration = BoxDecoration(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(75.0), 
        bottomRight: Radius.circular(75.0),
      ),
      color: COLOR_WHITE,
);

const headerTextStyle = TextStyle(
      fontSize: 36.0,
      fontFamily: 'Lato',
      fontWeight: FontWeight.bold,
      color: COLOR_DARK,
);

const titleTextStyle = TextStyle(
      fontSize: 28.0,
      fontFamily: 'Lato', 
      fontWeight: FontWeight.bold,
      color: COLOR_DARK,
);

const subtitleTextStyle = TextStyle(
      fontSize: 16.0,
      fontFamily: 'Lato',
      fontWeight: FontWeight.bold,
      color: COLOR_DARK,
);

const labelTextStyle = TextStyle(
      fontSize: 18.0, 
      fontFamily: 'Lato',
      fontWeight: FontWeight.bold,
      color: COLOR_DARK,
);

const buttonTextStyle = TextStyle(
      fontFamily: 'Lato',
      fontSize: 18.0,
      color: COLOR_WHITE,  
);

const normalTextStyle = TextStyle(
      fontSize: 16.0,
      fontFamily: 'Lato',
      color: COLOR_DARKACCENT,
);

const footerTextStyle = TextStyle(
      fontSize: 13.5,
      fontFamily: 'Lato',
      color: COLOR_LIGHT,
);

const footerLinkStyle = TextStyle(
      fontSize: 13.5,
      fontFamily: 'Lato',
      decoration: TextDecoration.underline,
      color: COLOR_WHITE,
);

const hintTextStyle = TextStyle(
      fontSize: 12.5, 
      fontFamily: 'Lato',
      color: Colors.blueGrey,
);

const errorTextStyle = TextStyle(
      fontSize: 13.5, 
      fontFamily: 'Lato',
      color: Colors.red,
);