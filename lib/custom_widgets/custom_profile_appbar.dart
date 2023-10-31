import 'package:flutter/material.dart';
import 'package:hpn_pay_project_avestan/constants/app_colors.dart';

class CustomProfileAppBar extends StatelessWidget implements PreferredSizeWidget{
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  CustomProfileAppBar({required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: InkWell(
        onTap: () {
          scaffoldKey.currentState!.openDrawer();
        },
        child: Image.asset('assets/icons/drawer.png'),
      ),
      title: Row(
        children: [
          const Spacer(),
          ClipRRect(
            child: Image.asset('assets/images/profile.jpg'),
          ),
          const SizedBox(width: 8),
          const Text(
            'Priya Sharma',
            style: TextStyle(
              color: primaryColor, // Assuming primaryColor is defined
              fontSize: 12,
            ),
          ),
          const SizedBox(width: 4),
          const Icon(
            Icons.keyboard_arrow_down,
            color: primaryColor,
            size: 16,
          ),
          const SizedBox(width: 8),
          Image.asset('assets/icons/notifications.png'),
        ],
      ),
    );
  }
}
