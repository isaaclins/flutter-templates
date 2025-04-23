import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../services/ui_config.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // Form controllers and state
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        await ApiService.register(
          _usernameController.text.trim(),
          _emailController.text.trim(),
          _passwordController.text,
        );

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(UIConfig.registerSuccessMessage)),
          );
          // Navigate back to login screen after successful registration
          Navigator.pop(context);
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('${UIConfig.registerFailureMessage}$e')),
          );
        }
      } finally {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(UIConfig.registerAppBarTitle)),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(UIConfig.formPadding),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(
                  UIConfig.registerHeaderIcon,
                  size: UIConfig.iconSize,
                  color: UIConfig.primaryColor,
                ),
                SizedBox(height: UIConfig.headerSpacing),
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: UIConfig.registerUsernameLabel,
                    prefixIcon: Icon(UIConfig.usernameIcon),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        UIConfig.borderRadius,
                      ),
                    ),
                    contentPadding: EdgeInsets.all(UIConfig.fieldPadding),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return UIConfig.emptyUsernameError;
                    }
                    return null;
                  },
                ),
                SizedBox(height: UIConfig.verticalSpacing),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: UIConfig.registerEmailLabel,
                    prefixIcon: Icon(UIConfig.emailIcon),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        UIConfig.borderRadius,
                      ),
                    ),
                    contentPadding: EdgeInsets.all(UIConfig.fieldPadding),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return UIConfig.emptyEmailError;
                    }
                    if (!UIConfig.emailRegex.hasMatch(value)) {
                      return UIConfig.invalidEmailError;
                    }
                    return null;
                  },
                ),
                SizedBox(height: UIConfig.verticalSpacing),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: UIConfig.registerPasswordLabel,
                    prefixIcon: Icon(UIConfig.passwordIcon),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        UIConfig.borderRadius,
                      ),
                    ),
                    contentPadding: EdgeInsets.all(UIConfig.fieldPadding),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return UIConfig.emptyPasswordError;
                    }
                    // TODO: Add custom password strength validation
                    if (value.length < UIConfig.passwordMinimalLength) {
                      return UIConfig.passwordLengthError;
                    }
                    return null;
                  },
                ),
                SizedBox(height: UIConfig.verticalSpacing),
                TextFormField(
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(
                    labelText: UIConfig.registerConfirmPasswordLabel,
                    prefixIcon: Icon(UIConfig.confirmPasswordIcon),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        UIConfig.borderRadius,
                      ),
                    ),
                    contentPadding: EdgeInsets.all(UIConfig.fieldPadding),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return UIConfig.emptyConfirmPasswordError;
                    }
                    if (value != _passwordController.text) {
                      return UIConfig.passwordMatchError;
                    }
                    return null;
                  },
                ),
                SizedBox(height: UIConfig.verticalSpacing * 1.5),
                ElevatedButton(
                  onPressed: _isLoading ? null : _register,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      vertical: UIConfig.buttonVerticalPadding,
                    ),
                    backgroundColor: UIConfig.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        UIConfig.borderRadius,
                      ),
                    ),
                  ),
                  child:
                      _isLoading
                          ? const CircularProgressIndicator()
                          : Text(
                            UIConfig.registerButtonText,
                            style: TextStyle(
                              fontSize: UIConfig.buttonFontSize,
                              color: UIConfig.buttonTextColor,
                            ),
                          ),
                ),
                SizedBox(height: UIConfig.verticalSpacing),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    UIConfig.registerLoginLinkText,
                    style: TextStyle(color: UIConfig.linkTextColor),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
