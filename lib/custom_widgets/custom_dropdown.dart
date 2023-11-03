import 'package:flutter/material.dart';

class CustomDropdown<T> extends StatelessWidget {
  final String hintText;
  final T? value;
  final List<T> items;
  final ValueChanged<T?> onChanged;
  final BorderRadius? borderRadius;
  final String? Function(T?)? validator;
  final bool isReadOnly;


  CustomDropdown({
    required this.hintText,
    required this.value,
    required this.items,
    required this.onChanged,
    this.borderRadius,
    this.validator,
    this.isReadOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50, // Set the desired height
      width: double.infinity, // Set the desired width
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(4.0),
        border: Border.all(color: Colors.black.withOpacity(0.1)), // Add a grey border
      ),
      child: DropdownButtonFormField<T>(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10), // Add padding to the text
          border: InputBorder.none, // Remove the default border
        ),
        icon: Icon(Icons.keyboard_arrow_down_outlined), // Change the dropdown icon
        hint: Text(hintText),
        value: value,
        items: items.map((item) {
          return DropdownMenuItem<T>(
            value: item,
            child: Text(item.toString()),
          );
        }).toList(),
        onChanged: isReadOnly ? null : onChanged,
        validator: (selectedValue) {
          if (validator != null) {
            // If a custom validation function is provided, use it.
            return validator!(selectedValue);
          }
          // If no custom validation function is provided, return null (no error).
          return null;
        },
      ),
    );
  }
}
