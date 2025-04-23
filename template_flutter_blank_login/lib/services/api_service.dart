import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://example.com/api';
  static const String loginEndpoint = '$baseUrl/login';
  static const String registerEndpoint = '$baseUrl/register';

  static Future<void> login(String username, String password) async {
    try {
      final Map<String, dynamic> data = {
        'username': username,
        'password': password,
      };
      print('Login Request: $data sent to $loginEndpoint');

      // TODO: Implement the login logic here
      // In a real app, you would send the request to the server
      // For now, we'll just simulate the request
      // final response = await http.post(
      //   Uri.parse(loginEndpoint),
      //   headers: {'Content-Type': 'application/json'},
      //   body: jsonEncode(data),
      // );

      // Simulate a successful response
      print('Response would be processed here');
    } catch (e) {
      print('Error during login: $e');
      rethrow;
    }
  }

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
      print('Registration Request: $data sent to $registerEndpoint');

      // TODO: Implement the registration logic here
      // In a real app, you would send the request to the server
      // For now, we'll just simulate the request
      // final response = await http.post(
      //   Uri.parse(registerEndpoint),
      //   headers: {'Content-Type': 'application/json'},
      //   body: jsonEncode(data),
      // );

      // Simulate a successful response
    } catch (e) {
      print('Error during registration: $e');
      rethrow;
    }
  }
}
