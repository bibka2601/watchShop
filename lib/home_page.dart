import 'package:flutter/material.dart';
import 'package:smart_watches_shop/pages/cart_screen.dart';
import 'package:smart_watches_shop/pages/notofication.dart';
import 'package:smart_watches_shop/pages/main_screen.dart';
import 'package:smart_watches_shop/pages/settings_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;

  void naviagteBottomBar(int index) {
    _selectedIndex = index;
    setState(() {
      
    });
  }
    
  final List<Widget> _pages = [
    MainScreen(),
    CartScreen(),
    NotificationScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.pink,
        onTap: naviagteBottomBar,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_bag,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.message,
            ),
            label: 'Notifications'
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
            ),
            label: 'settings'
          ),
        ],
      ),
      body: _pages[_selectedIndex],
    );
  }
}