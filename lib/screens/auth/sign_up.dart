import 'package:chaty_chat/constants/common_imageviewer.dart';
import 'package:chaty_chat/constants/images.dart';
import 'package:chaty_chat/constants/my_text.dart';
import 'package:chaty_chat/services/auth/auth_services.dart';
import 'package:chaty_chat/widgets/CustomTextField.dart';
import 'package:chaty_chat/widgets/horizontal_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  final void Function()? onTap;
  const SignUp({super.key, required this.onTap});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  get passwordcontroller => null;

  @override
  Widget build(BuildContext context) {
    final emailcontroller = TextEditingController();
    final passwordcontroller = TextEditingController();
    final confirmpasswordcontroller = TextEditingController();

    void SignUp() async {
      if (passwordcontroller.text != confirmpasswordcontroller.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Password does not match!!!")),
        );
        return;
      }
      if (passwordcontroller.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Password is empty!!!")),
        );
        return;
      }
      final authServices = Provider.of<AuthServices>(context, listen: false);

      try {
        await authServices.signUpWithEmailAndPassword(
            emailcontroller.text.trim(), passwordcontroller.text.trim());
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
          ),
        );
      }
    }

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
            text: "Let's get on board.",
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
                  height: 8,
                ),
                CustomTextfield(
                  text: "Confirm Password",
                  obscuretext: true,
                  controller: confirmpasswordcontroller,
                ),
                SizedBox(
                  height: 7,
                ),

                SizedBox(
                  height: 15,
                ),
                //button
                HorizontalButton(
                  onPressed: SignUp,
                  text: 'Sign Up',
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
                text: "Already a member?",
                color: Colors.white,
              ),
              SizedBox(
                width: 7,
              ),
              GestureDetector(
                onTap: widget.onTap,
                child: MyText(
                  text: "LogIn Now",
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
