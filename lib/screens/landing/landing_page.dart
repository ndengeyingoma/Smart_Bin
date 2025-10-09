import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/auth_service.dart';
import '../auth/login_page.dart';
import '../dashboard/dashboard_page.dart';
import 'home_section.dart';
import 'services_section.dart';
import 'partners_section.dart';
import 'contacts_section.dart';
import '../../widgets/footer_widget.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _currentIndex = 0;
  bool _isLoading = true;

  // ❌ Remove const — these widgets don’t have const constructors
  final List<Widget> _sections = [
    HomeSection(),
    ServicesSection(),
    PartnersSection(),
    ContactsSection(),
  ];

  final List<String> _sectionTitles = [
    'Smart Bin Monitoring System',
    'Our Services',
    'Our Partners',
    'Contact Us',
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        final authService = Provider.of<AuthService>(context, listen: false);
        await authService.loadUser();
      } catch (e) {
        debugPrint('Error loading user: $e');
      } finally {
        setState(() => _isLoading = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    if (_isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (authService.isAuthenticated) {
      return const DashboardPage();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_sectionTitles[_currentIndex]),
        actions: [
          TextButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => LoginPage()), // ❌ Remove const
            ),
            child: const Text('Login', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(child: _sections[_currentIndex]),
          FooterWidget(), // ❌ Remove const
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Services'),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Partners',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_page),
            label: 'Contacts',
          ),
        ],
      ),
    );
  }
}
