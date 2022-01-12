import 'package:flutter/material.dart';
import 'package:mp_class_xlo_shop/components/helpers/authentications.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'package:mp_class_xlo_shop/components/constants/styles.dart';
import 'package:mp_class_xlo_shop/components/constants/themes.dart';
import 'package:mp_class_xlo_shop/components/widgets/layouts.dart';

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
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text('Phone Verification', style: TextStyle(color: COLOR_DARK),),
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal:25.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [ 
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      child: Image.asset("assets/images/otp_verification.gif",
                        width: size.height * 0.25,
                        filterQuality: FilterQuality.medium),
                      padding: EdgeInsets.only(top: 50.0, bottom: 25.0)),
                    Text("Welcome back", style: titleTextStyle),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 25.0),
                      child: RichText(
                        text: TextSpan(
                          text: "Enter the code that we have sent to your phone ",
                          style: subtitleTextStyle,
                          children: [
                            TextSpan(text: widget.phoneNumber, style: normalTextStyle),
                          ]),
                        textAlign: TextAlign.start),
                    ),
                    Container(
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
                            onCompleted: (codes) => _otpCode = codes,
                          ),
                        ),
                      ),
                    ),
                ]),
              ),
              Padding(
                padding: EdgeInsets.zero,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                        Text("Did not receive code? ",
                          style: TextStyle(color: COLOR_DARK)),
                        Text('RESEND',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: COLOR_DARKACCENT),
                        ),
                    ],
                  ),
                                  ]),
              ),
              addVerticalSpace(10.0),
              ElevatedButton(
                onPressed: (){
                  _phAuthService.phoneCredential(context, _otpCode, widget.verId);
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(35, 69, 97, 1.0),
                  fixedSize: Size.fromWidth(size.width),
                ),
                child: Text('Next', style: buttonTextStyle),
              ),
          ]),
        ),
      ),
    );
  }
}