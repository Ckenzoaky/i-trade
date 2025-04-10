import 'package:flutter/material.dart';
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
    //double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.fromLTRB(10, 0, 10, 10),
        title: Text(
          'I-Trade',
          style: GoogleFonts.asap(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 5,
        actions: [
          Container(
            padding: const EdgeInsets.all(0),
            margin: const EdgeInsets.all(0),
            child: Padding(
              padding: EdgeInsets.all(0),
              child: IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.circleExclamation,
                  size: 25,
                  color: Colors.black87,
                ),
                onPressed: () {
                  // Ajoutez ici la logique de recherche
                },
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(0),
            margin: const EdgeInsets.all(0),
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.circleUser,
                  size: 25,
                  color: Colors.black,
                ),
                onPressed: () {
                  // Ajoutez ici la logique de recherche
                },
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.27,
              child: PageView(
                controller: _pageController,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      top: 10,
                    ), // Ajoutez le padding ici(10),// Ajoutez le padding ici(10),
                    child: MyImageSlider(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Derniers produits',
                style: GoogleFonts.oswald(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
            //MISE EN PLACE DE LA GRILLE SMARTPHONE
            //DEBUT DE LA GRILLE
            SizedBox(height: 15),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  childAspectRatio: 0.6,
                  mainAxisSpacing: 15,
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
            SizedBox(height: height * 0.03),
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: height * 0.26,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/phone1.png'),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black45,
                        BlendMode.darken,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: height * 0.27,
                  alignment: Alignment.center,
                  child: Text(
                    'Decouvrez des deals en or !!!',
                    style: GoogleFonts.oswald(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
              //Fin de la column de separation
              //Debut du texte avant la grille
            ),
            SizedBox(height: height * 0.02),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Smartphones',
                style: GoogleFonts.oswald(
                  fontSize: 23,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            //Fin du texte Smartphone
            //Debut la grille iphone
            SizedBox(height: height * 0.02),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  childAspectRatio: 0.6,
                  mainAxisSpacing: 15,
                ),
                // APPELLE DE LA CLASS CATALOGCARD POUR AFFICHER LES ELEMENTS DANS LA GRILLE
                // POUR MODIFIER LES ELEMENTS DANS LA GRILLE, ON VA CHANGER LES PARAMETRES DANS DEMO_DATA, CATALOG_CARD ET MENU_ITEM
                itemCount: demoData3.length,
                itemBuilder:
                    (context, index) =>
                        CatalogPhone(catalogItem: demoData3[index]),
              ),
            ),
            //Fin de la grille iphone
            SizedBox(height: height * 0.03),
            //Debut de la column de separation entre les grilles
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: height * 0.26,
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
                  height: height * 0.27,
                  alignment: Alignment.center,
                  child: Text(
                    "Du neuf, de l'occasion, du choix et \n              des economies !",
                    style: GoogleFonts.oswald(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            //Fin de la column de separation
            SizedBox(height: height * 0.02),
            //Debut du texte IPHONE
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Iphone',
                style: GoogleFonts.oswald(
                  fontSize: 23,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            //Fin du texte IPHONE
            SizedBox(height: height * 0.03),
            //Debut de la grille pour les pc
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  childAspectRatio: 0.6,
                  mainAxisSpacing: 15,
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
            SizedBox(height: height * 0.03),
            //Debut de la column de separation
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: height * 0.26,
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
                Container(
                  height: height * 0.27,
                  alignment: Alignment.center,
                  child: Text(
                    "Decouvrez des deals en or!!!",
                    style: GoogleFonts.oswald(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            //Fin de la column de separation
            SizedBox(height: height * 0.02),
            //Debut du texte IPHONE
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Ordinateur',
                style: GoogleFonts.oswald(
                  fontSize: 23,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            //Fin du texte IPHONE
            SizedBox(height: height * 0.03),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  childAspectRatio: 0.6,
                  mainAxisSpacing: 15,
                ),
                // APPELLE DE LA CLASS CATALOGCARD POUR AFFICHER LES ELEMENTS DANS LA GRILLE
                // POUR MODIFIER LES ELEMENTS DANS LA GRILLE, ON VA CHANGER LES PARAMETRES DANS DEMO_DATA, CATALOG_CARD ET MENU_ITEM
                itemCount: demoData5.length,
                itemBuilder:
                    (context, index) =>
                        CatalogPc(catalogItem: demoData5[index]),
              ),
            ),
            SizedBox(height: height * 0.02),
          ],
        ),
      ),
    );
  }
}
