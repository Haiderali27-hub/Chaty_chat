import 'package:chaty_chat/constants/my_text.dart';
import 'package:flutter/material.dart';

class HorizontalButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double width;
  final double height;
  final double borderRadius;
  final Color backgroundColor;
  final Color? bordercolor;
  final FontWeight textWeight;
  final Color textColor;
  final IconData? icon;

  HorizontalButton({
    required this.onPressed,
    required this.text,
    this.width = 300,
    this.height = 57,
    this.borderRadius = 10,
    this.backgroundColor = const Color.fromARGB(255, 112, 148, 255),
    this.textWeight = FontWeight.w700,
    this.textColor = Colors.white,
    this.bordercolor,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.hovered))
                return backgroundColor
                    .withOpacity(0.85); // Lighter shade when hovered
              return backgroundColor; // Default color
            },
          ),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              side: bordercolor != null
                  ? BorderSide(color: bordercolor!)
                  : BorderSide.none,
            ),
          ),
          overlayColor: WidgetStateProperty.resolveWith<Color>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed))
                return Colors.white
                    .withOpacity(0.3); // White overlay when pressed
              return Colors.transparent; // Default
            },
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Icon(icon, color: textColor), // Icon for better alignment
            if (icon != null) SizedBox(width: 8), // Space between text and icon
            MyText(
              text: text,
              weight: textWeight,
              color: textColor,
            ),
          ],
        ),
      ),
    );
  }
}
