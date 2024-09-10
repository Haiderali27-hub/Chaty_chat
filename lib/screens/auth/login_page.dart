import 'package:chaty_chat/constants/common_imageviewer.dart';
import 'package:chaty_chat/constants/images.dart';
import 'package:chaty_chat/constants/my_text.dart';
import 'package:chaty_chat/services/auth/auth_services.dart';
import 'package:chaty_chat/widgets/CustomTextField.dart';
import 'package:chaty_chat/widgets/horizontal_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  void SignIn() async {
    //get auth services
    final authService = Provider.of<AuthServices>(context, listen: false);

    try {
      await authService.signInWithEmailAndPassword(
          emailcontroller.text.trim(), passwordcontroller.text.trim());
    } catch (e) {
      // Log error for debugging
      print('Sign In Error: $e');

      // Show error message to the user
      Get.snackbar(
        'Login Failed',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 1, 1, 17),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // logo
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: ClipOval(
                child: CommonImageView(
                  imagePath: logo,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // text
          MyText(
            text: "Sooo, you are here! We've been waiting.",
            color: Colors.white,
            size: 16,
          ),
          MyText(
            text: "Let's get started",
            color: Colors.white,
            size: 16,
          ),

          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Email
                CustomTextfield(
                  text: "Email",
                  controller: emailcontroller,
                ),
                SizedBox(
                  height: 8,
                ),
                //password
                CustomTextfield(
                  text: "Password",
                  obscuretext: true,
                  controller: passwordcontroller,
                ),
                SizedBox(
                  height: 7,
                ),
                //Reset password
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MyText(
                        text: "Forgot Password?",
                        color: Color.fromARGB(255, 90, 214, 179),
                        weight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                //button
                HorizontalButton(
                  onPressed: SignIn,
                  text: 'Sign In',
                  width: 400,
                  height: 55,
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyText(
                text: "Not a member?",
                color: Colors.white,
              ),
              SizedBox(
                width: 7,
              ),
              GestureDetector(
                onTap: widget.onTap,
                child: MyText(
                  text: "Become one",
                  color: Color.fromARGB(255, 90, 214, 179),
                  weight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
