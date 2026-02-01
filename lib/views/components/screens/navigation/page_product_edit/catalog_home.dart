import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:i_trade/views/components/screens/menu_item_model.dart';
import 'package:i_trade/views/components/screens/navigation/page_product_edit/list_product_page.dart';
class CatalogAdmi extends StatelessWidget {
  const CatalogAdmi({super.key, required this.catalogItem});
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
              '/my_produit_edit',
              arguments: Article(
                name: catalogItem.name,
                image: catalogItem.image,
                description: catalogItem.description,
              ),
            ),
        child: Container(
          //Mise en place des bordures du conteneur.
          // border radius et border color pour le conteneur de la carte
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.tertiaryContainer,
              //epaisseur de la bordure
              width: 2.w,
            ),
            borderRadius: BorderRadius.circular(10.r),
            color: Theme.of(context).colorScheme.secondaryContainer,
          ),
          //Mise en place du conteneur de la carte
          //Mise en place du padding du conteneur gauche et droite
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 5.h),
          //AFFICHER LES PRODUITS LE RATION DE L'IMAGE DANS LE CONTENEUR
          //SELON LE RATION DE L'IMAGE ZOOM OU NON
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 14 / 13,
                //MISE EN PLACE DE CONTENEUR DE L'IMAGE
                //APPELLE DE LA CLASS IMAGE'CATALOGITEM.IMAGE'
                //CLIPRRECT POUR ARRONDIR L'IMAGE
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0.r),
                  child: Image.asset(catalogItem.image, fit: BoxFit.cover),
                ),
              ),
              SizedBox(height: 5.h),
              //MISE EN PLACE DE CONTENEUR DU NOM DU VENDEUR
              //APPELLE DE LA CLASS IMAGE'CATALOGITEM.NAME'
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Text(
                  catalogItem.name,
                  style: GoogleFonts.rubik(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              //MISE EN PLACE DE CONTENEUR DU NOM DU VENDEUR
              //APPELLE DE LA CLASS IMAGE'CATALOGITEM.NAME'
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Text(
                  catalogItem.description,
                  style: GoogleFonts.rubik(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
