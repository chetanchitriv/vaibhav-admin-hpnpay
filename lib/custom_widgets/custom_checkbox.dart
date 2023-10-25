import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final bool? value;
  final String? label;
  final ValueChanged<bool?>? onChanged;
  final Color activeColor;
  final BorderRadius borderRadius;

  CustomCheckbox({
    this.value,
    this.label,
    this.onChanged,
    this.activeColor = Colors.green,
    this.borderRadius = BorderRadius.zero,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onChanged != null) {
          onChanged!(!(value ?? false)); // Toggle the value
        }
      },
      child: Row(
        children: [
          Checkbox(
            activeColor: activeColor,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius,
            ),
            value: value ?? false,
            onChanged: onChanged,
          ),
          if (label != null) Text(label!),
        ],
      ),
    );
  }
}
