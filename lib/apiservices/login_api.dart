import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;


class ApiService {
  final _baseUrl = "http://192.168.18.218:8000/api";

  // Login API
  Future<String> login(String email, String password) async {
    try {
      // Check internet connectivity
      final connected = await _checkInternetConnection();
      if (!connected) {
        return "No internet connection. Please check your network.";
      }

      final url = Uri.parse("$_baseUrl/login");
      try {
        final response = await http
            .post(
              url,
              headers: {"Content-Type": "application/json"},
              body: jsonEncode({"login": email, "password": password}),
            )
            .timeout(const Duration(seconds: 30)); // Increased timeout duration

        if (response.statusCode == 200) {
          // final data = jsonDecode(response.body);
          // await FlutterKeychain.put(key: "token", value: data["token"]);
          return "success"; // Login success
        } else if (response.statusCode == 401) {
          return "Invalid email or password."; // Invalid credentials
        } else {
          return "Error: Login failed with status code ${response.statusCode}.";
        }
      } on TimeoutException {
        return "Connection timeout. The server is taking too long to respond. Please try again.";
      }
    } on SocketException {
      return "No internet connection. Please check your network.";
    } catch (e) {
      return "Error logging in: $e";
    }
  }

  // Fetch token
  // Future<String?> getToken() async {
  //   try {
  //     return await FlutterKeychain.get(key: "token");
  //   } catch (e) {
  //     return null;
  //   }
  // }

  // Logout API
  // Future<void> logout() async {
  //   await FlutterKeychain.remove(key: "token");
  // }

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
