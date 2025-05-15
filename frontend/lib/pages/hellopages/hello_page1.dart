import 'package:flutter/material.dart';
import 'hello_page2.dart';

class HelloPage1 extends StatelessWidget {
  const HelloPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: Text("Dobrodošao! Ovo je strana 1")),
      bottomNavigationBar: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const HelloPage2()));
        },
        child: const Text("Next"),
      ),
    );
  }
}
