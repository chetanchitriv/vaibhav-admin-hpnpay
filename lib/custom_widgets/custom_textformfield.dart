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
  bool readOnly = false,
  int? length,
  bool validator = true,
  String? Function(String)? customValidator,
  bool? isPanCard,
}) {
  if (length != null) {
    inputFormatters ??= <TextInputFormatter>[];
    inputFormatters.add(LengthLimitingTextInputFormatter(length));
  }

  String? Function(String?)? effectiveValidator = (String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }

    if (isPanCard == true) {
      // Validate as PAN card if isPanCard is true
      String? panCardError = validatePancard(value);
      if (panCardError != null) {
        return panCardError;
      }
    }

    if (customValidator != null) {
      String? customError = customValidator(value);
      if (customError != null) {
        return customError;
      }
    }

    return null;
  };

  return TextFormField(
    textCapitalization: textCapitalizationEnabled
        ? TextCapitalization.characters
        : TextCapitalization.none,
    obscureText: obscureText,
    controller: controller,
    keyboardType: inputType,
    inputFormatters: inputFormatters,
    readOnly: readOnly,
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
    validator: validator ? effectiveValidator : null,
  );
}

String? validatePancard(String value) {
  String pattern = r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$';
  RegExp regExp = RegExp(pattern);
  if (value.isEmpty) {
    return 'Please Enter Pancard Number';
  } else if (!regExp.hasMatch(value)) {
    return 'Please Enter Valid Pancard Number';
  }
  return null; // Return null for valid input
}

