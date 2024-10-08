import 'package:chaty_chat/firebase_options.dart';
import 'package:chaty_chat/services/auth/auth_gate.dart';
import 'package:chaty_chat/services/auth/auth_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() async {
  // Ensure that Firebase is initialized before the app starts
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions
        .currentPlatform, // Initialize Firebase with the options generated by Firebase CLI
  );

  runApp(ChangeNotifierProvider(
    create: (context) => AuthServices(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthGate(),
    );
  }
}
