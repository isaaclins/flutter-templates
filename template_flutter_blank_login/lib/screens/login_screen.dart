import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../services/ui_config.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Form controllers and state
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        await ApiService.login(
          _usernameController.text.trim(),
          _passwordController.text,
        );

        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(UIConfig.loginSuccessMessage)));
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('${UIConfig.loginFailureMessage}$e')),
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
      appBar: AppBar(title: Text(UIConfig.loginAppBarTitle)),
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
                  UIConfig.loginHeaderIcon,
                  size: UIConfig.iconSize,
                  color: UIConfig.primaryColor,
                ),
                SizedBox(height: UIConfig.headerSpacing),
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: UIConfig.loginUsernameLabel,
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
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: UIConfig.loginPasswordLabel,
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
                    return null;
                  },
                ),
                SizedBox(height: UIConfig.verticalSpacing * 1.5),
                ElevatedButton(
                  onPressed: _isLoading ? null : _login,
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
                            UIConfig.loginButtonText,
                            style: TextStyle(
                              fontSize: UIConfig.buttonFontSize,
                              color: UIConfig.buttonTextColor,                              
                            ),
                          ),
                ),
                SizedBox(height: UIConfig.verticalSpacing),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterScreen(),
                      ),
                    );
                  },
                  child: Text(UIConfig.loginRegisterLinkText),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
