import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:i_trade/views/pages/admin_page.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //mise en place du bouton de retour
        //au niveau du abbar
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
              MaterialPageRoute(builder: (context) => AdminPage()),
            );
          },
        ),
        //mise en place du titre de la page
        //ici ajouter un produit
        title: Text(
          'Ajoutez un nouveau produit',
          style: GoogleFonts.anton(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.primary,
            letterSpacing: 1.2,
          ),
        ),
      ),
      //mise en place du body de la page
      body: Container(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
        child: Column(
          //mise en place pour ajouter le texte ajouter l'image du produit ici
          children: [
            Text(
              //texte affiché ajouter l'image du produit ici
              textAlign: TextAlign.center,
              "Ajoutez une image",
              style: GoogleFonts.roboto(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.tertiaryContainer,
              ),
            ),
            // separation entre le texte et le et le container ajouter l'image du produit ici
            SizedBox(height: 10.h),
            //container pour ajouter l'image du produit ici
            //ici on peut ajouter une image depuis la galerie ou prendre une photo
            Container(
              height: 200.h,
              width: 200.w,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.tertiary,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Icon(
                Icons.add_a_photo,
                size: 50.sp,
                color: Theme.of(context).colorScheme.secondaryContainer,
              ),
            ),
            //separation entre le container et le texte ajouter le nom de la boutique
            SizedBox(height: 15.h),
            Text(
              //texte affiché ajouter l'image du produit ici
              textAlign: TextAlign.center,
              "Ajoutez le nom de la boutique",
              style: GoogleFonts.roboto(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.tertiaryContainer,
              ),
            ),
            SizedBox(height: 10.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.tertiary,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Nom de la boutique',
                  hintStyle: GoogleFonts.oswald(
                    fontSize: 18.sp,
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w500,
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
