import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomDropdown<T> extends StatelessWidget {
  final String hintText;
  final T? value;
  final List<T> items;
  final ValueChanged<T?> onChanged;
  final BorderRadius? borderRadius;
  final String? Function(T?)? validator;

  CustomDropdown({
    required this.hintText,
    required this.value,
    required this.items,
    required this.onChanged,
    this.borderRadius,
    this.validator
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(8.0), // Make the border circular
        ),
        hintText: hintText,
      ),
      value: value,
      items: items.map((item) {
        return DropdownMenuItem<T>(
          value: item,
          child: Text(item.toString()),
        );
      }).toList(),
      onChanged: onChanged,
      validator: (selectedValue) {
        if (validator != null) {
          // If a custom validation function is provided, use it.
          return validator!(selectedValue);
        }
        // If no custom validation function is provided, return null (no error).
        return null;
      },
    );
  }
}
