import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ApiService {
  final String _baseUrl = "http://192.168.18.172:8000/api";

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final url = Uri.parse("$_baseUrl/login");

      final response = await http
          .post(
            url,
            headers: {"Content-Type": "application/json"},
            body: jsonEncode({"login": email, "password": password}),
          )
          .timeout(
            const Duration(seconds: 25),
            onTimeout: () {
              throw Exception("The connection timed out. Please try again later.");
            },
          );

      print("Response Status: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        if (responseData["status"] == true) {
          return {
            "success": true,
            "user": responseData["user"],
            "token": responseData["token"], // Ensure token is included in the response
          };
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
}
