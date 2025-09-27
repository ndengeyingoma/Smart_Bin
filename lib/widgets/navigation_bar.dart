import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onLoginPressed;
  final bool isAuthenticated;
  final VoidCallback onLogoutPressed;

  CustomAppBar({
    required this.title,
    required this.onLoginPressed,
    required this.isAuthenticated,
    required this.onLogoutPressed,
  });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [
        if (!isAuthenticated)
          TextButton.icon(
            onPressed: onLoginPressed,
            icon: Icon(Icons.login, color: Colors.white),
            label: Text('Login', style: TextStyle(color: Colors.white)),
          )
        else
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: onLogoutPressed,
            tooltip: 'Logout',
          ),
      ],
    );
  }
}
