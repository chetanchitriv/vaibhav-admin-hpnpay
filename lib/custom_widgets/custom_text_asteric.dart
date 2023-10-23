import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  final String text;
  final Color textColor;
  final bool showAsterisk;

  CustomRichText({
    required this.text,
    this.textColor = Colors.black,
    this.showAsterisk = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: text,
            style: TextStyle(color: textColor),
          ),
          if (showAsterisk)
            TextSpan(
              text: ' *',
              style: TextStyle(color: Colors.red),
            ),
        ],
      ),
    );
  }
}
