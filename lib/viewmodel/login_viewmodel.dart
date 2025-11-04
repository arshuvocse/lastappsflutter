
import 'package:flutter/material.dart';
import '../data/database_helper.dart';
import '../model/user_model.dart';

class LoginViewModel with ChangeNotifier {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _loading = false;
  String? _errorMessage;

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  bool get loading => _loading;
  String? get errorMessage => _errorMessage;

  Future<bool> login() async {
    _loading = true;
    _errorMessage = null;
    notifyListeners();

    // Simulate a network request
    await Future.delayed(const Duration(seconds: 2));

    if (_emailController.text == 'Demo' &&
        _passwordController.text == '1234') {
      _errorMessage = null;
      // Save user to database
      await DatabaseHelper().saveUser(User(
        email: _emailController.text,
        password: _passwordController.text,
      ));
      _loading = false;
      notifyListeners();
      return true;
    } else {
      _errorMessage = 'Invalid email or password';
      _loading = false;
      notifyListeners();
      return false;
    }
  }
}
