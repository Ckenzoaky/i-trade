import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:i_trade/views/components/screens/navigation/page_admin/espace_admi.dart';
import 'package:i_trade/views/components/screens/navigation/page_product_edit/catalog_home.dart';
import 'package:i_trade/views/components/screens/navigation/page_product_edit/demo_data.dart';

class EditDelettePage extends StatefulWidget {
  const EditDelettePage({super.key});

  @override
  State<EditDelettePage> createState() => _EditDelettePageState();
}

class _EditDelettePageState extends State<EditDelettePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // mise en place de l'appbar
      appBar: AppBar(
        //bouton de retour fleche
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Theme.of(context).colorScheme.primary,
          ),
          //l'action du bouton de retour
          //on utiliser le materialpageroute pour avoir une animation
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyEspaceAdmi()),
            );
          },
        ),
        // titre de l'appbar
        // mise en place du texte du titre et la decoration
        title: Text(
          // texte affiché dans l'appbar
          'Modif / Supprimer un Produit',
          style: GoogleFonts.rubik(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      // mise en place du body ou corps de la page
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            //Mise en page du texte Mes Articles
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Text(
                'Mes Articles',
                style: GoogleFonts.rubik(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            //Mise en place de la liste des derniers produit upload
            //Debut de la grille
            SizedBox(height: 15.h),
            //espacement en la grille et le texte
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15.w,
                  mainAxisSpacing: 15.h,
                  childAspectRatio: 0.73.w,
                ),
                // APPELLE DE LA CLASS CATALOGCARD POUR AFFICHER LES ELEMENTS DANS LA GRILLE
                // POUR MODIFIER LES ELEMENTS DANS LA GRILLE, ON VA CHANGER LES PARAMETRES DANS DEMO_DATA, CATALOG_CARD ET MENU_ITEM
                itemCount: demoDataEditDelette.length,
                itemBuilder:
                    (context, index) =>
                        CatalogAdmi(catalogItem: demoDataEditDelette[index]),
              ),
            ),
            //Fin de la grille les derniers produits
            // la grille des produits recents d'arrete ici
            // fin du body et des grilles
            // espacement
            SizedBox(height: 10.h),
            // espacment
            // fin
          ],
        ),
      ),
    );
  }
}
