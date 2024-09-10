import 'package:chaty_chat/screens/auth/login_page.dart';
import 'package:chaty_chat/screens/auth/sign_up.dart';
import 'package:flutter/material.dart';

class LoginOrSignup extends StatefulWidget {
  const LoginOrSignup({super.key});

  @override
  State<LoginOrSignup> createState() => _LoginOrSignupState();
}

class _LoginOrSignupState extends State<LoginOrSignup> {
  //initially show login page
  bool showLoginPage = true;

  //toggle between login page and register page
  void togglePage() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(onTap: togglePage);
    } else {
      return SignUp(onTap: togglePage);
    }
  }
}
