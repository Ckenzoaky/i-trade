import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:i_trade/views/components/screens/menu_item_model.dart';
import 'package:i_trade/views/components/screens/pagedetailsproduits/detailsproduits/list_product_page.dart';

class CatalogIphone extends StatelessWidget {
  const CatalogIphone({super.key, required this.catalogItem});
  //LA FONCTION POUR AFFICHER LES PRODUITS
  final MenuItemModel catalogItem;

  @override
  Widget build(BuildContext context) {
    //  final theme = Theme.of(context);
    return Card(
      //MISE EN PLACE DES CARACTERISTIQUES DE LA CARTE
      margin: EdgeInsets.zero,
      //MISE EN PLACE DE BORDURE ROND
      //WIGHT CLIP POUR ARRONDIR LE CONTENEUR DE LA CARTE
      clipBehavior: Clip.antiAlias,
      child: GestureDetector(
        onTap:
            () => Navigator.pushNamed(
              context,
              '/my_produit_profil',
              arguments: Product(
                name: catalogItem.name,
                image: catalogItem.image,
                description: catalogItem.description,
                detailsproduits: catalogItem.detailsproduits,
                price: catalogItem.price,
              ),
            ),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.secondary,
              width: 2.w,
            ),
            borderRadius: BorderRadius.circular(20.0),
            color: Theme.of(context).colorScheme.secondaryContainer,
          ),
          //MISE EN PLACE DE CONTENEUR
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          //AFFICHER LES PRODUITS LE RATION DE L'IMAGE DANS LE CONTENEUR
          //SELON LE RATION DE L'IMAGE ZOOM OU NON
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 16 / 13,
                //MISE EN PLACE DE CONTENEUR DE L'IMAGE
                //APPELLE DE LA CLASS IMAGE'CATALOGITEM.IMAGE'
                //CLIPRRECT POUR ARRONDIR L'IMAGE
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(catalogItem.image, fit: BoxFit.cover),
                ),
              ),
              SizedBox(height: 2.h),
              //MISE EN PLACE DE CONTENEUR DU NOM DU VENDEUR
              //APPELLE DE LA CLASS IMAGE'CATALOGITEM.NAME'
              Text(
                catalogItem.name,
                style: GoogleFonts.anton(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              SizedBox(height: 3.h),
              //MISE EN PLACE DE CONTENEUR POUR LA DESCRIPTION DU PRODUITS
              //APPELLE DE LA CLASS IMAGE'CATALOGITEM.DESCRIPTION'
              Text(
                catalogItem.description,
                style: GoogleFonts.lato(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 5.h),
              //MISE EN PLACE DE CONTENEUR DU BOUTTON POUR AFFICHER LE PRIX
              //APPELLE DE LA CLASS IMAGE'CATALOGITEM.PRICE'
              //MISE EN PLACE DE GESTTION DE BOUTTON
              Text(
                catalogItem.price,
                style: GoogleFonts.anton(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.secondary,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
