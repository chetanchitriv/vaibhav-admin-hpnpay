import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final bool? value;
  final String? label;
  final ValueChanged<bool?>? onChanged;
  final Color activeColor;
  final BorderRadius borderRadius;
  final bool isReadOnly; // New field for readonly
  final bool showLabel;

  CustomCheckbox({
    this.value,
    this.label,
    this.onChanged,
    this.activeColor = Colors.green,
    this.borderRadius = BorderRadius.zero,
    this.isReadOnly = false, // Default value is false
    this.showLabel = true, // Show label by default
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!isReadOnly && onChanged != null) {
          onChanged!(!(value ?? false)); // Toggle the value if not read-only
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
            onChanged: isReadOnly ? null : onChanged, // Disable onChanged if read-only
          ),
          if (showLabel && label != null) Text(label!),
        ],
      ),
    );
  }
}
