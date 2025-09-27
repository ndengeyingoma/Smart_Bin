import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';

class AuthService with ChangeNotifier {
  User? _user;
  bool _isLoading = false;

  User? get user => _user;
  bool get isLoading => _isLoading;
  bool get isAuthenticated => _user != null;
  bool get isAdmin => _user?.role == 'admin';

  Future<void> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    // Simulate API call
    await Future.delayed(Duration(seconds: 2));

    // Mock login - replace with actual API call
    if (email == 'admin@smartbin.com' && password == 'admin123') {
      _user = User(
        id: '1',
        username: 'Admin User',
        email: email,
        role: 'admin',
        token: 'mock_jwt_token',
      );
    } else if (email == 'user@smartbin.com' && password == 'user123') {
      _user = User(
        id: '2',
        username: 'Regular User',
        email: email,
        role: 'user',
        token: 'mock_jwt_token',
      );
    } else {
      throw Exception('Invalid credentials');
    }

    // Save to shared preferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', _user!.toJson().toString());

    _isLoading = false;
    notifyListeners();
  }

  Future<void> logout() async {
    _user = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user');
    notifyListeners();
  }

  Future<void> loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userString = prefs.getString('user');
    if (userString != null) {
      // Parse user data (simplified)
      _user = User(
        id: '1',
        username: 'Saved User',
        email: 'saved@user.com',
        role: 'user',
        token: 'saved_token',
      );
    }
    notifyListeners();
  }
}
