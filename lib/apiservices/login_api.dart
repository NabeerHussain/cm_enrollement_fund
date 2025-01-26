import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ApiService {
  final _baseUrl = "http://192.168.18.172:8000/api";

  // Login API
  Future<Map<String, dynamic>> login(String email, String password) async {
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
      body: jsonEncode({"login": email, "password": password}),
    );

    // Check the response status code
    if (response.statusCode == 200) {
      // Decode the response body
      final responseData = jsonDecode(response.body);

      // Ensure the response has the expected structure
      if (responseData["status"] == true && responseData.containsKey("user")) {
        final user = responseData["user"];

        // Check for required user fields
        if (user != null &&
            user.containsKey("name") &&
            user.containsKey("user_type")) {
          return {
            "success": true,
            "name": user["name"],
            "userType": user["user_type"],
          };
        } else {
          throw Exception("Invalid user data in response.");
        }
      } else {
        throw Exception(responseData["message"] ?? "Login failed.");
      }
    } else if (response.statusCode == 401) {
      throw Exception("Invalid email or password.");
    } else {
      throw Exception("Error: Login failed with status code ${response.statusCode}.");
    }
  } on SocketException {
    throw Exception("No internet connection. Please check your network.");
  } catch (e) {
    throw Exception("Error logging in: $e");
  }
}


  // Helper function to check internet connectivity
  Future<bool> _checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup("google.com");
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException {
      return false;
    }
  }
}
