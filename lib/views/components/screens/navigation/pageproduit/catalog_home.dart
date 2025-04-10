import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:i_trade/views/components/screens/menu_item_model.dart';

class CatalogHome extends StatelessWidget {
  const CatalogHome({super.key, required this.catalogItem});
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
      child: Container(
        //MISE EN PLACE DE CONTENEUR
        color: Colors.grey.shade200,
        padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
        //AFFICHER LES PRODUITS LE RATION DE L'IMAGE DANS LE CONTENEUR
        //SELON LE RATION DE L'IMAGE ZOOM OU NON
        child: Column(
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
            SizedBox(height: 5),
            //MISE EN PLACE DE CONTENEUR DU NOM DU VENDEUR
            //APPELLE DE LA CLASS IMAGE'CATALOGITEM.NAME'
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
              alignment: AlignmentDirectional.topStart,
              child: Text(
                catalogItem.name,
                style: GoogleFonts.mPlusRounded1c(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 5),
            //MISE EN PLACE DE CONTENEUR POUR LA DESCRIPTION DU PRODUITS
            //APPELLE DE LA CLASS IMAGE'CATALOGITEM.DESCRIPTION'
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
              alignment: AlignmentDirectional.topStart,
              child: Text(
                catalogItem.description,
                style: GoogleFonts.oswald(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            //MISE EN PLACE DE CONTENEUR DU BOUTTON POUR AFFICHER LE PRIX
            //APPELLE DE LA CLASS IMAGE'CATALOGITEM.PRICE'
            //MISE EN PLACE DE GESTTION DE BOUTTON
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/my_produit_profil'),
              child: Container(
                padding: EdgeInsets.all(4),
                margin: EdgeInsets.fromLTRB(10, 0, 39, 0),
                alignment: AlignmentDirectional.topCenter,
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
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
