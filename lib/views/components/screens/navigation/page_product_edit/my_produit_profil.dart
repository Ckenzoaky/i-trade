import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:i_trade/views/components/button/my_elevated_button.dart';
import 'package:i_trade/views/components/screens/navigation/page_admin/add_product.dart';
import 'package:i_trade/views/components/screens/navigation/page_admin/edit_delette/edit_delette_page.dart';
import 'package:i_trade/views/components/screens/navigation/page_product_edit/list_product_page.dart';

//ici on va creer la page de detail du produit
// la page qui va afficher les details du produit
class MyProduitEdit extends StatefulWidget {
  // on recupere l'article a afficher
  final Article article;
  const MyProduitEdit({super.key, required this.article});

  @override
  State<MyProduitEdit> createState() => _MyProduitEditState();
}

class _MyProduitEditState extends State<MyProduitEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              MaterialPageRoute(builder: (context) => EditDelettePage()),
            );
          },
        ),
      ),
      //le corps de la page
      //on utilise le singlechildscrollview pour pouvoir scroller la page
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // mise en place du conteneur pour l'affichage de l'image
            Padding(
              padding: EdgeInsets.all(10.h),
              child: SizedBox(
                // taille des images
                height: 300.h,
                // cliprrect pour arrondir les bordes de l'image
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: PageView(
                    children: [
                      Image.asset(widget.article.image, fit: BoxFit.cover),
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
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    // nom de la boutique
                    widget.article.name,
                    style: GoogleFonts.rubik(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
                //mise en du logo boutique
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
            SizedBox(height: 10.h),
            //Mise en page du texte derniers produits
            //  Mise en place de la partie description
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                widget.article.description,
                style: GoogleFonts.notoSans(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
            //epsacement entre la description et les boutons
            SizedBox(height: 15.h),
            //Ajout des boutons
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  SizedBox(height: 30.h),
                  // Mise en place des boutons et couleur pour voir si c'est neuf ou trocable
                  Row(
                    children: [
                      // bouton troc
                      MyElevatedButton(
                        text: 'Modifier',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddProduct(),
                            ),
                          );
                        },
                        onPressed: () {},
                        color: Colors.green,
                      ),
                      //Espace entre les boutons
                      SizedBox(width: 38.w),
                      //debut du dexieme bouton
                      // bouton second main
                      MyElevatedButton(
                        text: 'Supprimer',
                        onTap: () {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            barrierColor: Theme.of(
                              context,
                            ).colorScheme.primary.withValues(alpha: 0.7),
                            builder:
                                (context) => AlertDialog(
                                  actionsAlignment:
                                      MainAxisAlignment.spaceAround,
                                  backgroundColor:
                                      Theme.of(
                                        context,
                                      ).colorScheme.secondaryContainer,
                                  title: Center(
                                    child: Text(
                                      "Supprimer le Produit",
                                      style: GoogleFonts.rubik(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Theme.of(
                                              context,
                                            ).colorScheme.secondary,
                                      ),
                                    ),
                                  ),
                                  content: Padding(
                                    padding: EdgeInsets.only(bottom: 20.h),
                                    child: Text(
                                      "Vous êtes sûr de vouloir supprimer?",
                                      style: GoogleFonts.notoSans(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Theme.of(
                                              context,
                                            ).colorScheme.secondary,
                                      ),
                                    ),
                                  ),
                                  actions: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "Non",
                                        style: GoogleFonts.notoSans(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w700,
                                          color:
                                              Theme.of(
                                                context,
                                              ).colorScheme.secondary,
                                        ),
                                      ),
                                    ),
                                    // espacement entre les deux textes
                                    SizedBox(width: 20.w),
                                    // espacement entre les deux textes
                                    // mise en place du texte oui avec la gesture detector pour detecter le clique
                                    GestureDetector(
                                      onTap: () {
                                        // navigation vers la page modifier ou supprimer un produit
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (context) => EditDelettePage(),
                                          ),
                                        );
                                      },
                                      // mise en place du texte oui
                                      child: Text(
                                        "Oui",
                                        // mise en place du style du texte
                                        style: GoogleFonts.notoSans(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w700,
                                          color:
                                              Theme.of(
                                                context,
                                              ).colorScheme.primary,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                          );
                        },
                        onPressed: () {},
                        color: Colors.red,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //Espacement entre les boutons et les information du produits
            SizedBox(height: 30.h),
          ],
        ),
      ),
      //la partie du bas avec les deux boutons
      //le prix et appeler
    );
  }
}
