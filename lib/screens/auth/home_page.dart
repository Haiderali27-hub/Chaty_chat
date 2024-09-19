import 'package:chaty_chat/constants/my_text.dart';
import 'package:chaty_chat/services/auth/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void signOut() {
    final authService = Provider.of<AuthServices>(context, listen: false);

    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 1, 1, 17),
        appBar: AppBar(
          title: Center(
            child: MyText(
              text: "Hello",
              color: Color.fromARGB(255, 1, 1, 17),
              size: 18,
            ),
          ),
          backgroundColor: Colors.blueGrey,
          toolbarHeight: 50,
          actions: [
            IconButton(
              onPressed: signOut,
              icon: const Icon(Icons.logout),
              color: Color.fromARGB(255, 1, 1, 17),
            ),
          ],
        ));
  }
}
