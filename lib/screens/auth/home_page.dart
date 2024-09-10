import 'package:chaty_chat/constants/my_text.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 1, 1, 17),
      body: Center(
          child: MyText(
        text: "Hello",
        color: Colors.white,
      )),
    );
  }
}
