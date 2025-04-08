import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:i_trade/views/components/screens/catalog_card.dart';
import 'package:i_trade/views/components/screens/demo_data.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    //    double width = MediaQuery.of(context).size.width;
    //   double height = MediaQuery.of(context).size.height;
    return Scaffold(
      //BARRE DE NAVIGATION TOP
      appBar: AppBar(
        actionsPadding: EdgeInsets.fromLTRB(10, 0, 10, 10),
        title: Text(
          'I-Store',
          style: GoogleFonts.asap(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 5,
        //CREATION DES BOUTONS DE NAVIGATION AU TOP
        //MISE EN PLACE DE CONTENEUR GENERAL
        actions: [
          Container(
            padding: const EdgeInsets.all(0),
            margin: const EdgeInsets.all(0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 2,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            //PREMIER BOUTON DE RECHERCHE
            child: Padding(
              padding: EdgeInsets.all(0),
              child: IconButton(
                icon: Icon(Icons.search, color: Colors.black),
                onPressed: () {
                  // Ajoutez ici la logique de recherche
                },
              ),
            ),
          ),
          //DEUXIEME BOUTON FILTRE
          Padding(
            padding: EdgeInsets.all(0),
            child: IconButton(
              icon: Icon(Icons.filter_list_alt, color: Colors.black),
              onPressed: () {
                // Ajoutez ici la logique de recherche
              },
            ),
          ),
        ],
      ),
      //CORPS DE CODE AVEC LE WIDGET GRIDVIEW POUR AFFICHER LES ELEMENTS DANS UNE GRILLE
      body: GridView(
        //MISE EN PLACE DE LA GRILLE ET DES ELEMENTS
        padding: EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          childAspectRatio: 0.61,
          mainAxisSpacing: 15,
        ),
        // APPELLE DE LA CLASS CATALOGCARD POUR AFFICHER LES ELEMENTS DANS LA GRILLE
        // POUR MODIFIER LES ELEMENTS DANS LA GRILLE, ON VA CHANGER LES PARAMETRES DANS DEMO_DATA, CATALOG_CARD ET MENU_ITEM
        children:
            demoData.map((item) => CatalogCard(catalogItem: item)).toList(),
      ),
      
    );
  }
}
