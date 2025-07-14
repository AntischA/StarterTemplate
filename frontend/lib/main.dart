import 'package:flutter/material.dart';
import 'pages/auth/login_page.dart';
import 'pages/home/home_page.dart';
import 'pages/hellopages/hello_page1.dart';
import 'services/app_state_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<Widget> _determineStartPage() async {
    final service = AppStateService();

    final welcomeSeen = await service.isWelcomeSeen;
    final registered = await service.isRegistered;

    if (!welcomeSeen) return const HelloPage1();
    if (!registered) return const LoginPage();

    return const HomePage();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Starter App',
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<Widget>(
        future: _determineStartPage(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
          return snapshot.data!;
        },
      ),
    );
  }
}
