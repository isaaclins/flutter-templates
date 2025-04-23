import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  // App configuration
  static const String _appTitle =
      'Flutter Login Template'; // TODO: Customize app title
  static const MaterialColor _primaryColor =
      Colors.blue; // TODO: Customize primary color theme

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _appTitle,
      theme: ThemeData(
        primarySwatch: _primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const LoginScreen(),
    );
  }
}
