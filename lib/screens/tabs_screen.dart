import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'screens.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/tabsscreen';

  const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Widget> _pages = const [
    HomeScreen(),
    ShareScreen(),
    FavoriteScreen(),
    UserScreen(),
  ];

  int selectedIndex = 0;

  void selectPageIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        onTap: selectPageIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: selectedIndex,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey[300],
        type: BottomNavigationBarType.fixed,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Transform.rotate(
              angle: 300 * math.pi / 180,
              child: const Icon(
                Icons.send_outlined,
              ),
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_outline,
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
