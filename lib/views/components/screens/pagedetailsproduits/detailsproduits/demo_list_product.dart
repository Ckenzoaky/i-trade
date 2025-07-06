import 'package:flutter/material.dart';
import 'package:i_trade/controllers/my_produit_profil.dart';

import 'list_product_page.dart';

class DemoListProduct extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: 'PLAYSTATION 5',
      description: 'playstation 5',
      detailsproduits: 'Playstation 5 (PS4) Pro + 1 manette. \n Version 12.00',
      image: 'assets/images/playstation5.png',
      price: '250 000 FCFA',
    ),
    Product(
      name: 'Produit 2',
      description: 'Description du Produit 2',
      detailsproduits: 'Playstation 5 (PS4) Pro + 1 manette. \n Version 12.00',
      image: 'Image du produit 2',
      price: 'Price du Produit 1',
    ),
  ];
  DemoListProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Liste des produits')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            leading: Image.asset(product.image),
            title: Text(product.name),
            subtitle: Text(product.description),
            trailing: Text(product.price),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyProduitProfil(product: product),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
