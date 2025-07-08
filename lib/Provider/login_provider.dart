// login_provider.dart
import 'package:flutter/material.dart';
import 'package:islamicinstapp/screens/home_page.dart';

class LoginProvider with ChangeNotifier {
  bool _isLoading = false;
  bool _obscurePassword = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool get isLoading => _isLoading;
  bool get obscurePassword => _obscurePassword;

  void togglePasswordVisibility() {
    _obscurePassword = !_obscurePassword;
    notifyListeners();
  }

  Future<void> login(BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    // Simulate network call
    await Future.delayed(const Duration(seconds: 2));

    _isLoading = false;
    notifyListeners();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const HomePage()),
    );
  }
}