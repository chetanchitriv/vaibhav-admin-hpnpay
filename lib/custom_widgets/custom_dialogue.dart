import 'package:flutter/material.dart';
import 'package:hpn_pay_project_avestan/custom_widgets/custom_button.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final Widget? child;
  final double radius;
  final VoidCallback? onConfirm;
  final String? content;

  CustomDialog({
    required this.title,
    this.child,
    this.content,
    this.radius = 8.0,
    this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (child != null) child!,
            if (content != null) Text(content!),
            if (title.isNotEmpty) ...[
              SizedBox(height: 16),
              Text(
                title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
            if (onConfirm != null)
              CustomButton(
              )
              // ElevatedButton(
              //   onPressed: () {
              //     onConfirm!();
              //     Navigator.of(context).pop();
              //   },
              //   child: Text("Confirm"),
              // ),
          ],
        ),
      ),
    );
  }
}
