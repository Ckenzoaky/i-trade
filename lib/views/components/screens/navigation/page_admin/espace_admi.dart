import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:i_trade/controllers/useradmi.dart';
import 'package:i_trade/views/components/button/my_elevated_button.dart';
import 'package:i_trade/views/components/screens/navigation/page_admin/add_product.dart';
import 'package:i_trade/views/pages/admin_page.dart';

class MyEspaceAdmi extends StatefulWidget {
  const MyEspaceAdmi({super.key});

  @override
  State<MyEspaceAdmi> createState() => _MyEspaceAdmiState();
}

class _MyEspaceAdmiState extends State<MyEspaceAdmi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // mise ne place du body ou corps de la page
      // pour utiliser deux couleurs dans le body pour deux effets background on utilise une colonne et une le widget Expanded
      body: Column(
        children: [
          //On met le widget Expanded pour pouvoir deviser
          // le body en deux parties ou plusieurs
          // la propriete flex pour donner la longueur de la partie
          // A l'interieur on met le widget child pour pouvoir mettre le widget Container
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25.r),
                  bottomRight: Radius.circular(25.r),
                ),
                color: Theme.of(context).colorScheme.primary,
              ),
              //mise place de la premiere partie
              //mise en place du user
              //appel de la classe userinfo
              child: Column(
                children: [
                  //espacement entre les deux parties
                  SizedBox(height: 50.h),
                  //classe userinfo
                  UserInfo(),
                  //espacement entre les deux parties
                  SizedBox(height: 20.h),
                  //espacement entre les deux parties
                  //mise en place du contenu mon espace
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Bienvenue dans votre espace \n              Administrateur',
                          style: GoogleFonts.rubik(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          //mise en place de la deuxiement partie
          // la couleur du theme
          SizedBox(height: 20.h),
          // deuxieme partie
          Expanded(
            flex: 2,
            child: Column(
              children: [
                //mise en place de la phrase
                Text(
                  'Que voulez vous faire ?',
                  style: GoogleFonts.rubik(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                // espacement entre le texte et les boutons
                SizedBox(height: 20.h),
                // mise en place des boutons
                Container(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // premier boutons
                      MyElevatedButton(
                        text: 'Add Article',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddProduct(),
                            ),
                          );
                        },
                        onPressed: () {},
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      //mise en place du deuxeme bouton
                      MyElevatedButton(
                        text: 'Modif / Supprimer',
                        onTap: () {},
                        onPressed: () {},
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ],
                  ),
                ),
                Spacer(),
                // mise en place du bouton deconnexion
                ElevatedButton(
                  onPressed: () {
                    // Action à effectuer lors du clic sur le bouton
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AdminPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    padding: EdgeInsets.symmetric(
                      horizontal: 100.w,
                      vertical: 14.h,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  child: Text(
                    'Se deconnecter',
                    style: GoogleFonts.anton(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
