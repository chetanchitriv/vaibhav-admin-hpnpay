import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onBackTap;
  final Widget? leading;
  final String? title;
  final Color titleColor;
  final double titleFontSize;
  final Color backgroundColor;
  final Widget? child; // Add the child property

  CustomAppBar({
    this.onBackTap,
    this.leading,
    this.title,
    this.titleColor = Colors.black,
    this.titleFontSize = 20.0,
    this.backgroundColor = Colors.white,
    this.child, // Include the child parameter in the constructor
  });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    List<Widget> appBarActions = [];
    if (child != null) {
      appBarActions.add(child!);
    }

    return AppBar(
      elevation: 0,
      backgroundColor: backgroundColor,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          GestureDetector(
            onTap: () {
              if (onBackTap != null) {
                onBackTap!();
              }
            },
            child: leading ?? Container(),
          ),
          SizedBox(width: 8),
          Text(
            title ?? '',
            style: TextStyle(
              color: titleColor,
              fontSize: titleFontSize,
            ),
          ),
        ],
      ),
      actions: appBarActions,
    );
  }

}
