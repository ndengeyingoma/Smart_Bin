import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/auth_service.dart';
import '../../models/bin_model.dart';
import 'bin_list_section.dart';
import 'user_management_section.dart';
import '../landing/landing_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await authService.logout();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const LandingPage()),
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome back, ${authService.user?.username ?? 'User'}!',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text('Role: ${authService.user?.role ?? 'Unknown'}'),
            const SizedBox(height: 20),
            if (authService.isAdmin) const UserManagementSection(),
            Expanded(child: BinListSection(bins: mockBins)),
          ],
        ),
      ),
    );
  }
}
