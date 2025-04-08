import 'package:flutter/material.dart';


class MyProduitProfil extends StatefulWidget {
  const MyProduitProfil({super.key});

  @override
  State<MyProduitProfil> createState() => _MyProduitProfilState();
}

class _MyProduitProfilState extends State<MyProduitProfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text("Detail du produit et validation de l'acaht"),
      ),
    );
  }
}