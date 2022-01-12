import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../components/constants/themes.dart';
import '../../components/constants/styles.dart';
import '../../components/helpers/keyboard.dart';
import '../../components/helpers/authentications.dart';
import '../../components/widgets/indicators.dart';
import '../../components/widgets/layouts.dart';

class PhoneAuthScreen 
  extends StatefulWidget {

  @override
  State<PhoneAuthScreen> createState() 
      => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState 
  extends State<PhoneAuthScreen> {
  bool _validated = false;

  @override
  void initState() {
    _phoneController.addListener(() => setState(() {}));
    _validated = false;
    super.initState();
  }

  @override
  void dispose() {
    _countryController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea (
      child: Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: true,
        appBar: _phoneAuthAppBar(),
        body: _phoneAuthBody(size),
      ),
    );
  }


// ------------------------------------------------------------------
// final variables --------------------------------------------------------
// ------------------------------------------------------------------
  final _countryController = TextEditingController(text: '+62');
  final _phoneController = TextEditingController();
  final _phAuthService = PhoneAuthService();
  // final _regex = RegExp(r"^(0|\+|(\+[0-9]{2,4}|\(\+?[0-9]{2,4}\)) ?)([0-9]*|\d{2,4}-\d{2,4}(-\d{2,4})?)$");
  // final _regex = RegExp(r"^(0|\+[1-9]{2})([7-9][1-9]{2})([0-9]*)$");
  final _regex = RegExp(r"^(0?[7-9][1-9]{2}([0-9]{7,8}))$");

// ------------------------------------------------------------------
// string constants -------------------------------------------------
// ------------------------------------------------------------------
  static const _appTitleText = "Phone Authentication";
  
  static const _titleText    = "Enter your phone";
  static const _subtitleText = "We will send a confirmation code to your phone.\nStandard message rates may applied.";
  
  static const _hintText     = "81812345678 ..or.. 081812345678";
  static const _helperText   = "Numbers only with length of 10-12 digits";
  static const _errorText    = "Enter a valid phone number";

// ------------------------------------------------------------------
// widget groups ----------------------------------------------------
// ------------------------------------------------------------------
  AppBar _phoneAuthAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(
        color: COLOR_DARK),
      title: Text(_appTitleText, style: TextStyle(
        color: COLOR_DARK)),
      titleSpacing: 0.0,
    );
  }

  Widget _phoneAuthBody(Size size) {
    return Column(
      children: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _imgHeader(size),
              _phAuthTitleText(),
              addVerticalSpace(10.0),
              _phAuthSubtitleText(),
              _phAuthTextForm(),
          ]),
        ),
        _phAuthNextBtn(size, 
          onPressed: () {
            var _phoneNumber = 
              "${_countryController.text}${
                  int.parse(_phoneController.text).toString()}";
            _phAuthService.verifyPhoneNumber(context, _phoneNumber);
            showProgressDialog(context, 'Autenticating');
            KeyboardUtil.hideKeyboard(context);
          }, 
        ),
      ],
    );
  }


// ------------------------------------------------------------------
// widgets builders -------------------------------------------------
// ------------------------------------------------------------------
  Widget _imgHeader(Size size){
    return Padding(
      padding: const EdgeInsets.only(top: 50.0, bottom: 15.0),
      child: Image.asset('assets/images/signin_auth.png',
        width: size.height * 0.25,
        filterQuality: FilterQuality.medium,
      ),
    );
  }

  Widget _phAuthTextForm(){
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 25.0, vertical: 10.0),
      child: Row(
        children: [
          Expanded(
            child: _countryTextField()),
          addHorizontalSpace(10.0),
          Expanded(flex: 4, 
            child: _phoneTextField( 
            onChanged: 
              (value) => 
                setState(()  => 
                  _validated = ((value.length >= 10) 
                             & (_regex.hasMatch(value))) 
                             ? true 
                             : false)),
          ),
      ]),
    );
  }
  
  Widget _phAuthNextBtn(Size size,
    {required Function() onPressed}
  ){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: COLOR_DARK,
              fixedSize: Size.fromWidth(size.width)),
            child: Text('Request OTP', 
              style: buttonTextStyle),
            onPressed: !_validated ? null : onPressed,
          ),
      ]),
    );
  }
  
// ------------------------------------------------------------------
// widgets components -----------------------------------------------
// ------------------------------------------------------------------
  Text _phAuthTitleText() => Text(_titleText, style: titleTextStyle);
  Text _phAuthSubtitleText() => Text(_subtitleText, style: subtitleTextStyle);

  TextFormField _countryTextField(){
    return TextFormField(
      enabled: false,
      controller: _countryController,
      decoration: InputDecoration(
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: COLOR_DARKACCENT, width: 2.0)),
        label: Text('Country'),
        labelStyle: labelTextStyle,
        floatingLabelStyle: labelTextStyle,
        counterText: '0',
      ),
    );
  }

  TextFormField _phoneTextField(
    {required Function(String) onChanged}
  ) {
    return TextFormField(
      maxLength: 12,
      autofocus: true,
      controller: _phoneController,
      keyboardType: TextInputType.phone,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly], // FilteringTextInputFormatter.allow(RegExp(r'(^[8])([1-9]{2})([0-9]+)')),
      decoration: InputDecoration(
        label: Text('Phone number'),
        labelStyle: labelTextStyle,
        floatingLabelStyle: labelTextStyle,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: COLOR_DARKACCENT, width: 2.0)),
        hintText: _hintText,
        hintStyle: hintTextStyle,
        helperText: (_phoneController.text.length >= 10 && !_validated) 
                  ? _errorText : _helperText,
        helperStyle: (_phoneController.text.length >= 10 && !_validated) 
                  ? errorTextStyle : hintTextStyle,
        suffixIcon: _phoneController.text.isEmpty
                  ? null
                  : IconButton(icon: Icon(Icons.close),
                      onPressed: () { 
                        _phoneController.clear();
                        _validated = false;}), 
      ),
      onChanged: onChanged,
    );
  }
}