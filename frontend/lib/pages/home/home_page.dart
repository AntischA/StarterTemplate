// home_page.dart
import 'package:flutter/material.dart';
import '../auth/login_page.dart';
import '../../services/app_state_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  Future<bool> _getGuestStatus() async => AppStateService().isGuest;

  Future<void> _logout(BuildContext context) async {
    await AppStateService().logout();
    if (context.mounted) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const LoginPage()),
            (route) => false,
      );
    }
  }

  /// Sadržaj za svaki tab ― po potrebi zameni pravim ekranima
  Widget _buildBody(bool isGuest) {
    switch (_currentIndex) {
      case 0:
        return Center(
          child: Text(
            isGuest ? 'Dobrodošao gostu!' : 'Dobrodošao kući!',
            style: const TextStyle(fontSize: 24),
          ),
        );
      case 1:
        return const Center(child: Text('Profil'));
      case 2:
        return const Center(child: Text('Podešavanja'));
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _getGuestStatus(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final isGuest = snapshot.data!;

        return Scaffold(
          // ------------------ APP BAR ------------------
          appBar: AppBar(
            title: const Text('Home'),
          ),

          // ------------------ DRAWER -------------------
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(color: Colors.blue),
                  child: Text('Meni', style: TextStyle(color: Colors.white)),
                ),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('Početna'),
                  selected: _currentIndex == 0,
                  onTap: () => setState(() => _currentIndex = 0),
                ),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('Profil'),
                  selected: _currentIndex == 1,
                  onTap: () => setState(() => _currentIndex = 1),
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Podešavanja'),
                  selected: _currentIndex == 2,
                  onTap: () => setState(() => _currentIndex = 2),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('Logout'),
                  onTap: () => _logout(context),
                ),
              ],
            ),
          ),

          // ------------------ BODY ---------------------
          body: _buildBody(isGuest),

          // -------- FLOATING ACTION BUTTON (FAB) -------
          //
          // ❗ FAB se PISE IZVAN `body`-ja, kao zasebna
          //    prop-a `floatingActionButton:`.   Scaffold
          //    se brine za pravilno pozicioniranje.
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // TODO: dodaj radnju
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('FAB pritisnut')),
              );
            },
            tooltip: 'Nova stavka',
            child: const Icon(Icons.add),
          ),

          // --------------- BOTTOM NAV BAR ---------------
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) => setState(() => _currentIndex = index),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profil',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Podešavanja',
              ),
            ],
          ),
        );
      },
    );
  }
}
