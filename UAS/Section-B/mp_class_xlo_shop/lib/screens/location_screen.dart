import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LocationScreen 
  extends StatelessWidget {
  
  final User user;
  const LocationScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text("Fetch Location for ${user.phoneNumber.toString()}"),
        ),
      ),
    );
  }
}