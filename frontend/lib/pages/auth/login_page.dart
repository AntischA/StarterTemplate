// login_page.dart
import 'package:flutter/material.dart';
import '../../services/app_state_service.dart';
import '../home/home_page.dart';
import 'register_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  void login(BuildContext context) async {
    await AppStateService().setRegistered();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const HomePage()),
    );
  }

  void loginAsGuest(BuildContext context) async {
    await AppStateService().setGuest();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    // UI kao što već imaš
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/login_illustration.jpg", height: 200),
              const SizedBox(height: 30),
              const Text(
                "Let’s you in",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              _socialButton("Continue with Facebook", Icons.facebook, Colors.blue),
              const SizedBox(height: 10),
              _socialButton("Continue with Google", Icons.g_mobiledata, Colors.red),
              const SizedBox(height: 10),
              _socialButton("Continue with Apple", Icons.apple, Colors.black),
              const SizedBox(height: 20),
              const Text("or", style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: Colors.green,
                ),
                onPressed: () => login(context),
                child: const Text("Sign in with Phone Number"),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () => loginAsGuest(context),
                child: const Text("Continue as Guest"),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don’t have an account?"),
                  TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const RegisterPage()),
                    ),
                    child: const Text("Sign Up"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _socialButton(String text, IconData icon, Color color) {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: color),
      label: Text(text, style: TextStyle(color: color)),
      style: OutlinedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        side: BorderSide(color: color),
      ),
    );
  }
}
