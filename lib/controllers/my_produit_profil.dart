import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:i_trade/views/components/button/my_elevated_button.dart';
import 'package:i_trade/views/components/screens/navigation/pageautres/catalog_phone.dart';
import 'package:i_trade/views/components/screens/navigation/pageautres/demo_data.dart';
import 'package:i_trade/views/components/screens/pagedetailsproduits/detailsproduits/list_product_page.dart';

class MyProduitProfil extends StatefulWidget {
  final Product product;
  const MyProduitProfil({super.key, required this.product});

  @override
  State<MyProduitProfil> createState() => _MyProduitProfilState();
}

class _MyProduitProfilState extends State<MyProduitProfil> {
  late PageController _pageController;
  late Timer _timer;
  int _currentPage = 0;
  final int _pageCount = 3;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    // Autoplay: change de page toutes les 3 secondes
    // timer pour que les images defile seules
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (!mounted) return;
      _currentPage = (_currentPage + 1) % _pageCount;
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 700),
        //styles animation de defilement
        curve: Curves.fastOutSlowIn,
      );
    });
  }

  // fonction pour faire defiler les images et afficher les images
  @override
  void dispose() {
    _timer.cancel();
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
            // mise en place du conteneur pour l'affichage de l'image
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                // taille des images
                height: 300.h,
                // cliprrect pour arrondir les bordes de l'image
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: PageView(
                    controller: _pageController,
                    children: [
                      Image.asset(widget.product.image, fit: BoxFit.cover),
                      Image.asset(widget.product.image, fit: BoxFit.cover),
                      Image.asset(widget.product.image, fit: BoxFit.cover),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 5.h),
            //mise en place des tailles du produit
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10.w),
                  child: Text(
                    // nom de la boutique
                    widget.product.name,
                    style: GoogleFonts.rubik(
                      fontSize: 18.sp,
                      //fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
                SizedBox(width: 5.w),
                // afffiche du logo shop
                Container(
                  padding: EdgeInsets.only(top: 2.h),
                  child: Icon(
                    Icons.storefront_outlined,
                    color: Theme.of(context).colorScheme.secondary,
                    size: 16.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 25.h),
            //Mise en page du texte derniers produits
            //  Mise en place de la partie description
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Text(
                widget.product.description,
                style: GoogleFonts.notoSans(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
            //Mise en page du texte derniers produits
            SizedBox(height: 15.h),
            //Ajout des boutons
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  // Mise en place des boutons et couleur pour voir si c'est neuf ou trocable
                  Row(
                    children: [
                      // bouton troc
                      MyElevatedButton(
                        text: 'Pas de troc',
                        onTap: () {},
                        onPressed: () {},
                      ),
                      //Espace entre les boutons
                      SizedBox(width: 15.w),
                      //debut du dexieme bouton
                      // bouton second main
                      MyElevatedButton(
                        text: 'Seconde main',
                        onTap: () {},
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //Espacement entre les boutons et les information du produits
            SizedBox(height: 30.h),
            Row(
              children: [
                Expanded(child: Divider(thickness: 1, color: Colors.grey)),
              ],
            ),
            SizedBox(height: 20.h),
            //infomation sur le produit
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Text(
                'Infomation sur le produit',
                style: GoogleFonts.rubik(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
            //Epacement entre le titre du produits et les information du produits
            SizedBox(height: 15.h),
            //infomation sur le produit
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Text(
                widget.product.detailsproduits,
                style: GoogleFonts.notoSans(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
            //Espacement entre la le texte et la barre du bas
            SizedBox(height: 30.h),
            // ligne d'espacement horizontale
            Row(
              children: [
                Expanded(child: Divider(thickness: 1, color: Colors.grey)),
              ],
            ),
            // fin de la ligne
            // espacement entre la ligne et la suite du texte
            SizedBox(height: 20.h),
            // mise en place de la partie pourrait vous interessez
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Text(
                "Pourrait vous interesser",
                style: GoogleFonts.rubik(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
            // espacement
            SizedBox(height: 20.h),
            // mise en place du conteneur pour modifier les articles qui pourrait vous interesser
            SizedBox(
              // taille du conteneur pour la partie pourrait vous interesser
              height: 250.h,
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
                    childAspectRatio: 1.5.w,
                  ),
                  // APPELLE DE LA CLASS CATALOGCARD POUR AFFICHER LES ELEMENTS DANS LA GRILLE
                  // POUR MODIFIER LES ELEMENTS DANS LA GRILLE, ON VA CHANGER LES PARAMETRES DANS DEMO_DATA, CATALOG_CARD ET MENU_ITEM
                  itemCount: demoData9.length,
                  itemBuilder:
                      (context, index) =>
                          CatalogAutres(catalogItem: demoData9[index]),
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
                  height: 150.h,
                  alignment: Alignment.center,
                  child: Text(
                    'Decouvrez des deals en or !!!',
                    style: GoogleFonts.rubik(
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
          ],
        ),
      ),
      //la partie du bas avec les deux boutons
      //le prix et appeler
      bottomNavigationBar: Container(
        // mise en place pour le conteneur des boutons
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0.h, 10.h, 5.h, 30.h),
              height: 50.h,
              width: 248.w,
              child: Flexible(
                child: ElevatedButton.icon(
                  onPressed:
                      () => Navigator.pushNamed(context, '/whatsapp_page'),
                  //icon: Icon(Icons.bus),
                  label: Text(
                    'Discuter: ${widget.product.price}',
                    style: GoogleFonts.notoSans(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    //padding: EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
              ),
            ),
            //SizedBox(width: 1.w),
            Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(0.h, 10.h, 0.h, 30.h),
                height: 50.h,
                width: 200.w,
                child: ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/call_page'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  child: Center(
                    child: Icon(Icons.call, color: Colors.white, size: 25.sp),
                  ),
                  //padding: EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
