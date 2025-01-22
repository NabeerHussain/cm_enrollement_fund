import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter_keychain/flutter_keychain.dart';

class ApiService {
  final _baseUrl = "https://gbpay.pmrugb.gov.pk/api";

  // Login API
  Future<bool> login(String email, String password) async {
    try {
      // Check internet connectivity
      final connected = await _checkInternetConnection();
      if (!connected) {
        throw Exception("No internet connection. Please check your network.");
      }

      final url = Uri.parse("$_baseUrl/login");
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email, "password": password}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        await FlutterKeychain.put(key: "token", value: data["token"]);
        return true; // Login success
      } else if (response.statusCode == 401) {
        // Invalid credentials
        throw Exception("Invalid email or password.");
      } else {
        // Other errors
        throw Exception("Error: Login failed with status code ${response.statusCode}.");
      }
    } on SocketException {
      throw Exception("No internet connection. Please check your network.");
    } catch (e) {
      throw Exception("Error logging in: $e");
    }
  }

  // Fetch token
  Future<String?> getToken() async {
    try {
      return await FlutterKeychain.get(key: "token");
    } catch (e) {
      return null;
    }
  }

  // Logout API
  Future<void> logout() async {
    await FlutterKeychain.remove(key: "token");
  }

  // Helper function to check internet connectivity
  Future<bool> _checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException {
      return false;
    }
  }
}
