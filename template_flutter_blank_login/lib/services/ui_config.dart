import 'package:flutter/material.dart';

/// UI Configuration class with all customizable parameters
/// for login and registration screens
class UIConfig {
  // Form validation parameters
  static final int passwordMinimalLength = 12;
  static final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  // UI Customization - Sizes
  static final double iconSize = 100.0;
  static final double verticalSpacing = 16.0;
  static final double headerSpacing = 32.0;
  static final double buttonVerticalPadding = 16.0;
  static final double formPadding = 16.0;
  static final double buttonFontSize = 16.0;
  static final double borderRadius = 8.0;
  static final double fieldPadding = 16.0;

  // UI Customization - Colors
  static final Color primaryColor = Colors.blue;
  static final Color accentColor = Colors.blue.shade700;
  static final Color errorColor = Colors.red.shade700;
  static final Color successColor = Colors.green.shade600;
  static final Color buttonTextColor = Colors.white;
  static final Color linkTextColor = Colors.purple;

  // Login screen text content
  static final String loginAppBarTitle = 'Login';
  static final String loginUsernameLabel = 'Username or Email';
  static final String loginPasswordLabel = 'Password';
  static final String loginButtonText = 'LOGIN';
  static final String loginRegisterLinkText =
      'Don\'t have an account? Register';
  static final String loginSuccessMessage =
      'Login successful! Check console for details.';
  static final String loginFailureMessage = 'Login failed: ';

  // Register screen text content
  static final String registerAppBarTitle = 'Register';
  static final String registerUsernameLabel = 'Username';
  static final String registerEmailLabel = 'Email';
  static final String registerPasswordLabel = 'Password';
  static final String registerConfirmPasswordLabel = 'Confirm Password';
  static final String registerButtonText = 'REGISTER';
  static final String registerLoginLinkText = 'Already have an account? Login';
  static final String registerSuccessMessage =
      'Registration successful! Check console for details.';
  static final String registerFailureMessage = 'Registration failed: ';

  // Validation error messages
  static final String emptyUsernameError = 'Please enter your username';
  static final String emptyEmailError = 'Please enter an email';
  static final String invalidEmailError = 'Please enter a valid email';
  static final String emptyPasswordError = 'Please enter your password';
  static final String passwordLengthError =
      'Password must be at least $passwordMinimalLength characters!';
  static final String passwordMatchError = 'Passwords do not match';
  static final String emptyConfirmPasswordError =
      'Please confirm your password';

  // Icons for form fields
  static final IconData usernameIcon = Icons.person;
  static final IconData emailIcon = Icons.email;
  static final IconData passwordIcon = Icons.lock;
  static final IconData confirmPasswordIcon = Icons.lock_outline;
  static final IconData loginHeaderIcon = Icons.account_circle;
  static final IconData registerHeaderIcon = Icons.app_registration;
}
