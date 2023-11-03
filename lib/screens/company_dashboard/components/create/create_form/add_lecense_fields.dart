import 'package:flutter/material.dart';

class LicenseField extends StatelessWidget {
  final TextEditingController licenseNameController;
  final TextEditingController licenseNumberController;
  final VoidCallback onRemove;

  LicenseField({
    required this.licenseNameController,
    required this.licenseNumberController,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: licenseNameController,
            decoration: InputDecoration(
              labelText: 'License Name',
            ),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: TextFormField(
            controller: licenseNumberController,
            decoration: InputDecoration(
              labelText: 'License Number',
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.delete),
          onPressed: onRemove,
        ),
      ],
    );
  }
}
