import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/chats_screen.dart';
import 'screens/lab_screen.dart';
import 'theme.dart';

void main() => runApp(const TeyvatApp());

class TeyvatApp extends StatelessWidget {
  const TeyvatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teyvat Social',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: GenshinColors.night,
        colorScheme: const ColorScheme.dark(
          primary: GenshinColors.gold,
          surface: GenshinColors.card,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: GenshinColors.card,
          foregroundColor: GenshinColors.gold,
          centerTitle: true,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: GenshinColors.gold,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // El título del AppBar cambia según la sección activa.
  String _currentTitle() {
    switch (_selectedIndex) {
      case 0:
        return '✦ Teyvat Social';
      case 1:
        return 'Chats';
      default:
        return 'Laboratorio de widgets';
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_currentTitle()),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
        ],
      ),
      // IndexedStack mantiene el estado (likes, contador) al cambiar de sección.
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          HomeScreen(),
          ChatsScreen(),
          LaboratoryScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: GenshinColors.card,
        selectedItemColor: GenshinColors.gold,
        unselectedItemColor: Colors.white54,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble), label: 'Chats'),
          BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Laboratorio'),
        ],
      ),
    );
  }
}
