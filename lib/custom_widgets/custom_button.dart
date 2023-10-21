import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPress;
  final String? text;
  final Color? backgroundColor;
  final Color? textColor;
  final double? height;
  final double? width;
  final double? borderRadius;
  final double? textSize;
  final Widget? child; // Added child property
  final double? elevation; // Added elevation property

  const CustomButton({
    super.key,
    this.onPress,
    this.text,
    this.backgroundColor,
    this.textColor,
    this.height,
    this.width,
    this.borderRadius,
    this.textSize = 16.0,
    this.child, // Added child property
    this.elevation, // Added elevation property
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation:
          elevation ?? 0, // Apply elevation, default to 0 if not provided
      borderRadius: BorderRadius.circular(borderRadius ?? 0),
      color: backgroundColor,
      child: InkWell(
        onTap: onPress,
        child: Container(
          width: width,
          height: height,
          alignment: Alignment.center,
          child: child ??
              Text(
                text ?? '',
                style: TextStyle(color: textColor, fontWeight: FontWeight.bold,fontSize: textSize, ),
              ),
        ),
      ),
    );
  }
}
