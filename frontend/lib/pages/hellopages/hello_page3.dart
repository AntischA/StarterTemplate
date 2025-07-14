// hello_page3.dart
import 'package:flutter/material.dart';
import 'hello_page4.dart';

class HelloPage3 extends StatelessWidget {
  const HelloPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: Text("Dobrodošao! Ovo je strana 3")),
      bottomNavigationBar: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const HelloPage4()));
        },
        child: const Text("Next"),
      ),
    );
  }
}
