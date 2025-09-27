import 'package:flutter/material.dart';

class UserManagementSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'User Management (Admin Only)',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        ElevatedButton(onPressed: () {}, child: Text('Add User')),
        SizedBox(height: 10),
      ],
    );
  }
}
