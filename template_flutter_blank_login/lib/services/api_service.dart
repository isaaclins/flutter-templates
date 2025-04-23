import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://example.com/api';
  static const String loginEndpoint = '$baseUrl/login';
  static const String registerEndpoint = '$baseUrl/register';

  // Login method
  static Future<void> login(String username, String password) async {
    try {
      final Map<String, dynamic> data = {
        'username': username,
        'password': password,
      };

      // Log the request data
      print('Login Request: $data');

      // In a real app, you would send the request to the server
      // For now, we'll just simulate the request
      // final response = await http.post(
      //   Uri.parse(loginEndpoint),
      //   headers: {'Content-Type': 'application/json'},
      //   body: jsonEncode(data),
      // );

      // Simulate a successful response
      print('Login request sent to $loginEndpoint');
      print('Response would be processed here');
    } catch (e) {
      print('Error during login: $e');
      rethrow;
    }
  }

  // Register method
  static Future<void> register(
    String username,
    String email,
    String password,
  ) async {
    try {
      final Map<String, dynamic> data = {
        'username': username,
        'email': email,
        'password': password,
      };

      // Log the request data
      print('Registration Request: $data');

      // In a real app, you would send the request to the server
      // For now, we'll just simulate the request
      // final response = await http.post(
      //   Uri.parse(registerEndpoint),
      //   headers: {'Content-Type': 'application/json'},
      //   body: jsonEncode(data),
      // );

      // Simulate a successful response
      print('Registration request sent to $registerEndpoint');
      print('Response would be processed here');
    } catch (e) {
      print('Error during registration: $e');
      rethrow;
    }
  }
}
