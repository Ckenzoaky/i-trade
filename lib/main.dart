import 'package:flutter/material.dart';
import 'package:i_trade/controllers/my_produit_profil.dart';
import 'package:i_trade/controllers/scaffold_main.dart';
import 'package:i_trade/views/pages/get_started_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: GetStartedPage(),
      routes: {
        '/scaffold_main': (context) => ScaffoldMain(),
        '/my_produit_profil': (context) => MyProduitProfil(),
      },
    );
  }
}
