import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          //MISE EN PLACE DE L'IMAGE POUR LA PAGE ADMIN
          Center(
            child: Image.asset(
              'assets/images/google-pixel-9-pro-xl_9ny4.jpg',
              height: 250.h,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 15.h),
          //MISE EN PLACE DU TEXTE POUR LA PAGE ADMIN
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  'Administration !',
                  style: GoogleFonts.anton(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.secondary,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              // mise en place du texte d'information pour la page admin et le contact
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  "Si vous voulez un compte administrateur, veuillez \ncontacter le développeur de l'application.",
                  style: GoogleFonts.oswald(fontSize: 16.sp, color: Colors.red),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.deepPurple,
                        width: 2.w,
                      ),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.tertiary,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    labelText: 'Votre email',
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                SizedBox(height: 10.h),
                TextFormField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.deepPurple,
                        width: 2.w,
                      ),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.tertiary,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    labelText: 'Mot de passe',
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
                // espace entre le champ mot de passe et le bouton se connecter
                SizedBox(height: 40.h),
                // mise en place du bouton se connecter
                ElevatedButton(
                  onPressed: () {
                    // Action lors de la soumission du formulaire
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    padding: EdgeInsets.symmetric(
                      horizontal: 110.w,
                      vertical: 18.h,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  child: Text(
                    'Se connecter',
                    style: GoogleFonts.anton(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
                // mise en place du bouton retour a la page principale
                SizedBox(height: 10.h),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Retour à la page principale',
                    style: GoogleFonts.anton(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
