import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      backgroundColor: Color(0xffF5F6F9),
      appBar: AppBar(backgroundColor: Color(0xffF5F6F9)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 170.h,
              child: PageView(
                controller: _pageController,
                children: [
                  Image.asset(widget.product.image),
                  Image.asset(widget.product.image),
                  Image.asset(widget.product.image),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            //Mise en page du texte derniers produits
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10.h),
                  child: Text(
                    widget.product.name,
                    style: GoogleFonts.oswald(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54,
                    ),
                  ),
                ),
                SizedBox(width: 2.w),
                Container(
                  padding: EdgeInsets.only(top: 2.h),
                  child: Icon(
                    Icons.shopping_bag,
                    color: Colors.black54,
                    size: 12.w,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            //Mise en page du texte derniers produits
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Text(
                widget.product.description,
                style: GoogleFonts.lato(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
            ),
            //Mise en page du texte derniers produits
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
                        onTap: () => Navigator.pop(context),
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
                widget.product.detailsproduits,
                style: GoogleFonts.oswald(
                  fontSize: 14.w,
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
              height: 200.h,
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
      //la partie du bas avec les deux boutons
      //le prix et appeler
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 2.h),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0.h, 10.h, 5.h, 30.h),
              height: 40.h,
              width: 248.w,
              child: Flexible(
                child: ElevatedButton.icon(
                  onPressed:
                      () => Navigator.pushNamed(context, '/whatsapp_page'),
                  //icon: Icon(Icons.bus),
                  label: Text(
                    'Prix: ${widget.product.price}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    //padding: EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                  ),
                ),
              ),
            ),
            //SizedBox(width: 1.w),
            Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(0.h, 10.h, 0.h, 30.h),
                height: 40.h,
                width: 200.w,
                child: ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/call_page'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  child: Center(
                    child: Icon(Icons.call, color: Colors.white, size: 25.w),
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
