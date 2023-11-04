import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomRichText extends StatelessWidget {
  final String text;
  final Color textColor;
  final bool showAsterisk;
  final String? toolTipMessage;

  CustomRichText({
    required this.text,
    this.textColor = Colors.black,
    this.showAsterisk = false,
    this.toolTipMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: text,
                style: TextStyle(color: textColor),
              ),
              if (showAsterisk)
                TextSpan(
                  text: ' *',
                  style: TextStyle(color: Colors.red),
                ),
            ],
          ),
        ),
        Gap(4),
        if (toolTipMessage != null)
          Tooltip(
            preferBelow: false,
            message: toolTipMessage!,
            child: Icon(
              Icons.help,
              color: Colors.grey,
              size: 16,
            ),
            triggerMode: TooltipTriggerMode.tap,

          ),
      ],
    );
  }


}
