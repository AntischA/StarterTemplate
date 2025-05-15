import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/hellopages/hello_page1.dart';
import 'pages/home/home_page.dart';
import 'pages/auth/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.clear(); // Obriši sve spremljene vrijednosti
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  Future<Widget> getInitialPage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isRegistered = prefs.getBool('is_registered') ?? false;
    bool isWelcomeSeen = prefs.getBool('is_welcome_seen') ?? false;

    print('isRegistered: $isRegistered');
    print('isWelcomeSeen: $isWelcomeSeen');

    if (isRegistered) {
      return const HomePage();
    } else if (isWelcomeSeen) {
      return const LoginPage();
    } else {
      return const HelloPage1();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Onboarding',
      home: FutureBuilder<Widget>(
        future: getInitialPage(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return snapshot.data!;
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
