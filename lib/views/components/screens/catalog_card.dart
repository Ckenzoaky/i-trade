import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:i_trade/views/components/screens/menu_item_model.dart';

class CatalogCard extends StatelessWidget {
  const CatalogCard({super.key, required this.catalogItem});
  //LA FONCTION POUR AFFICHER LES PRODUITS
  final MenuItemModel catalogItem;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    //  final theme = Theme.of(context);
    return Card(
      //MISE EN PLACE DES CARACTERISTIQUES DE LA CARTE
      margin: EdgeInsets.zero,
      //MISE EN PLACE DE BORDURE ROND
      //WIGHT CLIP POUR ARRONDIR LE CONTENEUR DE LA CARTE
      clipBehavior: Clip.antiAlias,
      child: Container(
        //MISE EN PLACE DE CONTENEUR
        color: Colors.grey.shade200,
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.04,
          vertical: height * 0.015,
        ),
        //AFFICHER LES PRODUITS LE RATION DE L'IMAGE DANS LE CONTENEUR
        //SELON LE RATION DE L'IMAGE ZOOM OU NON
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 9 / 10,
              //MISE EN PLACE DE CONTENEUR DE L'IMAGE
              //APPELLE DE LA CLASS IMAGE'CATALOGITEM.IMAGE'
              //CLIPRRECT POUR ARRONDIR L'IMAGE
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(catalogItem.image, fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: height * 0.01),
            //MISE EN PLACE DE CONTENEUR DU NOM DU VENDEUR
            //APPELLE DE LA CLASS IMAGE'CATALOGITEM.NAME'
            Text(
              catalogItem.name,
              style: GoogleFonts.mPlusRounded1c(
                fontSize: width * 0.04,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: height * 0.01),
            //MISE EN PLACE DE CONTENEUR POUR LA DESCRIPTION DU PRODUITS
            //APPELLE DE LA CLASS IMAGE'CATALOGITEM.DESCRIPTION'
            Text(
              catalogItem.description,
              style: GoogleFonts.oswald(
                fontSize: width * 0.039,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: height * 0.021),
            //MISE EN PLACE DE CONTENEUR DU BOUTTON POUR AFFICHER LE PRIX
            //APPELLE DE LA CLASS IMAGE'CATALOGITEM.PRICE'
            //MISE EN PLACE DE GESTTION DE BOUTTON
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/my_produit_profil'),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.008,
                  vertical: height * 0.005,
                ),
                margin: EdgeInsets.only(right: width * 0.025),
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                //AFFICHER LE PRIX
                child: Text(
                  catalogItem.price,
                  style: GoogleFonts.asap(
                    fontSize: width * 0.04,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.01),
          ],
        ),
      ),
    );
  }
}
