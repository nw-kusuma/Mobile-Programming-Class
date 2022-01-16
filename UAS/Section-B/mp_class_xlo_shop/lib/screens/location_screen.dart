// ignore_for_file: unused_element

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/constants/colors.dart';
import '../../components/constants/styles.dart';
import '../../components/widgets/layouts.dart';
import '../../components/helpers/location_service.dart';

class LocationScreen 
  extends StatefulWidget { 
  final User user;
  const LocationScreen({required this.user});

  @override
  State<LocationScreen> createState() 
      => _LocationScreenState();
}

class _LocationScreenState 
  extends State<LocationScreen> {
  final LocationService _locService = LocationService();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal:25.0, vertical: 10.0),
          child: Column(
            children: [ 
              _imgHeader(size),
              Text(_titleText, style: titleTextStyle, textAlign: TextAlign.center),
              addVerticalSpace(25.0),
              Text(_subtitleText, style: subtitleTextStyle, textAlign: TextAlign.center),
              addVerticalSpace(25.0),
              _locFetchNearBtn(context, size,
                onPress: () {
                  setState(() => _isLoading = true);
                  _locService.getLocation().then((location){
                    _locService
                    .getAddress(location?.latitude, location?.longitude)
                    .then((address){
                      Navigator.of(context)
                        .pushReplacementNamed('/home', arguments: address);
                    });
                  });
              }),
              TextButton(
                child: Text(_linkTextStyle, style: normalLinkStyle),
                onPressed: (){
                  
                }, 
              )
          ]),
        ),
      ),
    );
  }

// ------------------------------------------------------------------
// string constants -------------------------------------------------
// ------------------------------------------------------------------
  static const _appTitleText  = "Phone Authentication";
  
  static const _titleText     = "Where do you want to Buy or Sell products?";
  static const _subtitleText  = "To best enjoy all that we can offer to you, we need to know where to look for them.";
  
  static const _linkTextStyle = "Set location manually";

// ------------------------------------------------------------------
// widgets builders -------------------------------------------------
// ------------------------------------------------------------------
  Widget _locFetchAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(
        color: COLOR_DARK),
      title: Text(_appTitleText, 
        style: TextStyle(color: COLOR_DARK)),
      titleSpacing: 0.0,
    );
  }

  Widget _imgHeader(Size size){
    return Padding(
      child: Image.asset('assets/images/choose_location.png',
        width: size.height * 0.25,
        filterQuality: FilterQuality.medium),
      padding: const EdgeInsets.only(top: 50.0, bottom: 25.0),
    );
  }

  Widget _locFetchNearBtn(
    BuildContext context,
    Size size,
   {required Function() onPress}
  ){
    return _isLoading 
    ? Center(child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color> (COLOR_DARKACCENT),
      backgroundColor: COLOR_WHITE))
    : ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        primary: Color.fromRGBO(35, 69, 97, 1.0),
        fixedSize: Size.fromWidth(size.width/2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(CupertinoIcons.location_fill),
          addHorizontalSpace(10.0),
          Text('Near Me', style: buttonTextStyle),
        ],
      ),
    );
  }
}