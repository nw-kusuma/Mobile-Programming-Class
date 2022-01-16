// ignore_for_file: prefer_function_declarations_over_variables 

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PhoneAuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final User? user = FirebaseAuth.instance.currentUser;
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUser(context) async {
    final QuerySnapshot result = await users.where('uid', isEqualTo: user!.uid).get();
    List<DocumentSnapshot> document = result.docs;
    if (document.isNotEmpty){
      Navigator.of(context)
            .pushReplacementNamed('/location', arguments: user);
    } else {
      return users
        .doc(user!.uid)
        .set({
          'uid'   : user!.uid, 
          'mobile': user!.phoneNumber, 
          'email' : user!.email,
          'name'  : user!.displayName
        })
        .then((value) {
          Navigator.of(context)
              .pushReplacementNamed('/location', arguments: user);
        })
        // ignore: invalid_return_type_for_catch_error
        .catchError((error) => print("Failed to add user: $error"));
    }
  }
  
  Future<void> phoneCredential(BuildContext context, _otp, _verId) async{
    try{
      PhoneAuthCredential credential = 
          PhoneAuthProvider.credential(
            verificationId: _verId, 
            smsCode: _otp
          );
      final user = (await _auth.signInWithCredential(credential)).user;

      if (user != null) {
        addUser(context);
        Navigator.of(context)
            .pushReplacementNamed('/location', arguments: user);
      } else {
        print("Login Failed");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> verifyPhoneNumber(BuildContext context, String number) async{
    final PhoneVerificationCompleted _verificationCompleted = 
      (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
    };

    final PhoneVerificationFailed _verificationFailed = 
      (FirebaseAuthException e) {
        if (e.code == "invalid-phone-number") {
          print("The provided phone number is not valid.");
        } print("Error: ${e.code}");
    };

    final PhoneCodeSent _codeSent = 
      (String verificationId, int? resendToken) async {
          Navigator.of(context)
              .pushNamed('/otp-ver', 
                arguments: [number, verificationId]);
    };

    // final PhoneCodeAutoRetrievalTimeout _codeAutoRetrievalTimeout = 
    //   (String verificationId) {
    //     timeout: const Duration(seconds: 60);
    //     codeAutoRetrievalTimeout: (verificationId) {
    //       print(verificationId);
    //     };
    // };

    try{
      _auth.verifyPhoneNumber(
        phoneNumber: number,
        verificationCompleted: _verificationCompleted,
        verificationFailed: _verificationFailed,
        codeSent: _codeSent,
        timeout: const Duration(seconds: 60),
        codeAutoRetrievalTimeout: (String verificationId) {
          print(verificationId);
        }
        // codeAutoRetrievalTimeout: _codeAutoRetrievalTimeout,
      );
    } catch(e){
      print('Error ${e.toString()}');
    }
  }

}