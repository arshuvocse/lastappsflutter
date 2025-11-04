
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../viewmodel/login_viewmodel.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Method to handle login logic and navigation
  Future<void> _login(LoginViewModel viewModel) async {
    final success = await viewModel.login();
    if (!mounted) return; // Guard against async gap
    if (success) {
      // Use the context from the state, which is safe after the 'mounted' check
      GoRouter.of(context).go('/data-sync');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginViewModel(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF7F7F7),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Consumer<LoginViewModel>(
              builder: (context, viewModel, child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1A3D8A),
                      ),
                    ),
                    const SizedBox(height: 50),
                    _buildTextField(
                      context,
                      label: 'Email',
                      icon: Icons.person_outline,
                      controller: viewModel.emailController,
                    ),
                    const SizedBox(height: 20),
                    _buildTextField(
                      context,
                      label: 'Password',
                      icon: Icons.lock_outline,
                      obscureText: true,
                      controller: viewModel.passwordController,
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(color: Color(0xFF1A3D8A)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    if (viewModel.errorMessage != null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          viewModel.errorMessage!,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                    viewModel.loading
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: viewModel.loading ? null : () => _login(viewModel),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF1A3D8A),
                              minimumSize: const Size(double.infinity, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              'LOGIN',
                              style: TextStyle(
                                  fontSize: 18, color: Colors.white),
                            ),
                          ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    BuildContext context,
      {required String label, required IconData icon, bool obscureText = false, required TextEditingController controller}) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.grey),
        prefixIcon: Icon(icon, color: Colors.grey),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
