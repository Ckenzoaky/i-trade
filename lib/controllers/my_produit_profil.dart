import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:i_trade/views/components/button/my_elevated_button.dart';
import 'package:i_trade/views/components/screens/navigation/pageautres/catalog_phone.dart';
import 'package:i_trade/views/components/screens/navigation/pageautres/demo_data.dart';
import 'package:i_trade/views/components/screens/pagedetailsproduits/sliderdetailsproduis/silder_produits.dart';

class MyProduitProfil extends StatefulWidget {
  const MyProduitProfil({super.key});

  @override
  State<MyProduitProfil> createState() => _MyProduitProfilState();
}

class _MyProduitProfilState extends State<MyProduitProfil> {
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
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200.h,
              child: PageView(
                controller: _pageController,
                children: [MyProduitSlider()],
              ),
            ),
            SizedBox(height: 10.h),
            //Mise en page du texte derniers produits
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Text(
                'KENZO SHOP',
                style: GoogleFonts.oswald(
                  fontSize: 16.w,
                  fontWeight: FontWeight.w300,
                  color: Colors.black54,
                ),
              ),
            ),
            SizedBox(height: 15.h),
            //Mise en page du texte derniers produits
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Text(
                'Playstation 5 Pro',
                style: GoogleFonts.lato(
                  fontSize: 17.w,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            //Ajout des boutons
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  // MISE EN PLACE DU BOUTON DE CONNEXION
                  Row(
                    children: [
                      MyElevatedButton(
                        text: 'Pas de troc',
                        onTap: () => Navigator.pushNamed(context, ""),
                        onPressed: () {},
                      ),
                      //Espace entre les boutons
                      SizedBox(width: 15.w),
                      //debut du dexieme bouton
                      MyElevatedButton(
                        text: 'Seconde main',
                        onTap: () => Navigator.pushNamed(context, ''),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //Espacement entre les boutons et les information du produits
            SizedBox(height: 10.h),
            //infomation sur le produit
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Text(
                'Infomation sur le produit',
                style: GoogleFonts.lato(
                  fontSize: 16.w,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                ),
              ),
            ),
            //Epacement entre le titre du produits et les information du produits
            SizedBox(height: 2.h),
            //infomation sur le produit
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Text(
                'Casque hyper x pour ordinateur, mobile et console \nVersion 2024',
                style: GoogleFonts.oswald(
                  fontSize: 16.w,
                  fontWeight: FontWeight.w300,
                  color: Colors.black54,
                ),
              ),
            ),
            //Espacement entre la le texte et la barre du bas
            //debut du texte et les deux barres qui separe un texte
            SizedBox(height: 5.h),
            Row(
              children: [
                Expanded(child: Divider(thickness: 2, color: Colors.grey)),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: FaIcon(FontAwesomeIcons.database),
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      'Detail du produit',
                      style: TextStyle(
                        fontSize: 16.w,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Expanded(child: Divider(thickness: 2, color: Colors.grey)),
              ],
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Text(
                "Pourrait vous interesser",
                style: TextStyle(
                  fontSize: 17.w,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            SizedBox(
              height: 170.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    crossAxisSpacing: 15.w,
                    mainAxisSpacing: 15.h,
                    childAspectRatio: 1.1.w,
                  ),
                  // APPELLE DE LA CLASS CATALOGCARD POUR AFFICHER LES ELEMENTS DANS LA GRILLE
                  // POUR MODIFIER LES ELEMENTS DANS LA GRILLE, ON VA CHANGER LES PARAMETRES DANS DEMO_DATA, CATALOG_CARD ET MENU_ITEM
                  itemCount: demoData6.length,
                  itemBuilder:
                      (context, index) =>
                          CatalogAutres(catalogItem: demoData6[index]),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            //affichage de l'image et du texte en barre
            Stack(
              children: [
                Container(
                  //Mise en page de l'image et du texte sur l'image
                  width: double.infinity,
                  height: 150.h,
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
                  height: 150.h,
                  alignment: Alignment.center,
                  child: Text(
                    'Decouvrez des deals en or !!!',
                    style: GoogleFonts.oswald(
                      fontSize: 25.w,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
              //Fin de la column de separation
              //Debut du texte avant la grille
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0.h, 2.h, 5.h, 30.h),
              height: 40.h,
              width: 248.w,
              child: Flexible(
                child: ElevatedButton.icon(
                  onPressed:
                      () => Navigator.pushNamed(context, '/whatsapp_page'),
                  //icon: Icon(Icons.bus),
                  label: Text(
                    "Discuter : 350 000 FCFA",
                    style: TextStyle(color: Colors.white, fontSize: 16.w),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    //padding: EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ),
            //SizedBox(width: 1.w),
            Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(0.h, 2.h, 0.h, 30.h),
                height: 40.h,
                width: 60.w,
                child: ElevatedButton.icon(
                  onPressed: () => Navigator.pushNamed(context, '/call_page'),
                  icon: Icon(Icons.call, color: Colors.white, size: 25.w),
                  label: Text(""),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    //padding: EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
