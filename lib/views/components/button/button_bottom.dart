import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class MyBottonBar extends StatefulWidget {
  const MyBottonBar(
    BuildContext context, {
    super.key,
    required int currentIndex,
  });

  @override
  State<MyBottonBar> createState() => _MyBottonBarState();
}

final List<Widget> _navigationItem = [
  const Icon(Icons.home),
  const Icon(Icons.shopping_bag),
];

class _MyBottonBarState extends State<MyBottonBar> {
  int currentIndex = 0;

  actualiser(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: currentIndex,
        onTap: (index) => {actualiser(index)},
        backgroundColor: Colors.white,
        color: Colors.deepPurple,
        items: _navigationItem,
      ),
    );
  }
}
