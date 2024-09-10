import 'package:chaty_chat/screens/auth/home_page.dart';
import 'package:chaty_chat/services/auth/login_or_signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show loading indicator while waiting for Firebase Auth state
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            // Log any errors encountered
            print('Error in AuthGate: ${snapshot.error}');
            return Center(
                child: Text('Something went wrong. Please try again.'));
          }

          if (snapshot.hasData) {
            // If logged in, show HomePage
            return HomePage();
          } else {
            // If not logged in, show LoginPage
            return LoginOrSignup();
          }
        },
      ),
    );
  }
}
