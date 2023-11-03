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
  TextInputType? inputType,
  List<TextInputFormatter>? inputFormatters,
  bool textCapitalizationEnabled = false,
  bool readOnly = false, // Make it optional
  int? length,
  bool validator = true,
  String? Function(String)? customValidator,
}) {
  if (length != null) {
    // If length is specified, add a LengthLimitingTextInputFormatter
    inputFormatters ??= <TextInputFormatter>[];
    inputFormatters.add(LengthLimitingTextInputFormatter(length));
  }
  return TextFormField(
    textCapitalization: textCapitalizationEnabled
        ? TextCapitalization.characters // Use words, sentences, or characters as needed
        : TextCapitalization.none,  obscureText: obscureText,
    controller: controller,
    keyboardType: inputType,
    inputFormatters: inputFormatters,
    readOnly: readOnly, // Set the readOnly property
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
      if (value == null || value.isEmpty) {
        return 'This field cannot be empty';
      }
      if (customValidator != null) {
        // Call the customValidator function for additional validation
        String? customError = customValidator(value);
        if (customError != null) {
          return customError;
        }
      }
      return null;
    },
  );
}
