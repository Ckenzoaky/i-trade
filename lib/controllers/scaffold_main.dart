/*import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:i_trade/views/pages/home_page.dart';
import 'package:i_trade/views/pages/shop_page.dart';

class ScaffoldMain extends StatefulWidget {
  const ScaffoldMain({super.key});

  @override
  State<ScaffoldMain> createState() => _ScaffoldMainState();
}

class _ScaffoldMainState extends State<ScaffoldMain> {
  //liste pour les pages de l'application
  //appelation des pages par route nommee
  final List<Widget> _pages = [HomePage(), ShopPage()];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey.shade300,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.black,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black, size: 30),
            activeIcon: FaIcon(
              FontAwesomeIcons.check,
              color: Colors.deepPurple,
              size: 20,
            ),
            label: 'Vitrine',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.store, color: Colors.black, size: 30),
            label: 'Store',
            activeIcon: FaIcon(
              FontAwesomeIcons.check,
              color: Colors.deepPurple,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}*/
