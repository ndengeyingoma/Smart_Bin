import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/auth_service.dart';
import '../../models/bin_model.dart';
import 'bin_list_section.dart';
import 'user_management_section.dart';

class DashboardPage extends StatelessWidget {
  final List<Bin> mockBins = [
    Bin(
      id: '1',
      name: 'Main Street Bin',
      location: 'Downtown',
      fillLevel: 75.0,
      status: 'Almost Full',
      lastUpdated: DateTime.now(),
    ),
    Bin(
      id: '2',
      name: 'Park Bin',
      location: 'Central Park',
      fillLevel: 30.0,
      status: 'Moderate',
      lastUpdated: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => authService.logout(),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'Welcome back, ${authService.user?.username ?? 'User'}!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Role: ${authService.user?.role}'),
            SizedBox(height: 20),
            if (authService.isAdmin) UserManagementSection(),
            Expanded(child: BinListSection(bins: mockBins)),
          ],
        ),
      ),
    );
  }
}
