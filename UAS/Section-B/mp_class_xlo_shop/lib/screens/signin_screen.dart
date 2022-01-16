import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mp_class_xlo_shop/components/constants/colors.dart';

import '../components/constants/styles.dart';


class SignInScreen 
  extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColorDark,
        body: Column(
          children: [
            _signinHeader(size),
            _signinOption(size, context),
            _signinTerms(),
        ]),
      ),
    );
  }


// ------------------------------------------------------------------
// string constants -------------------------------------------------
// ------------------------------------------------------------------
  static const _titleText = 'FAST-SHOP';
  static const _taglineText = 
  """BUY, SELL, or TRADE faster and safer
  within a trusted community of
  online buyers and sellers""";

  static const _phoneOptText = "Continue with phone";
  static const _emailOptText = "Sign-in with email";

  static const _googleOptText = "Continue with Google";
  static const _facebookOptText = "Continue with Facebook";

  static const _termsText = "By continuing, you are accepting our ";  
  static const _termsLinkText = "Terms & Conditions";  

  static const _privyText = "and aknowledge to have read our "; 
  static const _privyLinkText = "Privacy Policies";  


// ------------------------------------------------------------------
// widget groups ----------------------------------------------------
// ------------------------------------------------------------------
  Widget _signinHeader(Size size){
    return Expanded(
      child: Container(
        width: size.width,
        decoration: headerBoxDecoration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _imgHeader(size),
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 5.0),
              child: _descHeader(true)),
            _descHeader(false),
        ]),
      ),
    );
  }

  Widget _signinOption(Size size, BuildContext context){
    return Expanded(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _phoneOptButton(
          onPress: () => Navigator.of(context).pushNamed('/phone-auth')),
        _signInOptButton(Buttons.Google, _googleOptText, 
          onPress: () {}),
        _signInOptButton(Buttons.FacebookNew, _facebookOptText, 
          onPress: () {}),
        _signInOptDivider(size),
        _emailOptLink(
          onPress: () {})
      ]),
    );
  }

  Widget _signinTerms(){
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        children: [
          _termPolicyLink(_termsText, _termsLinkText, 
            onTap: () {}),
          _termPolicyLink(_privyText, _privyLinkText, 
            onTap: () {}),
      ]),
    );
  }


// ------------------------------------------------------------------
// widgets builders -------------------------------------------------
// ------------------------------------------------------------------
  SignInButtonBuilder _phoneOptButton(
    {required Function onPress}
  ){
    return SignInButtonBuilder(
      onPressed: onPress,
      text: _phoneOptText,
      icon: FontAwesomeIcons.mobileAlt,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      backgroundColor: Color.fromRGBO(2, 169, 222, 1.0),
    );
  }

  SignInButton _signInOptButton(
    Buttons _button,
    String _optText,
    {required Function onPress}
  ){
    return SignInButton(
      _button,
      text: _optText,
      onPressed: onPress,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
    );
  }

  TextButton _emailOptLink(
    {required Function() onPress}
  ){
    return TextButton(
      child: Text(_emailOptText, style: buttonTextStyle),
      style: TextButton.styleFrom(
        textStyle: TextStyle(decoration: TextDecoration.underline)),
      onPressed: onPress,
    );
  }

  Image _imgHeader(Size size){
    return Image.asset('assets/images/Fast_Shop_logo.png',
      filterQuality: FilterQuality.medium,
      width: size.width * 0.35,
    );
  }

  Text _descHeader(bool title){
    return title       
      ? Text(_titleText, textAlign: TextAlign.center, style: headerTextStyle)
      : Text(_taglineText, textAlign: TextAlign.center, style: subtitleTextStyle);
  }

  SizedBox _dividerLine(Size size){
    return SizedBox(
      width: size.width*0.25,
      child: Divider(
        thickness: 1,
        color: COLOR_WHITE,
      ),
    );
  }

  Padding _signInOptDivider(Size size){
    return Padding(
      padding: EdgeInsets.only(top:10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _dividerLine(size),
          Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: Text('OR', 
              textAlign: TextAlign.center, 
              style: buttonTextStyle,
            ),
          ),
          _dividerLine(size),
      ]), 
    );
  }

  Row _termPolicyLink(
    String _text, _link,
    {required Function() onTap}
  ){
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(_text, style: footerTextStyle),
        InkWell(
          child: Text(_link, style: footerLinkStyle), 
          onTap: onTap,
        ),
    ]);
  }
}