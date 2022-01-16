import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../components/helpers/firebase_services.dart';
import '../../components/constants/styles.dart';
import '../../components/constants/colors.dart';
import '../../components/widgets/layouts.dart';

class OTPScreen 
  extends StatefulWidget {
  final String phoneNumber, verId;
  const OTPScreen({
    required this.phoneNumber, 
    required this.verId
  });

  @override
  State<OTPScreen> createState() 
      => _OTPScreenState();
}

class _OTPScreenState 
  extends State<OTPScreen> {
  final _otpController = TextEditingController();
  final _phAuthService = PhoneAuthService();
  late final String _otpCode;
  bool _isLoading = false;

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: true,
        appBar: _otpScreenAppBar(),
        body: _otpScreenBody(size),
      ),
    );
  }

  // ------------------------------------------------------------------
  // string constants -------------------------------------------------
  // ------------------------------------------------------------------
  static const _appTitleText = "Phone Verification";
  
  static const _titleText    = "Welcome back";
  static const _subtitleText = "Enter the code that we have sent to your phone ";
  
  // ------------------------------------------------------------------
  // widgets builders -------------------------------------------------
  // ------------------------------------------------------------------
  AppBar _otpScreenAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Text(_appTitleText, style: TextStyle(color: COLOR_DARK),),
      automaticallyImplyLeading: false,
    );
  }

  Widget _otpScreenBody(Size size) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal:25.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [ 
          Expanded(
            child: Column(
              children: [
                _imgHeader(size),
                Text(_titleText, style: titleTextStyle),
                _otpDescText(),
                _otpCodeForm(size),
                addVerticalSpace(15.0),
                _otpLoadingIndicator(size),
                addVerticalSpace(25.0),
                _otpResendLink(),
            ]),
          ),
      ]),
    );
  }

  // ------------------------------------------------------------------
  // ------------------------------------------------------------------
  Widget _imgHeader(Size size){
    return Padding(
      child: Image.asset("assets/images/otp_verification.gif",
        width: size.height * 0.25,
        filterQuality: FilterQuality.medium),
      padding: const EdgeInsets.only(top: 50.0, bottom: 25.0),
    );
  }

  Widget _otpDescText() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 25.0),
      child: RichText(
        text: TextSpan(
          text: _subtitleText,
          style: subtitleTextStyle,
          children: [
            TextSpan(text: widget.phoneNumber, style: normalTextStyle),
          ]),
        textAlign: TextAlign.start),
    );
  }

  Widget _otpCodeForm(Size size) {
    return Container(
      width: size.width,
      decoration: BoxDecoration(
        color: COLOR_DARK,
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
        child: Form(
          child: PinCodeTextField(
            length: 6, 
            autoFocus: true,
            appContext: context, 
            controller: _otpController,
            autoDisposeControllers: false,
            keyboardType: TextInputType.number,
            animationType: AnimationType.fade,
            textStyle: TextStyle(color: COLOR_WHITE),
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(10.0),
              activeColor: COLOR_LIGHTACCENT,
              selectedColor: COLOR_LIGHT,
              inactiveColor: COLOR_DARKACCENT,
              inactiveFillColor: COLOR_NORMAL,
              fieldWidth: size.width / 9,
            ),
            onChanged: (code){},
            onCompleted: (codes) { 
              _otpCode = codes;
              setState(() => _isLoading = true);
              _phAuthService
              .phoneCredential(context, _otpCode, widget.verId);
              // if (_otpCode == widget.verId){
              //   _phAuthService
              //   .phoneCredential(context, _otpCode, widget.verId);
              // }
            }
          ),
        ),
      ),
    );
  }

  Widget _otpLoadingIndicator(Size size) {
    return _isLoading 
      ? SizedBox(
          width: size.width/5,
          child: LinearProgressIndicator(
            backgroundColor: COLOR_WHITE,
            valueColor: AlwaysStoppedAnimation<Color> (COLOR_DARKACCENT),
        ),)
      : Container(width: 0.0);
  }

  Widget _otpResendLink() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Did not receive the code? ",
              style: TextStyle(color: COLOR_DARK)),
            Text('RESEND',
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: COLOR_DARKACCENT,
            )),
        ]),
    ]);
  }
}