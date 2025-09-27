import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/auth_service.dart';
import '../auth/login_page.dart';
import '../dashboard/dashboard_page.dart';
import 'home_section.dart';
import 'services_section.dart';
import '../landing/parterns_section.dart';
import 'contacts_section.dart';
import '../../widgets/footer_widget.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _currentIndex = 0;

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
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    if (authService.isAuthenticated) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => DashboardPage()),
        );
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_sectionTitles[_currentIndex]),
        actions: [
          if (!authService.isAuthenticated)
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              ),
              child: Text('Login', style: TextStyle(color: Colors.white)),
            )
          else
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () => authService.logout(),
            ),
        ],
      ),
      body: Column(
        children: [
          Expanded(child: _sections[_currentIndex]),
          FooterWidget(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
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
