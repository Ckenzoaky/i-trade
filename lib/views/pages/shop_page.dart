import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:i_trade/views/components/screens/catalog_card.dart';
import 'package:i_trade/views/components/screens/demo_data.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //BARRE DE NAVIGATION TOP
      appBar: AppBar(
        title: Text(
          'I-Store',
          style: GoogleFonts.asap(
            fontSize: 22.w,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        //CREATION DES BOUTONS DE NAVIGATION AU TOP
        //MISE EN PLACE DE CONTENEUR GENERAL
        actions: [
          Container(
            height: 32.h,
            width: 36.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 3,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            //PREMIER BOUTON DE RECHERCHE
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 0.1.w, vertical: 0.1.h),
              child: IconButton(
                icon: Icon(Icons.search, color: Colors.black),
                onPressed: () {
                  // Ajoutez ici la logique de recherche
                },
              ),
            ),
          ),
          //DEUXIEME BOUTON FILTRE
          IconButton(
            icon: Icon(Icons.filter_list_alt, color: Colors.black),
            onPressed: () {
              // Ajoutez ici la logique de recherche
            },
          ),
        ],
      ),
      //CORPS DE CODE AVEC LE WIDGET GRIDVIEW POUR AFFICHER LES ELEMENTS DANS UNE GRILLE
      body: GridView(
        //MISE EN PLACE DE LA GRILLE ET DES ELEMENTS
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15.w,
          mainAxisSpacing: 15.h,
          childAspectRatio: 0.691.w,
        ),
        // APPELLE DE LA CLASS CATALOGCARD POUR AFFICHER LES ELEMENTS DANS LA GRILLE
        // POUR MODIFIER LES ELEMENTS DANS LA GRILLE, ON VA CHANGER LES PARAMETRES DANS DEMO_DATA, CATALOG_CARD ET MENU_ITEM
        children:
            demoData.map((item) => CatalogCard(catalogItem: item)).toList(),
      ),
    );
  }
}
