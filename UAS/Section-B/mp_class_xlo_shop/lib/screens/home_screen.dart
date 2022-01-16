import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mp_class_xlo_shop/components/widgets/layouts.dart';
import '../../components/constants/colors.dart';

class HomeScreen 
  extends StatefulWidget {
    final String currAdrress;
    const HomeScreen({required this.currAdrress});
    
  @override
  _HomeScreenState createState() 
      => _HomeScreenState();
}

class _HomeScreenState 
  extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: _homeLocAppBar(),
        body: Column(
          children: [
            _homeSearchBar(size),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Column(),
            ),
          ],
        ),
      ),
    );
  }

// ------------------------------------------------------------------
// string constants -------------------------------------------------
// ------------------------------------------------------------------
  // static const _appTitleText  = "Phone Authentication";
  
  // static const _titleText     = "Where do you want to Buy or Sell products?";
  // static const _subtitleText  = "To best enjoy all that we can offer to you, we need to know where to look for them.";
  
  // static const _linkTextStyle = "Set location manually";

// ------------------------------------------------------------------
// widgets builders -------------------------------------------------
// ------------------------------------------------------------------
  AppBar _homeLocAppBar() {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: COLOR_WHITE,
      iconTheme: IconThemeData(
        color: COLOR_DARK),
      title: Row(
        children: [
          Icon(CupertinoIcons.location_solid, color: COLOR_DARK),
          Flexible(
            child: Text(widget.currAdrress, 
              style: TextStyle(color: COLOR_DARK, 
              overflow: TextOverflow.ellipsis),
            ),
          ),
          Icon(CupertinoIcons.chevron_down, color: COLOR_DARK, size: 18.0)
        ],
      ),
      // titleSpacing: 0.0,
    );
  }

  Widget _homeSearchBar(Size size){
    return Container(
      padding: EdgeInsetsDirectional.only(bottom: 10.0),
      decoration: BoxDecoration(color: COLOR_WHITE),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal:10.0),
        child: Container(
          width: size.width,
          height: 40.0,
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: COLOR_DARK)),
          child: Row(
            children: [
              Icon(Icons.search, color: COLOR_DARK),
              addHorizontalSpace(10.0),
              Text("Find Cars, Mobile Phones and more..", 
                style: TextStyle(color: COLOR_DARK),),
          ]),
        ),
      ),
    );
  }
}