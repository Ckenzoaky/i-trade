import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:i_trade/views/components/button/my_elevated_button.dart';
import 'package:i_trade/views/components/screens/navigation/page_admin/espace_admi.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  // Creation de la liste des items qui vont se retouver dans categorie
  // creation de la liste
  String? value;
  final List<String> categoryitem = [
    'Android',
    'Iphone',
    'Pc',
    'Casque',
    'Console',
    'Montre',
    'Autre',
  ];

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
              MaterialPageRoute(builder: (context) => MyEspaceAdmi()),
            );
          },
        ),
        //mise en place du titre de la page
        //ici ajouter un produit
        title: Text(
          'Ajoutez un nouveau produit',
          style: GoogleFonts.rubik(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      //mise en place du body de la page
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 5.h),
          child: Column(
            //mise en place pour ajouter le texte ajouter l'image du produit ici
            children: [
              Text(
                //texte affiché ajouter l'image du produit ici
                textAlign: TextAlign.center,
                "Ajoutez une image",
                style: GoogleFonts.notoSans(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.tertiaryContainer,
                ),
              ),
              // separation entre le texte et le et le container ajouter l'image du produit ici
              SizedBox(height: 10.h),
              //container pour ajouter l'image du produit ici
              //ici on peut ajouter une image depuis la galerie ou prendre une photo
              Container(
                height: 180.h,
                width: 180.w,
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
              SizedBox(height: 10.h),
              Text(
                //texte affiché ajouter l'image du produit ici
                textAlign: TextAlign.center,
                "Nom de la Boutique",
                style: GoogleFonts.notoSans(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.tertiaryContainer,
                ),
              ),
              // espacement
              SizedBox(height: 10.h),
              // espacement et debut du nouveau conteneur
              //mise en place du conteneur de textfield
              // textfield pour le nom de la boutique
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
                    hintText: 'Nom de la Boutique',
                    hintStyle: GoogleFonts.rubik(
                      fontSize: 16.sp,
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              // fin du textfield pour la boutique
              // espacement
              SizedBox(height: 15.h),
              Text(
                //texte affiché ajouter le nom du produit
                textAlign: TextAlign.center,
                "Nom du Produit",
                style: GoogleFonts.notoSans(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.tertiaryContainer,
                ),
              ),
              SizedBox(height: 10.h),
              // espacment
              // debut du conteneur et du textfield du nom du produit
              // conteneur du textfield
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.tertiary,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                // debut du textfield Nom du produit
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Nom du Produit',
                    hintStyle: GoogleFonts.rubik(
                      fontSize: 16.sp,
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              // espacement
              // mise en place du texte categorie
              Text(
                //texte affiché ajouter le nom du produit
                textAlign: TextAlign.center,
                "Categorie du Produit",
                style: GoogleFonts.notoSans(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.tertiaryContainer,
                ),
              ),
              // espacement
              SizedBox(height: 10.h),
              // mise en place de la categorie du produit
              // ajouter la categorie du produit
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.tertiary,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                // affichage de la liste des items
                // les categories
                // mise en place du widget dropdownbutton pour affiche la liste de defillement
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    items:
                        categoryitem
                            .map(
                              (item) => DropdownMenuItem(
                                value: item,
                                child: Text(
                                  item,
                                  style: GoogleFonts.rubik(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                    onChanged:
                        ((value) => setState(() {
                          this.value = value;
                        })),
                    dropdownColor: Theme.of(context).colorScheme.secondary,
                    hint: Text('Choisis la Categorie'),
                    iconSize: 36.sp,
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    value: value,
                  ),
                ),
              ),
              // espacement
              SizedBox(height: 45.h),
              // mise en place du bouton ajouter un produit
              Column(
                children: [
                  MyElevatedButton(
                    text: 'Add Article',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyEspaceAdmi()),
                      );
                    },
                    onPressed: () {},
                    color: Colors.green,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
