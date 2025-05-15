import 'package:flutter/material.dart';
import 'hello_page3.dart';

class HelloPage2 extends StatelessWidget {
  const HelloPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: Text("Dobrodošao! Ovo je strana 2")),
      bottomNavigationBar: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const HelloPage3()));
        },
        child: const Text("Next"),
      ),
    );
  }
}
