import 'package:flutter/material.dart';
import 'package:hpn_pay_project_avestan/constants/app_colors.dart';
import 'package:velocity_x/velocity_x.dart';

Widget buildListTile({
  required String icon,
  required String title,
  required void Function() onTap,
  required bool selected,
  bool leading = false, // Add 'leading' parameter with a default value
  Widget? trailing, // Add 'trailing' parameter as an optional Widget
}) {
  return ListTile(
    leading: leading
        ? Icon(
      Icons.arrow_forward_ios,
      color: blackColor,
      size: 14,
    )
        : null, // Show arrow icon if 'leading' is true
    title: Row(
      children: [
        Image.asset(
          icon,
          height: 30,
          width: 30,
        )
            .box
            .color(selected ? Colors.blue : Colors.grey.withOpacity(0.1))
            .roundedSM
            .make(),
        5.widthBox,
        title.text.size(16).make(),
      ],
    ),
    onTap: onTap,
    trailing: trailing, // Use the 'trailing' parameter
  );
}
