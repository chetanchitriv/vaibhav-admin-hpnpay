import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hpn_pay_project_avestan/constants/app_colors.dart';

Widget CustomFormField({
  required TextEditingController controller,
  required String label,
  String? hintText,
  BorderRadius? borderRadius,
  double? width,
  double? height,
  bool obscureText = false,
  Color cursorColor = Colors.grey,
  Widget? child,
  String? Function(String?)? validator,
  TextInputType? inputType, // Make it optional
  List<TextInputFormatter>? inputFormatters, // Make it optional
}) {
  return TextFormField(
    obscureText: obscureText,
    controller: controller,
    keyboardType: inputType, // Set the input type
    inputFormatters: inputFormatters, // Set the input formatters
    decoration: InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.never,
      contentPadding: EdgeInsets.symmetric(vertical: height ?? 20.0, horizontal: width ?? 20.0),
      labelText: label,
      labelStyle: TextStyle(
        color: AppColor.secondarySoft,
        fontSize: 14,
      ),
      hintText: hintText,
      hintStyle: TextStyle(
        fontSize: 14,
        fontFamily: 'poppins',
        fontWeight: FontWeight.w500,
        color: AppColor.secondarySoft,
      ),
      border: OutlineInputBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(4.0),
        borderSide: BorderSide(
          color: Colors.black.withOpacity(0.1),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(4.0),
        borderSide: BorderSide(
          color: Colors.black.withOpacity(0.4),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(4.0),
        borderSide: BorderSide(
          color: Colors.black.withOpacity(0.1),
        ),
      ),
      suffixIcon: child,
    ),
    cursorColor: cursorColor,
    validator: (value) {
      if (validator != null) {
        return validator(value);
      }
      return null;
    },
  );
}
