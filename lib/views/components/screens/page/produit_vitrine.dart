import 'package:flutter/material.dart';

class ProduitVitrine extends StatefulWidget {
  const ProduitVitrine({super.key});

  @override
  State<ProduitVitrine> createState() => _ProduitVitrineState();
}

class _ProduitVitrineState extends State<ProduitVitrine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Produit Vitrine")));
  }
}
