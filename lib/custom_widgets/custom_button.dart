import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPress;
  final bool isLoading;
  final String? text;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final double? height;
  final double? width;
  final double? borderRadius;
  final double? textSize;
  final Widget? child;
  final double? elevation;
  final EdgeInsetsGeometry? padding;

  CustomButton({
    Key? key,
    this.onPress,
    this.isLoading = false,
    this.text,
    this.backgroundColor,
    this.textColor,
    this.height,
    this.width,
    this.borderRadius,
    this.textSize = 16.0,
    this.child,
    this.elevation,
    this.padding,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation ?? 0,
      child: InkWell(
        onTap: isLoading ? null : onPress,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: borderColor ?? Colors.transparent),
            borderRadius: BorderRadius.circular(borderRadius ?? 0),
            color: backgroundColor,
          ),
          width: width,
          height: height,
          padding: padding,
          alignment: Alignment.center,
          child: isLoading
              ? Center(
            child: SizedBox(
              height: 30,
              width: 30,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: textColor ?? Colors.white,
              ),
            ),
          )
              : (child ?? Text(
            text ?? '',
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: textSize,
            ),
          )),
        ),
      ),
    );
  }
}
