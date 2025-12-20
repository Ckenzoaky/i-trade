import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:i_trade/views/components/screens/pageshop/catalog_card.dart';
import 'package:i_trade/views/components/screens/pageshop/demo_data.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xffF5F6F9),
      //BARRE DE NAVIGATION TOP
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actionsPadding: EdgeInsets.fromLTRB(0.w, 5.h, 0.w, 10.h),
        title: Text(
          'iStore',
          style: GoogleFonts.rubik(
            fontSize: 24.sp,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        //backgroundColor: Color(0xffF5F6F9),
        //CREATION DES BOUTONS DE NAVIGATION AU TOP
        //MISE EN PLACE DE CONTENEUR GENERAL
        actions: [
          //CONTENEUR POUR LE BOUTON DE RECHERCHE
          Container(
            margin: EdgeInsets.only(right: 10.w),
            height: 32.h,
            width: 36.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50.r),
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
              margin: EdgeInsets.symmetric(horizontal: 0.5.w, vertical: 0.5.h),
              child: IconButton(
                icon: Icon(Icons.search, color: Colors.black),
                onPressed: () {
                  // Ajoutez ici la logique de recherche
                },
              ),
            ),
          ),
          //DEUXIEME BOUTON FILTRE
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
          childAspectRatio: 0.65.w,
        ),
        // APPELLE DE LA CLASS CATALOGCARD POUR AFFICHER LES ELEMENTS DANS LA GRILLE
        // POUR MODIFIER LES ELEMENTS DANS LA GRILLE, ON VA CHANGER LES PARAMETRES DANS DEMO_DATA, CATALOG_CARD ET MENU_ITEM
        children:
            demoData.map((item) => CatalogCard(catalogItem: item)).toList(),
      ),
    );
  }
}
