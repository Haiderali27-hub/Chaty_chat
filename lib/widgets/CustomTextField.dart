import 'package:flutter/material.dart';

class CustomTextfield extends StatefulWidget {
  final String text;
  final double width;
  final double borderRadius;
  final Color borderColorfocus;
  final Color borderColorEnable;
  final bool obscuretext;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final Color hintTextColor;
  final Color textColor;
  final Color iconColor;
  final Color backgroundColor;

  CustomTextfield({
    super.key,
    required this.text,
    this.borderRadius = 8,
    this.borderColorfocus = const Color.fromARGB(255, 215, 225, 150),
    this.borderColorEnable = Colors.cyan,
    this.width = 1,
    this.obscuretext = false,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.hintTextColor = Colors.white,
    this.textColor = Colors.white,
    this.iconColor = Colors.white,
    this.backgroundColor = Colors.transparent,
  });

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.obscuretext && _obscureText,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      style: TextStyle(color: widget.textColor),
      decoration: InputDecoration(
        labelText: widget.text,
        labelStyle: TextStyle(color: widget.hintTextColor),
        filled: true, // Enable filling of background color
        fillColor: widget.backgroundColor,
        suffixIcon: widget.obscuretext
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: widget.iconColor,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: BorderSide(
                color: widget.borderColorfocus, width: widget.width)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: BorderSide(
                color: widget.borderColorEnable, width: widget.width)),
      ),
    );
  }
}
