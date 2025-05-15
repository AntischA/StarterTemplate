import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../auth/login_page.dart';

class HelloPage4 extends StatelessWidget {
  const HelloPage4({super.key});

  void goToLogin(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_welcome_seen', true);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: Text("Zadnja strana - 4")),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () => goToLogin(context),
          child: const Text("Next"),
        ),
      ),
    );
  }
}
