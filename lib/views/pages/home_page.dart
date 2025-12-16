import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:i_trade/views/components/screens/auto_image_slider.dart';
import 'package:i_trade/views/components/screens/navigation/pageiphone/catalog_phone.dart';
import 'package:i_trade/views/components/screens/navigation/pageiphone/demo_data.dart';
import 'package:i_trade/views/components/screens/navigation/pagepc/catalog_phone.dart';
import 'package:i_trade/views/components/screens/navigation/pagepc/demo_data.dart';
import 'package:i_trade/views/components/screens/navigation/pagephone/catalog_phone.dart';
import 'package:i_trade/views/components/screens/navigation/pagephone/demo_data.dart';
import 'package:i_trade/views/components/screens/navigation/pageproduit/catalog_home.dart';
import 'package:i_trade/views/components/screens/navigation/pageproduit/demo_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Mise en place du conteneur des boutons et du appbar
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actionsPadding: EdgeInsets.fromLTRB(0.w, 5.h, 0.w, 10.h),
        //Creation des boutons de navigation au top
        title: Padding(
          padding: EdgeInsets.only(left: 5.w),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/admin_page');
              // Action lors du tap sur le titre
            },
            //mise en place du texte I-Trade
            child: Text(
              'iTrade',
              style: GoogleFonts.anton(
                fontSize: 24.sp,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ),
        //Ajout des boutons et mise en place des icones
        actions: [
          //Ajout de l'icone d'exclamation et du bouton
          Padding(
            padding: EdgeInsets.only(right: 5.w),
            child: IconButton(
              icon: FaIcon(
                FontAwesomeIcons.circleExclamation,
                size: 22.h,
                color: Theme.of(context).colorScheme.secondary,
              ),
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    return Container(
                      width: double.infinity,
                      height: 480.h,
                      color: Colors.white,
                      padding: EdgeInsets.only(top: 22.h, left: 15.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Avis de non responsabilité :',
                            style: GoogleFonts.anton(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.red,
                            ),
                          ),
                          SizedBox(height: 25.h),
                          Text(
                            "iTrade agit en tant que plateforme de mise en \nrelation pour faciliter les échanges et les achats \nentre utilisateurs. \nNous ne garantissons pas la qualité, le bon \nfonctionnement ou l'authenticité des appareils \néchangés ou vendus sur la plateforme. \n\nIl est de la responsabilité de chaque utilisateur de \nvérifier soigneusement l'état des produits avant de \nconclure une transaction. \niTrade décline toute responsabilité en cas de \ndéfaillance, de dommage ou de dysfonctionnement \ndes appareils échangés ou achetés vie l'application. \n\nSoyez vigilant et n'hésitez pas à poser des \nquestions et à tester les appareils avant d'acheter \nou d'effectuer un échange.",
                            style: GoogleFonts.oswald(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
                // Ajoutez ici la logique de recherche
              },
            ),
          ),
        ],
      ),
      //Fin de la appbar
      //Debut du body, appel du widget singleChildScrollView pour que la page scrolle
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              //Mise en place du caroussel la taille du conteneur du caroussel
              height: 200.h,
              child: PageView(
                //Appelle de la class MyImageSlider pour afficher le caroussel pour le slider
                controller: _pageController,
                children: [MyImageSlider()],
              ),
            ),
            //Espace entre le caroussel et le texte
            SizedBox(height: 20.h),
            //Mise en page du texte derniers produits
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Text(
                'Derniers produits',
                style: GoogleFonts.oswald(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            //MISE EN PLACE DE LA GRILLE SMARTPHONE
            //DEBUT DE LA GRILLE
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15.w,
                  mainAxisSpacing: 15.h,
                  childAspectRatio: 0.691.w,
                ),
                // APPELLE DE LA CLASS CATALOGCARD POUR AFFICHER LES ELEMENTS DANS LA GRILLE
                // POUR MODIFIER LES ELEMENTS DANS LA GRILLE, ON VA CHANGER LES PARAMETRES DANS DEMO_DATA, CATALOG_CARD ET MENU_ITEM
                itemCount: demoData2.length,
                itemBuilder:
                    (context, index) =>
                        CatalogHome(catalogItem: demoData2[index]),
              ),
            ),
            //Fin de la grille smartphone
            //Debut de la column de separation entre la 2eme grille et la 3eme grille
            SizedBox(height: 10.h),
            Stack(
              children: [
                Container(
                  //Mise en page de l'image et du texte sur l'image
                  width: double.infinity,
                  height: 180.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/phone1.png'),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black54,
                        BlendMode.darken,
                      ),
                    ),
                  ),
                ),
                //Mise ne plage du texte et du conteneur du texte
                Container(
                  height: 180.h,
                  alignment: Alignment.center,
                  child: Text(
                    'Decouvrez des deals en or !!!',
                    style: GoogleFonts.oswald(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
              //Fin de la column de separation
              //Debut du texte avant la grille
            ),
            SizedBox(height: 10.h),
            Container(
              padding: EdgeInsets.only(left: 10.h),
              child: Text(
                'Smartphones',
                style: GoogleFonts.oswald(
                  fontSize: 20.w,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            //Fin du texte Smartphone
            //Debut la grille smartphone
            SizedBox(height: 10.h),
            Container(
              //MISE EN PLACE DE CONTENEUR de la grille
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15.w,
                  mainAxisSpacing: 15.h,
                  childAspectRatio: 0.691.w,
                ),
                // APPELLE DE LA CLASS CATALOGCARD POUR AFFICHER LES ELEMENTS DANS LA GRILLE
                // POUR MODIFIER LES ELEMENTS DANS LA GRILLE, ON VA CHANGER LES PARAMETRES DANS DEMO_DATA, CATALOG_CARD ET MENU_ITEM
                itemCount: demoData3.length,
                itemBuilder:
                    (context, index) =>
                        CatalogPhone(catalogItem: demoData3[index]),
              ),
            ),
            //Fin de la grille smartphone
            SizedBox(height: 10.h),
            //Debut de la column de separation entre les grilles
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 180.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/fichephone1.png'),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black54,
                        BlendMode.darken,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 180.h,
                  alignment: Alignment.center,
                  child: Text(
                    "Du neuf, de l'occasion, du choix et \n              des economies !",
                    style: GoogleFonts.oswald(
                      fontSize: 25.w,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            //Fin de la column de separation
            SizedBox(height: 10.h),
            //Debut du texte IPHONE
            Container(
              padding: EdgeInsets.only(left: 10.w),
              child: Text(
                'Iphone',
                style: GoogleFonts.oswald(
                  fontSize: 20.w,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            //Fin du texte IPHONE
            SizedBox(height: 10.h),
            //Debut de la grille pour les iphone
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 5.w),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15.w,
                  mainAxisSpacing: 15.h,
                  childAspectRatio: 0.691.w,
                ),
                // APPELLE DE LA CLASS CATALOGCARD POUR AFFICHER LES ELEMENTS DANS LA GRILLE
                // POUR MODIFIER LES ELEMENTS DANS LA GRILLE, ON VA CHANGER LES PARAMETRES DANS DEMO_DATA, CATALOG_CARD ET MENU_ITEM
                itemCount: demoData4.length,
                itemBuilder:
                    (context, index) =>
                        CatalogIphone(catalogItem: demoData4[index]),
              ),
            ),
            //Fin de la grille
            SizedBox(height: 10.h),
            //Debut de la column de separation
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 180.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/ficheordinateur.png'),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black54,
                        BlendMode.darken,
                      ),
                    ),
                  ),
                ),
                //Mise en place du conteneur et le texte
                Container(
                  height: 180.h,
                  alignment: Alignment.center,
                  child: Text(
                    "Decouvrez des deals en or!!!",
                    style: GoogleFonts.oswald(
                      fontSize: 25.w,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            //Fin de la column de separation
            SizedBox(height: 10.h),
            //Debut du texte ordinateur
            Container(
              padding: EdgeInsets.only(left: 10.w),
              child: Text(
                'Ordinateur',
                style: GoogleFonts.oswald(
                  fontSize: 20.w,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            //Fin texte ordinateur
            SizedBox(height: 10.h),
            //Debut de la grille pour les pc
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15.w,
                  mainAxisSpacing: 15.h,
                  childAspectRatio: 0.691.w,
                ),
                // APPELLE DE LA CLASS CATALOGCARD POUR AFFICHER LES ELEMENTS DANS LA GRILLE
                // POUR MODIFIER LES ELEMENTS DANS LA GRILLE, ON VA CHANGER LES PARAMETRES DANS DEMO_DATA, CATALOG_CARD ET MENU_ITEM
                itemCount: demoData5.length,
                itemBuilder:
                    (context, index) =>
                        CatalogPc(catalogItem: demoData5[index]),
              ),
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
