import 'dart:async';

import 'package:chaty_chat/constants/common_imageviewer.dart';
import 'package:chaty_chat/constants/images.dart';
import 'package:chaty_chat/services/auth/login_or_signup.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 10), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginOrSignup()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x0000008b), // Background color
      body: Center(
        child: Container(
          height: 179,
          width: 149,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5), // Shadow color
                spreadRadius: 20, // Spread radius of the shadow
                blurRadius: 30, // Blur radius for the shadow softness
                offset: Offset(0, 5), // Horizontal and Vertical offset
              ),
            ],
          ),
          child: CommonImageView(
            imagePath: splashscreen, // Image path
          ),
        ),
      ),
    );
  }
}
