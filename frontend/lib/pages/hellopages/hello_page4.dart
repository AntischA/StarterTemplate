import 'package:flutter/material.dart';
import '../auth/login_page.dart';
import '../../services/app_state_service.dart';

class HelloPage4 extends StatelessWidget {
  const HelloPage4({super.key});

  void goToLogin(BuildContext context) async {
    await AppStateService().setWelcomeSeen();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
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
