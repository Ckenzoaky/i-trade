import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:i_trade/views/components/screens/auto_image_slider.dart';
import 'package:i_trade/views/components/screens/navigation/pageiphone/catalog_phone.dart';
import 'package:i_trade/views/components/screens/navigation/pageiphone/demo_data.dart';
import 'package:i_trade/views/components/screens/navigation/pagepc/catalog_phone.dart';
import 'package:i_trade/views/components/screens/navigation/pagepc/demo_data.dart';
import 'package:i_trade/views/components/screens/navigation/pageandroid/catalog_phone.dart';
import 'package:i_trade/views/components/screens/navigation/pageandroid/demo_data.dart';
import 'package:i_trade/views/components/screens/navigation/pageproduit/catalog_home.dart';
import 'package:i_trade/views/components/screens/navigation/pageproduit/demo_data.dart';
import 'package:i_trade/views/pages/boutique.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // mise en place pour le boutique boutique
  // le bouton de navigation
  List<IconData> navIcons = [Icons.storefront];
  // Nom du bouton
  List<String> navTitle = ["Shop"];
  //selection l'item store ou shop
  int selectedIndex = 0;

  // page controller pour le body
  // mise en page du PageController pour modifier les information et rentre la page dynamique
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
        // suppression du bouton de retour automatique
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
              'iTrad',
              style: GoogleFonts.rubik(
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ),
        //Ajout des boutons et mise en place des icones
        actions: [
          //Ajout de l'icone d'exclamation et du bouton
          // Ajout l'icone plus affichage du message
          Padding(
            padding: EdgeInsets.only(right: 5.w),
            child: IconButton(
              //icone
              icon: Icon(
                Icons.error_outline,
                size: 26.h,
                color: Theme.of(context).colorScheme.secondary,
              ),
              onPressed: () {
                // affichage du message d'avertissement et mise en place du conteneur
                // conteneur et propriete
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    // mise en place du conteneur la taille et la couleur
                    return Container(
                      width: double.infinity,
                      height: 400.h,
                      color: Colors.white,
                      padding: EdgeInsets.only(top: 20.h, left: 15.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //affichage du message
                          // titre du message
                          Text(
                            'Avis de non responsabilité :',
                            style: GoogleFonts.rubik(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.red,
                            ),
                          ),
                          SizedBox(height: 25.h),
                          // affiche du message
                          Text(
                            "iTrade agit en tant que plateforme de mise en \nrelation pour faciliter les échanges et les achats \nentre utilisateurs. \nNous ne garantissons pas la qualité, le bon \nfonctionnement ou l'authenticité des appareils \néchangés ou vendus sur la plateforme. \n\nIl est de la responsabilité de chaque utilisateur de \nvérifier soigneusement l'état des produits avant de \nconclure une transaction. \niTrade décline toute responsabilité en cas de \ndéfaillance, de dommage ou de dysfonctionnement \ndes appareils échangés ou achetés vie l'application. \n\nSoyez vigilant et n'hésitez pas à poser des \nquestions et à tester les appareils avant d'acheter \nou d'effectuer un échange.",
                            style: GoogleFonts.notoSans(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
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
      //Body du code
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              //Mise en place du caroussel la taille du conteneur du caroussel
              height: 230.h,
              child: PageView(
                //Appelle de la class MyImageSlider pour afficher le caroussel pour le slider
                controller: _pageController,
                children: [MyImageSlider()],
              ),
            ),
            //Espace entre le caroussel et le texte
            SizedBox(height: 20.h),
            //Mise en page du texte derniers produits
            // dernier produits en ligne
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Text(
                'Derniers produits',
                style: GoogleFonts.rubik(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            //Mise en place de la liste des derniers produit upload
            //Produit nouveau ou bien pour presenter
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
                  childAspectRatio: 0.65.w,
                ),
                // APPELLE DE LA CLASS CATALOGCARD POUR AFFICHER LES ELEMENTS DANS LA GRILLE
                // POUR MODIFIER LES ELEMENTS DANS LA GRILLE, ON VA CHANGER LES PARAMETRES DANS DEMO_DATA, CATALOG_CARD ET MENU_ITEM
                itemCount: demoDataDernierProduit.length,
                itemBuilder:
                    (context, index) =>
                        CatalogHome(catalogItem: demoDataDernierProduit[index]),
              ),
            ),
            //Fin de la grille les derniers produits
            // la grille des produits recents d'arrete ici
            //Debut de la column de separation entre la 1eme grille et la 2eme grille
            SizedBox(height: 20.h),
            // espacement
            // ici on mets le widget stack pour superposer les elements dans un conteneur
            // debut du conteneur de separation entre produit et smartphone
            Stack(
              children: [
                Container(
                  //Mise en page de l'image et du texte sur l'image
                  width: double.infinity,
                  height: 180.h,
                  decoration: BoxDecoration(
                    // ajout de l'image
                    image: DecorationImage(
                      image: AssetImage('assets/images/phone1.png'),
                      fit: BoxFit.cover,
                      // couleur filter c'est pour ajouter ou diminuer la luminositer
                      colorFilter: ColorFilter.mode(
                        Colors.black54,
                        BlendMode.darken,
                      ),
                    ),
                  ),
                ),
                //Mise en place du texte et du conteneur du texte
                Container(
                  height: 180.h,
                  alignment: Alignment.center,
                  //ajoute du texte
                  child: Text(
                    'Decouvrez des deals en or !!!',
                    style: GoogleFonts.rubik(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
              //fin
              //Fin de la column de separation
            ),
            //espacement
            SizedBox(height: 15.h),
            //espacement
            //Debut du texte avant la grille
            //Debut du conteneur et texte Smartphones
            Container(
              padding: EdgeInsets.only(left: 10.h),
              // Texte
              child: Text(
                'Smartphones',
                style: GoogleFonts.rubik(
                  fontSize: 20.w,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            //Fin du texte Smartphone
            //Espacement
            SizedBox(height: 15.h),
            //Especement
            //Debut la grille smartphone
            //Mise en place de la grille et la liste des smartphone (Android)
            Container(
              //Mise en place du conteneur de la grille
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              // la grille
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15.w,
                  mainAxisSpacing: 15.h,
                  childAspectRatio: 0.65.w,
                ),
                // APPELLE DE LA CLASS CATALOGCARD POUR AFFICHER LES ELEMENTS DANS LA GRILLE
                // POUR MODIFIER LES ELEMENTS DANS LA GRILLE, ON VA CHANGER LES PARAMETRES DANS DEMO_DATA, CATALOG_CARD ET MENU_ITEM
                itemCount: demoDataAndroid.length,
                itemBuilder:
                    (context, index) =>
                        CatalogPhone(catalogItem: demoDataAndroid[index]),
              ),
            ),
            //Fin
            //Fin de la grille smartphone
            SizedBox(height: 20.h),
            //Debut de la column de separation entre les grilles
            //Separation en la grille de smartphone et le conteneur avant iphone
            // stack c'est pour superposer les elements
            // debut de la column
            Stack(
              children: [
                // mise en place du conteneur de l'image
                Container(
                  width: double.infinity,
                  height: 180.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/fichephone1.png'),
                      fit: BoxFit.cover,
                      // assombrir ou rendre plus claire
                      colorFilter: ColorFilter.mode(
                        Colors.black54,
                        BlendMode.darken,
                      ),
                    ),
                  ),
                ),
                // conteneur du texte mise en place
                Container(
                  height: 180.h,
                  alignment: Alignment.center,
                  // texte
                  child: Text(
                    "Du neuf, de l'occasion, du \n choix et des economies!",
                    style: GoogleFonts.rubik(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            //fin
            //Fin de la column de separation
            // espacement
            SizedBox(height: 15.h),
            //Debut du texte IPHONE
            // conteneur iphone et mise en place
            Container(
              padding: EdgeInsets.only(left: 10.w),
              // texte
              child: Text(
                'Iphone',
                style: GoogleFonts.rubik(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            //Fin du texte IPHONE
            // espacement
            SizedBox(height: 15.h),
            // espacement
            //Debut de la grille pour les iphone
            // mise en place du conteneur et la grille des iphone
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 5.w),
              //grille
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15.w,
                  mainAxisSpacing: 15.h,
                  childAspectRatio: 0.65.w,
                ),
                // APPELLE DE LA CLASS CATALOGCARD POUR AFFICHER LES ELEMENTS DANS LA GRILLE
                // POUR MODIFIER LES ELEMENTS DANS LA GRILLE, ON VA CHANGER LES PARAMETRES DANS DEMO_DATA, CATALOG_CARD ET MENU_ITEM
                itemCount: demoDataIphone.length,
                itemBuilder:
                    (context, index) =>
                        CatalogIphone(catalogItem: demoDataIphone[index]),
              ),
            ),
            //Fin de la grille
            // fin
            // espacement
            SizedBox(height: 20.h),
            // espacement
            //Debut de la column de separation
            // grille de separation entre iphone et le conteneur avant PC
            // stack pour superposer les elements
            Stack(
              children: [
                // conteneur de l'image
                Container(
                  width: double.infinity,
                  // taille de l'image
                  height: 180.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/ficheordinateur.png'),
                      fit: BoxFit.cover,
                      // assombrir ou rendre claire le texte
                      colorFilter: ColorFilter.mode(
                        Colors.black54,
                        BlendMode.darken,
                      ),
                    ),
                  ),
                ),
                //Mise en place du conteneur et le texte
                // texte
                Container(
                  height: 180.h,
                  alignment: Alignment.center,
                  // texte
                  child: Text(
                    "Decouvrez des machines \n  d'occasion à bon prix!",
                    style: GoogleFonts.rubik(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            // fin de stack
            //Fin de la column de separation
            //espacement
            SizedBox(height: 15.h),
            // espacement
            //Debut du texte ordinateur
            // mise en place du conteneur des ordinateur
            Container(
              padding: EdgeInsets.only(left: 10.w),
              // texte
              child: Text(
                'Ordinateur',
                style: GoogleFonts.rubik(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            // fin
            //Fin texte ordinateur
            // espacement
            SizedBox(height: 15.h),
            // espacement
            //Debut de la grille pour les pc
            // mise en place de grille de des ordinateur
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              // grille
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15.w,
                  mainAxisSpacing: 15.h,
                  childAspectRatio: 0.65.w,
                ),
                // APPELLE DE LA CLASS CATALOGCARD POUR AFFICHER LES ELEMENTS DANS LA GRILLE
                // POUR MODIFIER LES ELEMENTS DANS LA GRILLE, ON VA CHANGER LES PARAMETRES DANS DEMO_DATA, CATALOG_CARD ET MENU_ITEM
                itemCount: demoDataPc.length,
                itemBuilder:
                    (context, index) =>
                        CatalogPc(catalogItem: demoDataPc[index]),
              ),
            ),
            //fin
            //fin de la grille ordinateur
            // fin du body et des grilles
            // espacement
            SizedBox(height: 15.h),
            // espacment
            // fin
          ],
        ),
      ),
      // fin du body
      // le bouton de boutique
      // on le met a l'exterieur du body pour qu'il reste en haut de tout
      // on appel directement le bouton
      floatingActionButton: Container(
        // mise en place du padding pour bouger un peu le bouton du bas
        padding: EdgeInsets.only(bottom: 46.h),
        // taille du conteneur ou se trouve l'icone
        height: 100.h,
        width: 60.w,
        child: FloatingActionButton(
          // couleur du bouton
          backgroundColor: Theme.of(context).colorScheme.primary,
          elevation: 6,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Boutique()),
            ); // ou ta page Shop
          },
          // appel de l'icone Boutique
          child: Icon(
            Icons.storefront,
            color: Theme.of(context).colorScheme.secondary,
            // taille de l'icon
            size: 34.sp,
          ),
        ),
      ),
      // pour centrer le bouton au milieu de la page
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
