import 'package:flutter/material.dart';
import 'package:flutter_keychain/flutter_keychain.dart';
import '../apiservices/login_api.dart';
import '../models/user.dart';

class AuthProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  User? _user;
  String? _token;
  bool _isAuthenticated = false;

  User? get user => _user;
  bool get isAuthenticated => _isAuthenticated;

  // Attempt login and update authentication state
  Future<void> login(String email, String password) async {
    try {
      final response = await _apiService.login(email, password);

      if (response['success']) {
        // Parse user data and token from the response
        _user = User.fromJson(response['user']); // Directly pass `user` from API response
        _token = response['token']; // Ensure token exists in the response

        if (_token != null) {
          // Save token securely
          await FlutterKeychain.put(key: 'token', value: _token!);
        }

        // Update authentication state
        _isAuthenticated = true;
        notifyListeners();
      } else {
        throw Exception(response['message'] ?? "Login failed.");
      }
    } catch (e) {
      _isAuthenticated = false;
      notifyListeners();
      throw Exception("Login failed: $e");
    }
  }
}
